# Enable the rescue shell.
# NOTE: disabled by NixOS for security reasons.

{
  boot.kernelParams = [ "boot.shell_on_fail" ];
}
