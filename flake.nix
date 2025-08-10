{
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
		c3c = {
			url = "github:c3lang/c3c";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = inputs:
	let
		pkgs = import inputs.nixpkgs {};
	in {
		devShells.${builtins.currentSystem}.default = pkgs.mkShellNoCC {
			# TODO: inputs.c3c.packages.${builtins.currentSystem}.c3c-debug doesn't know its own git hash
			packages = with pkgs; [ gcc gnumake valgrind gdb inputs.c3c.packages.${builtins.currentSystem}.default ];
			# For if I need to use raylib
			LD_LIBRARY_PATH = with pkgs; ''$LD_LIBRARY_PATH:${
				lib.makeLibraryPath [
					libGL
					xorg.libX11
				]
			}'';

		};
	};
}
