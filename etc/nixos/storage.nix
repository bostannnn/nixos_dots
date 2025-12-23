# /etc/nixos/storage-pool.nix
{ ... }:
{
  fileSystems."/mnt/storage" = {
    device = "/dev/disk/by-uuid/e414ec48-c8ee-4779-8211-a2cc46116489";
    fsType = "btrfs";
    options = [ "bind" ];
  };
}
