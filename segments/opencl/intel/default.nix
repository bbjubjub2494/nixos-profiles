{ pkgs, ... }:

# Enable OpenCL for Intel GPUs

{
  hardware.opengl.extraPackages = with pkgs; [
    beignet
    intel-compute-runtime
  ];

  environment.systemPackages = with pkgs; [
    ocl-icd  # for libOpenCL
  ];
}
