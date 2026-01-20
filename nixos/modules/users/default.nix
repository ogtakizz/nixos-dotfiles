{ pkgs, ... }:

{
  users.users.garcia = {
    isNormalUser = true;
    description = "garcia";
    extraGroups = [
       "networkmanager"
       "wheel"
       "audio"
       "video"
       "uinput"
       "libvirtd"
    ];
 };
  users.defaultUserShell = pkgs.zsh;
}
