{ pkgs, ... }:

# Use less as a universal viz tool.

{
  environment.systemPackages = with pkgs; [ less ];
  environment.variables = {
    PAGER = "less";
    LESS = "-eRSX";  # e causes less to automatically exit when it reaches end-of-file.
                     # R causes less to let color sequences through.
                     # S causes less not to wrap long lines.
                     # X causes less not to clear the screen.
    LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
  };

  environment.shellAliases = {
    l = "less";
  };

  programs.fish.interactiveShellInit = builtins.readFile ./l.fish;
}
