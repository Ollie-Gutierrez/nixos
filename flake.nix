{
  description = "Aecyr's NixOS Configurations";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./flake
        ./hosts
      ];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    git-hooks.url = "github:cachix/git-hooks.nix";
  };
}