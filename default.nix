{ withSystem, inputs, ... }:
let
  inherit (inputs.self) lib;
  inherit (lib) mkSystem;

  hosts = lib.attrsets.mapAttrs' (name: _: {
    name = name;
    value = mkSystem (import ./${name} // { modules = [ ./${name} ]; });
  }) (builtins.readDir ./.);
in
{
  flake.nixosConfigurations = hosts;
}
