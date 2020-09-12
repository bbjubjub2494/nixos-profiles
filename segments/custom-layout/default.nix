# Enable and configure my keyboard layout. (also on the tty!)

{
  services.xserver.extraLayouts.custom = {
    description = "my own custom layout";
    symbolsFile = symbols/custom;
    languages = [ "en" "fr" "de" ];
  };

  services.xserver.layout = "custom";
  services.xserver.xkbModel = "teck227";
}
