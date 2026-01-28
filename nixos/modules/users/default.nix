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
       "kvm"
       "scanner"
       "lp"
    ];
  };

  security.pam.loginLimits = [
   { domain = "garcia"; type = "soft"; item = "rtprio"; value = "99"; }
    { domain = "garcia"; type = "hard"; item = "rtprio"; value = "99"; }
  ];

  users.defaultUserShell = pkgs.zsh;
}
