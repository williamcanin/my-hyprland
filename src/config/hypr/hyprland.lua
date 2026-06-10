-- ===================================
--  Hyprland 0.55+ CONFIG
--  GTX 750 Ti / driver Nouveau
--  File: ~/.config/hypr/hyprland.lua
-- ===================================

-- Monitor -------------------------------------------------------------------------------------------------------------
hl.monitor({
  output = "", -- "" = any monitor
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

-- Environment variables -----------------------------------------------------------------------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("MOZ_ENABLE_WAYLAND", "1")
-- Nouveau / GTX 750 Ti
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

-- Global configuration ------------------------------------------------------------------------------------------------
hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 10,
    border_size = 1,
    col = {
      active_border = {
        colors = { "rgba(3aa99fff)", "rgba(303030ff)" },
        angle = 45,
      },
      inactive_border = "rgb(303030)",
    },
    groupbar = {
      col = {
        active_border = {
          colors = { "rgba(3aa99fff)", "rgba(303030ff)" },
        },
      },
    },
    layout = "dwindle",
    allow_tearing = false,
  },

  decoration = {
    rounding = 8,
    rounding_power = 2,
    active_opacity = 0.98,
    inactive_opacity = 0.85,
    fullscreen_opacity = 1.0,
    dim_inactive = true,
    dim_strength = 0.08,

    shadow = {
      enabled = true,
      range = 20,
      render_power = 3,
      color = 0xcc1a1a2e,
      color_inactive = 0x661a1a2e,
    },

    blur = {
      enabled = true,
      size = 6,
      passes = 3,
      new_optimizations = true,
      xray = false,
      noise = 0.02,
      contrast = 0.9,
      brightness = 0.8,
      vibrancy = 0.1,
      ignore_opacity = false,
      popups = true,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },

  -- XWayland enabled/disabled
  xwayland = { enabled = false },

  input = {
    kb_layout = "br,us",
    kb_variant = "abnt2",
    kb_options = "grp:alt_shift_toggle",
    numlock_by_default = true,
    follow_mouse = 1,
    -- Mouse acceleration (disable)
    sensitivity = 0,
    accel_profile = "flat",
    --
    touchpad = {
      natural_scroll = false,
      tap_to_click = true,
      disable_while_typing = true,
      middle_button_emulation = true,
    },
  },
})

-- XWayland ------------------------------------------------------------------------------------------------------------
-- -- Prevent invisible XWayland ghost windows from stealing focus
-- -- Use with: xwayland = { enabled = true }
-- hl.window_rule({
--     match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
--     no_focus = true,
-- })

-- Animations ----------------------------------------------------------------------------------------------------------
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "default" })
hl.animation({
  leaf = "windows",
  enabled = true,
  speed = 5,
  bezier = "myBezier",
})
hl.animation({
  leaf = "windowsIn",
  enabled = true,
  speed = 5,
  bezier = "myBezier",
  style = "popin 80%",
})
hl.animation({
  leaf = "windowsOut",
  enabled = true,
  speed = 4,
  bezier = "smoothOut",
  style = "popin 80%",
})
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 5, bezier = "smoothIn" })
hl.animation({
  leaf = "fadeOut",
  enabled = true,
  speed = 4,
  bezier = "smoothOut",
})
hl.animation({
  leaf = "workspaces",
  enabled = true,
  speed = 5,
  bezier = "myBezier",
  style = "slide",
})

-- Window Rules (float) ------------------------------------------------------------------------------------------------
hl.window_rule({
  match = { class = ".*pwvucontrol.*" },
  float = true,
  size = "700 450",
})
hl.window_rule({ match = { class = ".*pavucontrol.*" }, float = true })
hl.window_rule({ match = { class = "org.gnome.FileRoller" }, float = true })
hl.window_rule({ match = { class = "org.gnome.Calculator" }, float = true })
hl.window_rule({ match = { class = "nm-connection-editor" }, float = true })
hl.window_rule({
  match = { class = "kitty", title = ".*nmtui.*" },
  float = true,
  size = "900 900",
})
hl.window_rule({ match = { class = "blueman-manager" }, float = true })
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })

-- Transparency at the terminals ---------------------------------------------------------------------------------------
hl.window_rule({ match = { class = "kitty" }, opacity = "0.90 0.85" })
hl.window_rule({ match = { class = "foot" }, opacity = "0.90 0.85" })
hl.window_rule({ match = { class = "Alacritty" }, opacity = "0.90 0.85" })

-- Keybindings =========================================================================================================

-- Variables -----------------------------------------------------------------------------------------------------------
local mod = "SUPER"

-- Moving between windows ----------------------------------------------------------------------------------------------
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))
hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_cmd("snappy-switcher prev --mod alt"))

-- Shortcuts -----------------------------------------------------------------------------------------------------------
hl.bind(mod .. " + SHIFT + slash", hl.dsp.exec_cmd("sh ~/.config/hypr/scripts/shortcuts.sh"))
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("kitty"))
hl.bind(mod .. " + Space", hl.dsp.exec_cmd("nautilus"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd('rofi -show drun -display-drun "drun"'))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SHIFT + space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + E", hl.dsp.layout("togglesplit"))

-- Tabbed windows ------------------------------------------------------------------------------------------------------

-- Navigate between windows---------------------------------------------------------------------------------------------
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window float ---------------------------------------------------------------------------------------------------
hl.bind(mod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Workspaces 1–9 ------------------------------------------------------------------------------------------------------
for i = 1, 9 do
  hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Volume --------------------------------------------------------------------------------------------------------------
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Brightness ----------------------------------------------------------------------------------------------------------
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- Multimidia ----------------------------------------------------------------------------------------------------------
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioStop", hl.dsp.exec_cmd("playerctl stop"))

-- Default browser -----------------------------------------------------------------------------------------------------
hl.bind(mod .. " + B", hl.dsp.exec_cmd("xdg-open https://"))

-- Screen recording ----------------------------------------------------------------------------------------------------
hl.bind(mod .. " + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh --video-full"))
hl.bind(mod .. " + SHIFT + G", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh --video-full-stop"))

-- Clipboard history ---------------------------------------------------------------------------------------------------
hl.bind(mod .. " + H", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -i -p Clipboard | cliphist decode | wl-copy"))
hl.bind(mod .. " + SHIFT + H", hl.dsp.exec_cmd('cliphist wipe && notify-send "Clipboard" "History erased!"'))

-- Screenshot / Print --------------------------------------------------------------------------------------------------
hl.bind("Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh --image-region"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh --image-window"))
hl.bind(mod .. " + SHIFT + Print", hl.dsp.exec_cmd("~/.config/hypr/scripts/screenshot.sh --image-full"))

-- Resize Window (mode float) ------------------------------------------------------------------------------------------
hl.bind(mod .. " + R", hl.dsp.submap("resize"))
-- Witch mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Emoji picker --------------------------------------------------------------------------------------------------------
hl.bind(mod .. " + period", hl.dsp.exec_cmd("rofimoji --action clipboard --clipboarder wl-copy --typer wtype"))

-- Color Picker --------------------------------------------------------------------------------------------------------
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))

-- Calculator ----------------------------------------------------------------------------------------------------------
hl.bind(mod .. " + C", hl.dsp.exec_cmd("rofi -show calc -modi calc -no-show-match -no-sort"))

-- Exit Hyprland -------------------------------------------------------------------------------------------------------
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd("~/.config/hypr/scripts/power-menu.sh"))

-- Lock session --------------------------------------------------------------------------------------------------------
hl.bind(mod .. " + L", hl.dsp.exec_cmd("~/.config/hypr/scripts/power-menu.sh --lock"))

-- Reload Hyprland -----------------------------------------------------------------------------------------------------
hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("sh ~/.config/hypr/scripts/init.sh --reload"))

-- Autostart -----------------------------------------------------------------------------------------------------------
hl.on("hyprland.start", function()
  hl.exec_cmd("sh ~/.config/hypr/scripts/init.sh --started")
end)
