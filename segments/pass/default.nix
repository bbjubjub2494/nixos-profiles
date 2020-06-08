{ pkgs, ... }:

# Enable password-store.org secrets manager with OTP support.

{
  programs.browserpass.enable = true;

  environment.systemPackages = with pkgs; [
    pass-otp
  ];
}
