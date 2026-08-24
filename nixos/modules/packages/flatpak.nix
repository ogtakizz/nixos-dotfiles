{ inputs, ... }:

{
  imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  services = {
    flatpak = {
      enable = true;
      remotes = [
        {
          name = "flathub";
          location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        }
      ];
      packages = [
        "com.heroicgameslauncher.hgl"
        "com.parsecgaming.parsec"
        "com.steamgriddb.steam-rom-manager"
        "dev.vencord.Vesktop"
        "io.mrarm.mcpelauncher"
        "net.lutris.Lutris"
        "org.telegram.desktop"
        "org.vinegarhq.Sober"
        "app.zen_browser.zen"
      ];
      update.onActivation = true;
    };
  };
}
