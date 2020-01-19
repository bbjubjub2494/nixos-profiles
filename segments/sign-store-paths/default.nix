{pkgs, ... }:

# sign every built derivation with a machine-local key.
# generate with
# sudo nix-store --generate-binary-cache-key $(hostname) /etc/nix/key.{private,public}
# and add public key in the common segment

let
  postBuildHook = pkgs.writers.writeDash "sign-paths" ''
    set -f  # disable globbing
    export IFS=' '
    echo "Signing paths" $OUT_PATHS
    nix sign-paths --key-file /etc/nix/key.private $OUT_PATHS
  '';
in
{
  nix.extraOptions = "post-build-hook = ${postBuildHook}";
}
