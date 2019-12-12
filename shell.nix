let
  # use a pinned version of nixpkgs
  nixpkgs-version = "3140fa89c51233397f496f49014f6b23216667c2";
  nixpkgs = import (builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixpkgs-unstable";
    url = "https://github.com/nixos/nixpkgs/archive/${nixpkgs-version}.tar.gz";
    sha256 = "18p0d5lnfvzsyfah02mf6bi249990pfwnylwhqdh8qi70ncrk3f8";
  }) {};
in
  with nixpkgs; mkShell {
    buildInputs = [ nix-linter ];
  }
