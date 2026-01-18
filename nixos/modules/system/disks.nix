{ pkgs, ...}:

{
  fileSystems."/mnt/jogos_windows" = {
    device = "/dev/disk/by-uuid/455110F54AEDA354";
    fsType = "ntfs-3g";
    options = [
      "rw"
      "uid=1000"
      "gid=100"
      "umask=000"
      "exec"
      "nofail"
    ];
  };
}
