{ config, pkgs, ... }:

{
  services.openssh = {
    enable = true;
    startWhenNeeded = true;

    # hardening
    permitRootLogin = "no";
    challengeResponseAuthentication = false;
    passwordAuthentication = false;
  };
}
