# Tweaks needed to support my choice of filesystems.

{
  # support for LVM raid1
  boot.initrd.kernelModules = [ "dm-raid" ];

  boot.cleanTmpDir = true;
}
