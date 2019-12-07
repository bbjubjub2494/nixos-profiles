{ config, pkgs, ... }:

{
  services.xserver.extraLayouts.custom = {
    description = "my own custom layout";
    symbolsFile = symbols/custom;
    languages = [ "en" ];
  };

  services.xserver.layout = "custom";
  services.xserver.xkbModel = "teck227";
}
