{ config, pkgs, ... }:
# currently a no-op, but could be used again in the future.

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    let pname = if pkg ? pname then pkg.pname else (builtins.parseDrvName pkg.name).name;
    in builtins.elem pname [
      # list names of tolerated unfree packages
  ];
}
