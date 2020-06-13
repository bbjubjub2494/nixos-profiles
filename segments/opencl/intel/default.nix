{ pkgs, ... }:

# Enable OpenCL for Intel GPUs

{
  hardware.opengl.extraPackages = with pkgs; [
    beignet
    intel-compute-runtime
  ];
}
