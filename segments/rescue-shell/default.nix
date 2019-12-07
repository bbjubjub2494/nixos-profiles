{ config, pkgs, ... }:

{
  boot.kernelParams = [ "boot.shell_on_fail" ];
}
