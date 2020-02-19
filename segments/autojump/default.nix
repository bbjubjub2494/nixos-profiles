# Enable and configure autojump (shortcut for changing current directory)
#
# Also an additional keystroke saver: the home directory is in the CDPATH

{
  programs.autojump.enable = true;

  environment.variables.CDPATH = ["." "~"];
}
