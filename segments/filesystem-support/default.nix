{
  # support for lvm raid1
  boot.initrd.kernelModules = [ "dm-raid" ];

  boot.cleanTmpDir = true;
}
