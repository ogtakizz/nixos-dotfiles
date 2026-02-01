{ ... }:

{
  xdg.configFile."wireplumber/wireplumber.conf.d/51-disable-suspension.conf".text = ''
    monitor.alsa.rules = [
      {
        matches = [
          {
            node.name = "~alsa_output.*"
          }
        ]
        actions = {
          update-props = {
            "session.suspend-on-idle" = false
            "api.alsa.disable-batch" = true
            "api.alsa.headroom" = 1024
          }
        }
      }
    ]
  '';
}
