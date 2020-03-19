# Enable and configure captive-browser to log in to Hotel Wi-Fi.
# This segment assumes that brave is user-installed.

{
  programs.captive-browser = {
    enable = true;
    interface = "wlp2s0";
    browser = ''brave --user-data-dir=$HOME/.config/brave-captive --proxy-server="socks5://$PROXY" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost" --no-first-run --new-window --incognito http://cache.nixos.org/'';
  };
}
