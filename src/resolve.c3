module docgen;
import std::io;
import std::collections::map;
import std::collections::list;

macro todo() { unreachable("TODO: %s", $$FUNC); }

<*
 @require self.resolving_stage == UNRESOLVED
*>
fn void Module.resolve_imports(&self, Module* root)
{
	foreach (sec : self.sections)
	{
		assert(sec.resolving_stage == UNRESOLVED);
		foreach (unresolved_import : sec.unresolved_imports)
		{
			Module*? im = root.find_submodule_by_path(unresolved_import.path);
			if (catch im)
			{
				log::error("Unable to find module %s, it may not exist or it might not have been included in the parsed files", unresolved_import);
				continue;
			}
			sec.imports.push(new_import(
								mod: im,
								norecurse: unresolved_import.norecurse,
								public: unresolved_import.public,
							));
		}
		// NOTE: this won't actually free the memory since it's all part of the arena allocator
		sec.unresolved_imports.free();
		sec.resolving_stage = IMPORTS_RESOLVED;
	}
	self.resolving_stage = IMPORTS_RESOLVED;
}

<*
 @require self.is_root() || root != null : "resolve_imports_rec must be called on the root module or given the root module"
*>
fn void Module.resolve_imports_rec(&self, Module* root = null)
{
	root = root ?: self;
	self.@iter_all_children(; Module* m)
	{
		m.resolve_imports(root);
	};
}

// TODO: this doesn't belong in this file
<*
 @require self.resolving_stage.completed(IMPORTS_RESOLVED)
 @require !self.is_root()
*>
fn void Module.print_imports(&self) => @pool()
{
	io::printfn("%s imports:", self.get_name_string(tmem));
	foreach (i, sec : self.sections)
	{
		io::printfn("\tsection %s:", i + 1);
		foreach (im : sec.imports)
		{
			io::printfn("\t\t%s%s%s", im.mod.get_name_string(tmem), im.norecurse ? " @norecurse" : "", im.public ? " @public" : "");
		}
	}
}


// TODO: handle the case that a type is referenced with its module path or as a generic or whatever by not using a String directly and instead using some TypeName type
// TODO: require that everything has been resolved
<*
 @require self.resolving_stage.completed(IMPORTS_RESOLVED)
 @require !self.is_root()
*>
fn DocGenData*? Module.lookup_local_decl_by_name(&self, String name) => @pool()
{
	log::info("Looking up decl '%s' in module '%s'", name, self.get_name_string(tmem));
	// Priority 1: local definition/alias
	foreach (section : self.sections)
	{
		if (try val = section.lookup_local_decl_by_name(name)) return val;
	}

	// Priority 2: submodules

	// Priority 3: parent modules

	// Priority 4: manual imports
	// TODO
	/*foreach (section : self.sections)
	{
		section.lookup_imported_decl_by_name(name);
	}*/


	// Priority 5: std::core (possibly only if the current module isn't already under std::core, don't want infinite recursion)
	// TODO

	return NOT_FOUND~;
}


// TODO: require that everything has been resolved
<*
 @require self.resolving_stage.completed(IMPORTS_RESOLVED)
*>
fn DocGenData*? ModuleSection.lookup_local_decl_by_name(&self, String name)
{
	// TODO: make sure this is updated when I add new sections
	if (try val = self.structs.get_ref(name)) return val;
	// if (try val = self.bit_structs.get_ref(name)) return val;
	if (try val = self.functions.get_ref(name)) return val;
	// if (try val = self.globals.get_ref(name)) return val;

	return NOT_FOUND~;
}

// TODO: take an `any` instead of `Struct*`
// TODO: require that everything has been resolved
<*
 @require self.resolving_stage.completed(IMPORTS_RESOLVED)
 @require self.is_root()
*>
fn String[] Module.lookup_methods_on_decl_by_name(&self, Allocator alloc, Struct* decl) => @pool()
{
	log::info("looking up methods on %s from %s", decl.name, decl.parent_module_section.parent_module.get_name_string(tmem));

	self.@iter_all_children_exported_decls({"functions"}; DocGenData* func_decl)
	{
		Function* f = func_decl.as(Function);
		if (try method_of = f.method_type.get())
		{
			if (method_of.highlighted.len > 1)
			{
				// log::warn("unhandled generic type '%s'", method_of);
			}
			else if (decl.name == method_of.get_text())
			{
				// We want to make sure that this is the same decl and not something else with the same name
				if (f.parent_module_section.is_decl_accessable(decl))
				{
					log::info("Found method %s.%s in %s", decl.name, f.name, f.parent_module_section.parent_module.get_name_string(tmem));
				}
			}
		}
	};
/*	ModuleSection* parent_module_section = decl.parent_module_section;
	assert(parent_module_section.resolving_stage.completed(IMPORTS_RESOLVED)); // TODO: require that everything has been resolved

	Hsls methods;
	methods.tinit();

	parent_module_section.@iter_local_decls({"functions"}; DocGenData* local_decl)
	{
		Function* f = local_decl.as(Function);
		if (try method_of = f.method_type.get())
		{
			if (method_of.highlighted.len > 1)
			{
				log::warn("unhandled generic type '%s'", method_of);
			}
			else if (decl.name == method_of.get_text())
			{
				log::info("Found method %s.%s in %s", decl.name, f.name, f.parent_module_section.parent_module.get_name_string(tmem));
			}
		}
	};*/
	todo();
}

alias Hsls = HashMap {String, List {String}};

// TODO: replace most usages of these @iter_all_x macros with methods that instead search all of x and find something that matches

// TODO: handle @private and @local
macro void ModuleSection.@iter_local_decls(&self, $members = {"all"}; @body(DocGenData* decl))
{
	var $members1 = {} +++ $members;
	$if $members1[0] == "all":
		// TODO: make sure this is updated when I add new sections
		$members1 = {"structs",/* "bit_structs",*/ "functions", /*"globals"*/};
	$endif

	$foreach $member_name : $members1:
		self.$member_name.@each_entry(; entry)
		{
			// This ONLY works because the hashmap will never get reallocated after this, otherwise the pointer could become invalidated
			@body(&entry.value);
		};
	$endforeach
}

// TODO: handle @private and @local
<*
 These are the decls that are visible *inside* this module section
*>
macro void ModuleSection.@iter_accessable_decls(&self, String[*] $members = {"all"}; @body(DocGenData* decl))
{
	// Priority 1: local decls
	self.@iter_local_decls($members; DocGenData* decl)
	{
		@body(decl);
	};

	// Priority 2: submodules
	self.parent_module.@iter_all_children(; Module* mod)
	{
		if (@likely(mod != self.parent_module))
		{
			mod.@iter_exported_decls($members; DocGenData* decl)
			{
				@body(decl);
			};
		}
	};

	// Priority 3: parent modules
	self.parent_module.@each_parent(; Module* mod)
	{
		mod.@iter_exported_decls($members; DocGenData* decl)
		{
			@body(decl);
		};
	};

	// Priority 4: manual imports
	foreach (imported : self.imports)
	{
		// TODO: handle imported.public overriding visibility
		// TODO: handle exported decls that are shadowed by local decls by checking if they have the same name and skipping them
		imported.mod.@iter_exported_decls($members; DocGenData* decl)
		{
			@body(decl);
		};
		if (!imported.norecurse) imported.mod.@iter_all_children(; Module* submod)
		{
			if (submod != imported.mod)
			{
				submod.@iter_exported_decls($members; DocGenData* decl)
				{
					@body(decl);
				};
			}
		};
	}

	// Priority 5: std::core
	Module*? std_core = self.parent_module.get_root_module().find_submodule_by_path({"std", "core"});
	if (catch std_core) return;

	std_core.@iter_all_children_exported_decls($members; DocGenData* decl)
	{
		@body(decl);
	};
}

<*
 These are the decls that are exported from this module section
*>
macro void ModuleSection.@iter_exported_decls(&self, String[*] $members = {"all"}; @body(DocGenData* decl))
{
	// TODO: handle @private and @local
	self.@iter_local_decls($members; DocGenData* decl)
	{
		@body(decl);
	};
}

fn bool ModuleSection.is_decl_accessable(&self, DocGenData* decl)
{
	// TODO: I could make this *far* more efficient by making this index the module section hashmaps by the decls name directly instead of by iterating over all accessible decls
	self.@iter_accessable_decls(; DocGenData* other_decl)
	{
		// TODO: add name to DocGenData
		// if (other_decl.type == Struct) log::info("%s (%s) == %s (%s) from %s?", decl, decl.as(Struct).name, other_decl, other_decl.as(Struct).name, other_decl.as(Struct).parent_module_section.parent_module.get_name_string(tmem));
		if (decl == other_decl) return true;
	};
	return false;
}

<*
 These are the decls that are exported from all sections of this module
*>
macro void Module.@iter_exported_decls(&self, String[*] $members = {"all"}; @body(DocGenData* decl))
{
	foreach (sec : self.sections)
	{
		sec.@iter_exported_decls($members; DocGenData* decl)
		{
			@body(decl);
		};
	}
}

macro void Module.@iter_all_children_exported_decls(&self, String[*] $members = {"all"}; @body(DocGenData* decl))
{
	self.@iter_all_children(; Module* mod)
	{
		mod.@iter_exported_decls($members; DocGenData* decl)
		{
			@body(decl);
		};
	};
}


fn List {Function*} resolve_struct_methods(Struct s)
{
	todo();
}
