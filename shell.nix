{ pkgs ? import <nixpkgs> { } }:

with pkgs; mkShell {
  buildInputs = [
    nix-linter
    (writeShellScriptBin "nix" ''
      ${nixFlakes}/bin/nix --option experimental-features "nix-command flakes ca-references" "$@"
    '')
    ];
}
