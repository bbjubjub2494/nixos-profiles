{ config, pkgs, ... }:

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

  programs.fish.interactiveShellInit = ''
    function l  --description "call less, smartly: if no argument is given and nothing is being piped in, list the current directory."
      if not set -q argv[1]; and isatty
        set argv[1] .
      end
      less $argv
    end
  '';
}
