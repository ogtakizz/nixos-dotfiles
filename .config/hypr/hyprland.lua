----------------
--- MONITORS ---
----------------

hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "1366x768@60",
  position = "1920x0",
  scale = 1,
})


----------------
--- PROGRAMS ---
----------------

Terminal = "kitty"
FileManager = "thunar"
Browser = "brave"

-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
  hl.exec_cmd(terminal .. "&)")
  hl.exec_cmd("sleep 3 && dms run &")
  hl.exec_cmd("easyeffects &")
  hl.exec_cmd("swww-daemon")
  hl.dsp.exec_cmd(os.getenv("HOME") .. "/mysystem/scripts/start-gsr.sh")
end)


-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "12")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_CURRENT_SESSION", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("LANG", "pt_BR.UTF-8")
hl.env("LC_ALL", "pt_BR.UTF-8")


---------------------
--- LOOK AND FEEL ---
---------------------

hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 7,
    
    border_size = 0,

    col = {
      active_border = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45},
      inactive_border = "rgba(595959aa)",
    },

    resize_on_border = false,

    allow_tearing = false,

    layout = "dwindle",
  },

  decoration = {
    rounding = 8,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 0.9,

    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 8,
      passes = 2,
      vibrancy = 0.1696,
    },
  },
  
  animations = {
    enabled = true,
  },
})

hl.curve("easeOutQuint",    { type = "bezier", points = { {0.23, 1},    {0.32, 1}  } })
hl.curve("easeInOutCubic",  { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}  } })
hl.curve("linear",          { type = "bezier", points = { {0, 0},       {1, 1}     } })
hl.curve("almostLinear",    { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}  } })
hl.curve("quick",           { type = "bezier", points = { {0.15, 0},    {0.1, 1}   } })

hl.curve("easy",            { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644  })

hl.animation({ leaf = "global",         enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",         enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",        enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",      enabled = true, speed = 4.1,  spring = "easy",          style = "popin 87%" })
hl.animation({ leaf = "windowsOut",     enabled = true, speed = 1.49, bezier = "linear",        style = "popin 87%" })
hl.animation({ leaf = "fadeIn",         enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",        enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",           enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",         enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",       enabled = true, speed = 4,    bezier = "easeOutQuint",  style = "fade" })
hl.animation({ leaf = "layersOut",      enabled = true, speed = 1.5,  bezier = "linear",        style = "fade" })
hl.animation({ leaf = "fadeLayersIn",   enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",  enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",     enabled = true, speed = 1.94, bezier = "almostLinear",  style = "fade" })
hl.animation({ leaf = "workspacesIn",   enabled = true, speed = 1.21, bezier = "almostLinear",  style = "fade" })
hl.animation({ leaf = "workspacesOut",  enabled = true, speed = 1.94, bezier = "almostLinear",  style = "fade" })
hl.animation({ leaf = "zoomFactor",     enabled = true, speed = 7,    bezier = "quick" })

hl.config({
  dwindle = {
    preserve_split = true,
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})

--------------------
--- WINDOW RULES ---
--------------------

hl.window_rule({
    no_focus = true,
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
    },
})

hl.window_rule({
    suppress_event = "maximize",
    match = {
        class = ".*"
    },
})

hl.on("monitor.added", function(m)
  hl.exec_cmd("/home/garica/mysystem/start-gsr.sh")
end)

hl.on("monitor.removed", function(m)
  hl.exec_cmd("/home/garcia/mysystem/scripts/start-gsr.sh")
end)


-------------
--- INPUT ---
-------------

hl.config({
  input = {
    kb_layout = "us, br",
    kb_variant = "",
    kb_model = "",
    kb_options = "grp:win_space_toggle",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0,

    touchpad = {
      natural_scroll = false,
      disable_while_typing = false,
    },
  },
})

hl.gesture = {
  fingers = 3,
  direction = "horizontal",
  action = "workspace"
}

-------------
--- BINDS ---
-------------
dofile(os.getenv("HOME") .. "/.config/hypr/binds.lua")
