module docgen;
import std::collections::list;

macro todo() { unreachable("TODO: %s", $$FUNC); }

<*
 @require self.resolving_stage == UNRESOLVED
*>
fn void Module.resolve_imports(&self)
{
	todo();
}

fn List {Function*} resolve_struct_methods(Struct s)
{
	todo();
}
