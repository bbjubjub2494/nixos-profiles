{
  description = "My collection of neatly organised NixOS settings.";

  inputs =
    {
      nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    };

  outputs = inputs@{ self, nixpkgs }:
    let
      system = "x86_64-linux";
    in
    {
      devShell."${system}" = import ./shell.nix {
        pkgs = nixpkgs.legacyPackages.${system};
      };

      nixosModules = {
        profiles = {
          workstation = import ./workstation.nix;
        };
      };
    };
}
