# My workstation setup with my preferences, user account, and favorite software properly set up.

{
  imports = [
      # Dependencies
      segments/common
      segments/allow-unfree

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
      segments/pass
      segments/gnupg
      segments/keybase
      segments/captive-browser
      segments/virtualbox
      segments/wireshark

      # Desktop Environment
      segments/fonts
      segments/x11
      segments/gnome3
      segments/sound

      # Extra Daemons & Services
      segments/cross-compilation
      segments/sign-store-paths
      segments/transmissiond
      segments/firewall
      segments/flakes
      segments/podman
      segments/sshd
      segments/lxd
      segments/jdk

      # Containers
      segments/torbox

      # Extra Hardware
      segments/usbblaster
      segments/opencl/intel
    ];
}
