nixos-profiles
==============

My collection of neatly organised NixOS settings.

structure
---------
*Segments* are modularised sets of logically-adjacent settings.
A segment may not import another segment, even if it depend on it.

*Profiles* import one or more segments to make a complete system coniguration.
Installer images can be built directly using them.
Using them as NixOS configuration however isn't possible since they lack filesystem hierarchy information as well as a couple other machine-specific things.
This is by design.
