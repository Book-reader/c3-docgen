{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		c3c = {
			url = "github:Book-reader/c3c/interfacelist";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = inputs:
	let
		pkgs = import inputs.nixpkgs {};
	in {
		devShells.${builtins.currentSystem}.default = pkgs.mkShellNoCC {
			packages = with pkgs; [ gcc gnumake valgrind gdb inputs.c3c.packages.${builtins.currentSystem}.default tree-sitter ];
		};
	};
}
