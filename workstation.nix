# My workstation setup with my preferences, user account, and favorite software properly set up.

{
  imports = [
      # Dependencies
      ./common

      # Boot-critical Segments
      segments/bootloader
      segments/filesystem-support
      segments/boot-splash
      segments/rescue-shell

      # System Customization
      segments/cli-utils
      segments/pager
      segments/autojump
      segments/user
      segments/fish
      segments/trusted-machines

      # Localization
      segments/i18n
      segments/custom-layout

      # Programs
      segments/gnupg
      segments/wireshark

      # Desktop Environment
      segments/fonts
      segments/x11
      segments/gnome3
      segments/sound

      # Extra Daemons & Services
      segments/sign-store-paths
      segments/transmissiond
      segments/tord
      segments/sshd

      # Extra Hardware
      segments/usbblaster
    ];

  nesting.clone = [
    {
      imports = [
        # Containers
        segments/torbox
      ];
      boot.loader.grub.configurationName = "Torbox";
    }
  ];
}
