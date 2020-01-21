==============
nixos-profiles
==============
------------------------------------------------
My collection of neatly organised NixOS settings
------------------------------------------------

Structure
---------

*Segments* are modularised sets of logically-adjacent settings.
A segment may not import another segment, even if it depends on it.

*Profiles* import one or more segments to make a complete system coniguration.
Installer images can be built directly using them.
Using them as NixOS configuration however isn't possible since they lack filesystem hierarchy information as well as a couple other machine-specific things.
This is by design, see Usage_.

Usage
-----

The way I deploy these files is by symlinking my repository into /etc/nixos and importing a profile (usually ``workstation.nix``) from ``configuration.nix``. As a result, only the machine-specific information is kept in configuration.nix, which makes it nice and tidy.
The command ::

  sudo make install

can be used to make the symlink.

Linting
-------

nix-linter is used. Invoke it through ::

  nix-shell --run 'make lint'
