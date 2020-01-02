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

      # Extra Daemons
      segments/transmissiond
      segments/tord
      segments/sshd

      # Containers
      segments/torbox

      # Extra Hardware
      segments/usbblaster
    ];
}
