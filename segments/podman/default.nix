# Enable using OCI containers via PodMan
{
  virtualisation.oci-containers.backend = "podman";  # declaratively
  virtualisation.podman.enable = true;  # and imperatively
  virtualisation.podman.dockerCompat = true;
}
