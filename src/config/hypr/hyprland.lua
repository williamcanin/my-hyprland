-- ===================================
--  Hyprland 0.55+ CONFIG
--  File: ~/.config/hypr/hyprland.lua
-- ===================================

-- Monitor -------------------------------------------------------------------------------------------------------------
hl.monitor({
  output = "", -- "" = any monitor
  mode = "preferred",
  position = "auto",
  scale = 1,
})

-- Environment variables -----------------------------------------------------------------------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Global configuration ------------------------------------------------------------------------------------------------
hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 10,
    border_size = 1,

    col = {
      active_border = "rgba(3aa99fff)",
      inactive_border = "rgba(303030ff)",
    },
    layout = "dwindle",
    allow_tearing = false,
  },

  group = {
    merge_groups_on_drag = true,
    col = {
      border_active = "rgba(3aa99fff)",
      border_inactive = "rgba(303030ff)",
      border_locked_active = "rgba(3aa99fff)",
      border_locked_inactive = "rgba(303030ff)",
    },

    groupbar = {
      enabled = true,
      font_size = 14,
      render_titles = false,
      text_color = "rgba(ffffffff)",
      col = {
        active = "rgba(3aa99fff)",
        inactive = "rgba(303030cc)",
        locked_active = "rgba(3aa99fff)",
        locked_inactive = "rgba(303030cc)",
      },
    },
  },

  decoration = {
    rounding = 8,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    fullscreen_opacity = 1.0,
    dim_inactive = false,
    dim_strength = 0.08,

    shadow = {
      enabled = true,
      range = 6,
      render_power = 2,
      color = 0xcc1a1a2e,
      color_inactive = 0x661a1a2e,
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      new_optimizations = true,
      xray = false,
      noise = 0.0,
      contrast = 0.9,
      brightness = 0.8,
      vibrancy = 0.1,
      ignore_opacity = false,
      popups = false,
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

  cursor = {
    no_hardware_cursors = 2,
    use_cpu_buffer = 2,
  },

  render = {
    new_render_scheduling = true,
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

-- Moving between windows
-- Using: snappy-switcher
----------------------------------------------------------------------------------------------
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
-- Groups all windows in the current workspace into tabs.
hl.bind(mod .. " + W", function()
  local active = hl.get_active_window()
  if not active then
    return
  end

  local ws = active.workspace.id

  hl.dispatch(hl.dsp.group.toggle())

  for _, w in ipairs(hl.get_windows()) do
    if w.workspace.id == ws and w.address ~= active.address then
      hl.dispatch(hl.dsp.focus({
        window = "address:" .. w.address,
      }))

      for _, dir in ipairs({ "l", "r", "u", "d" }) do
        pcall(function()
          hl.dispatch(hl.dsp.window.move({
            into_group = dir,
          }))
        end)
      end
    end
  end

  hl.dispatch(hl.dsp.focus({
    window = "address:" .. active.address,
  }))
end)

-- Navigate between tabs -----------------------------------------------------------------------------------------------
hl.bind(mod .. " + Tab", hl.dsp.group.next())

-- Navigate between windows --------------------------------------------------------------------------------------------
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

-- Turn the monitor off/on ---------------------------------------------------------------------------------------------
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("hyprctl dispatch 'hl.dsp.dpms(\"toggle\")'"))

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

-- Mode Resize Window (keyboard) ---------------------------------------------------------------------------------------
local _in_resize = false

hl.bind(mod .. " + R", function()
  local w = hl.get_active_window()
  if w == nil then
    return
  end

  -- Toggle off
  if _in_resize then
    _in_resize = false
    hl.dispatch(hl.dsp.submap("reset"))
    return
  end

  -- Only enter resize if window is floating
  if not w.floating then
    return
  end

  _in_resize = true
  hl.dispatch(hl.dsp.submap("resize"))
end)

hl.define_submap("resize", function()
  hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
  hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
  hl.bind("down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })
  hl.bind("up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })

  -- Move window
  hl.bind("SHIFT + right", hl.dsp.window.move({ x = 20, y = 0, relative = true }), { repeating = true })
  hl.bind("SHIFT + left", hl.dsp.window.move({ x = -20, y = 0, relative = true }), { repeating = true })
  hl.bind("SHIFT + down", hl.dsp.window.move({ x = 0, y = 20, relative = true }), { repeating = true })
  hl.bind("SHIFT + up", hl.dsp.window.move({ x = 0, y = -20, relative = true }), { repeating = true })

  -- Escape/Return: exits submap
  hl.bind("escape", function()
    _in_resize = false
    hl.dispatch(hl.dsp.submap("reset"))
  end)
  hl.bind("Return", function()
    _in_resize = false
    hl.dispatch(hl.dsp.submap("reset"))
  end)
end)

-- Mode Resize Window (witch mouse) -----------------------------------------------------------------------------------------
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
