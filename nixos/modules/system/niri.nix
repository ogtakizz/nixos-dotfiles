{inputs, pkgs, ...}:

{
  programs.niri = {
    enable = false;
    package = inputs.niri-flake.packages.${pkgs.system}.niri-stable;
  };

  niri-flake.cache = {
    enable = true;
  };
  
}
