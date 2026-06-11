-------------------
--- KEYBINDINGS ---
-------------------
local mainMod = "SUPER"

-- Desliga o monitor do notebook
hl.bind(mainMod .. " + M", hl.dsp.dpms({  action = 'disable', monitor = 'eDP-1' }))
-- Liga o monitor do notebook novamente
hl.bind(mainMod .. " + N", hl.dsp.dpms({  action = 'enable',  monitor = 'eDP-1' }))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy && wl-paste > ~/pics/Screenshot_$(date +%Y%m%d_%H%M%S).png]]))

hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("grim - | wl-copy"))

-- Salva o ultimo minuto gravado pela instancia rodando do gsr
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd(os.getenv("HOME") .. "/mysystem/scripts/saveClip.sh"))

-- Abre o terminal (kitty)
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(Terminal))

-- Abre o file manager (thunar)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FileManager))

-- Abre o navegador (brave)
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(Browser))

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
