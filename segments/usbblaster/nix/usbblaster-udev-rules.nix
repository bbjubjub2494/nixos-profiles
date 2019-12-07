{ stdenv, writeText }:
  stdenv.mkDerivation {
    name = "usbblaster-udev-rules";

    udevRules = writeText "51-usbblaster.rules" ''
      # Intel FPGA Download Cable
      SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0664", GROUP="usbblaster"
      SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0664", GROUP="usbblaster"
      SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0664", GROUP="usbblaster"

      # Intel FPGA Download Cable II
      SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0664", GROUP="usbblaster"
      SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0664", GROUP="usbblaster"
    '';

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/etc/udev/rules.d
      cp $udevRules $out/etc/udev/rules.d/51-usbblaster.rules
    '';
  }
