# Enable and configure the friendly interactive shell.

{
  programs.fish = {
    enable = true;
    shellAliases = {
      e = "$EDITOR";
    };
    promptInit = builtins.readFile ./prompt_init.fish;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
}
