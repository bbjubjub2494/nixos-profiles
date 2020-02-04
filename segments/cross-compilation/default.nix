# Enable cross-compilation by emulating other architectures with binfmt.

{
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
}
