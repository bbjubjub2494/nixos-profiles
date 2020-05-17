# A reasonably lightweight QEMU VM with KDE

{
  imports = [
      # Dependencies
      segments/common

      # Boot-critical Segments
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

      # Desktop Environment
      segments/fonts
      segments/x11
      segments/kde5
      segments/sound

      # Extra Daemons & Services
      segments/firewall
      segments/sshd
      segments/jdk
    ];
}
