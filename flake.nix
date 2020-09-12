{
  description = "My collection of neatly organised NixOS settings.";

  inputs =
    {
      nur.url = github:nix-community/NUR;
      nixos.url = "nixpkgs/nixos-20.03-small";
      nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    };

  outputs = inputs@{ self, nixos, nixpkgs, nur }:
    let
      system = "x86_64-linux";

      pkgImport = pkgs:
        import pkgs {
          inherit system;
        };

      pkgset = {
        osPkgs = pkgImport nixos;
        pkgs = pkgImport nixpkgs;
      };

    in
    with pkgset;
    {
      devShell."${system}" = import ./shell.nix {
        inherit pkgs;
      };

      nixosModules = {
        profiles = {
          workstation = import ./workstation.nix;
        };
      };
    };
}
