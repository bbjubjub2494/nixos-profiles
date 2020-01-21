{ lib, pkgs, ... }:

# Configure the GUI to use visually pleasing fonts.

{
  fonts.fonts = with pkgs; [ source-code-pro libertinus ];

  fonts.fontconfig.defaultFonts = {
    monospace = lib.mkBefore [ "Source Code Pro" ];
    sansSerif = lib.mkBefore [ "Libertinus Sans" ];
    serif = lib.mkBefore [ "Libertinus Serif" ];
  };

  # lowercase numerals
  fonts.fontconfig.localConf = ''
  <match target="font">
    <edit name="fontfeatures" mode="append">
      <string>onum on</string>
    </edit>
  </match>
  '';
}
