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

local terminal = "kitty"
local fileManager = "thunar"
local browser = "brave"
local scriptsDir = "/home/garcia/mysystem/scripts/"


-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
  hl.exec_cmd(terminal .. "&)")
  hl.exec_cmd("dms run")
  hl.exec_cmd("easyeffects &")
  hl.exec_cmd("swww-daemon")
  hl.exec_cmd(scriptsDir .. "start-gsr.sh")
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
  hl.exec_cmd(scriptsDir .. "start-gsr.sh")
end)

hl.on("monitor.removed", function(m)
  hl.exec_cmd(scriptsDir .. "start-gsr.sh")
end)


-------------
--- INPUT ---
-------------

hl.config({
  input = {
    kb_layout = "us",
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

local function toggleMonitor(state)
  return function()
    hl.exec_cmd([[hyprctl keyword monitor "eDP-1, ]] .. state .. [["]])
  end
end

local mainMod = "SUPER"

-- Salva o ultimo minuto gravado pela instancia rodando do gsr
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(scriptsDir .. "saveClip.sh"))

-- Liga ou desliga o monitor do notebook, caso não esteja sendo usado
hl.bind(mainMod .. " + M", toggleMonitor("disable"))
hl.bind(mainMod .. " + N", toggleMonitor("enable"))

-- Abre o terminal (kitty)
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))

-- Abre o file manager (thunar)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

-- Abre o navegador (brave)
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

-- Fecha a janela em foco
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Comandos do dms
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("dms ipc call spotlight open"))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("dms ipc call clipboard open"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("dms ipc call powermenu toggle"))

--
--ToggleJanela Flutuante
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))

-- Move foco com maiMod + setinhas
hl.bind(mainMod .. " + left",   hl.dsp.focus({  direction = "left" }))
hl.bind(mainMod .. " + right",  hl.dsp.focus({  direction = "right" }))
hl.bind(mainMod .. " + up",     hl.dsp.focus({  direction = "up" }))
hl.bind(mainMod .. " + down",   hl.dsp.focus({  direction = "down" }))

-- Trocar de area de trabalho com mainMod + [0-9]
-- Mover a janela ativa para workspace com mainMod + [0-9]
for i = 1, 10 do
  local key = i % 10
  hl.bind(mainMod .. " + " .. key,          hl.dsp.focus({  workspace = i }))
  hl.bind(mainMod .. " + SHIFT + " .. key,  hl.dsp.window.move({   workspace = i }))
end

-- Scrollar por areas de trabalho existentes com mainMod + Scrollar
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({  workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({  workspace = "e-1" }))

-- Mover/Resize das janelas com mainMod + LMB/RMB e dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),    { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(),  { mouse = true })

-- Teclas de multimidia do notebook e brilho da tela
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
