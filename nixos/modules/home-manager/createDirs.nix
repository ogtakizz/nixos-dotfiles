{config, ...}:

let
  inherit (config.home) homeDirectory;
in 
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = false;

      templates = null;
      publicShare = null;

      desktop = homeDirectory;
      download = "${homeDirectory}/dl";
      documents = "${homeDirectory}/docs";
      pictures = "${homeDirectory}/pics";
      videos = "${homeDirectory}/vids";
      projects = "${homeDirectory}/docs/code";
    };
    configFile."user-dirs.locale".text = "en_US";
  };
}
