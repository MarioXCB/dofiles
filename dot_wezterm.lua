local wezterm = require 'wezterm'
local act = wezterm.action


mb = {
}

for i = 1,99,1
do
  table.insert(mb,
  {
    event = { Down = { streak = i, button = 'Middle' } },
    mods = 'NONE',
    action = act.PasteFrom("PrimarySelection")
  })
  table.insert(mb, {
    event = { Down = { streak = i, button = 'Right' } },
       mods = 'NONE',
       action = wezterm.action_callback(function(window, pane)
         local has_selection = window:get_selection_text_for_pane(pane) ~= ''
         if has_selection then
           window:perform_action(
             act.CopyTo 'ClipboardAndPrimarySelection',
             pane
           )

           window:perform_action(act.ClearSelection, pane)
         else
           window:perform_action(act.PasteFrom("PrimarySelection"), pane)
         end
       end),
     })
end


return {
  default_cursor_style="BlinkingUnderline",
  cursor_blink_rate = 500,
  max_fps = 144,
  animation_fps = 60,
  enable_wayland = false,
  enable_tab_bar = false,
  pane_focus_follows_mouse = false,
  mouse_bindings = mb,
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    -- TAB MANAGEMENT
    {
      mods   = "ALT",
      key    = "t",
      --- Create new tab
      action = wezterm.action.SpawnTab "CurrentPaneDomain" 
    },
    {
      mods   = "ALT",
      key    = "w",
      --- Close current tab
      action = wezterm.action.CloseCurrentTab { confirm = false }
    },
    {
      mods   = "ALT",
      key    = "n",
      --- Switch Tab next
      action = wezterm.action.ActivateTabRelative(1)
    },
    {
      mods   = "ALT",
      key    = "b",
      action = wezterm.action.ActivateTabRelative(-1)
    },
    {
      mods   = "ALT",
      key    = "v",
      --- Split vertical
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain"}
    },
    {
      mods   = "ALT",
      key    = "h",
      --- Split horizontal
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain"}
    },
    {
      mods   = "ALT",
      key    = "q",
      --- Close current pane
      action = wezterm.action.CloseCurrentPane {confirm = false}
    },
    {
      mods   = "ALT",
      key    = "LeftArrow",
      action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
      mods   = "ALT",
      key    = "RightArrow",
      action = wezterm.action.ActivatePaneDirection "Right"
    },
    {
      mods   = "ALT",
      key    = "UpArrow",
      action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
      mods   = "ALT",
      key    = "DownArrow",
      action = wezterm.action.ActivatePaneDirection "Down"
    }
  },
  window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
  },
  window_frame = {
    border_left_width = '0.5cell',
    border_right_width = '0.5cell',
  },
  color_scheme = "shades-of-purple",
--  color_scheme = "Dracula",
  colors = {
   selection_bg = "rgba(50%,50%,50%,50%)"
  },
  window_background_opacity = 0.9,
  window_background_image = "/home/mariow/Pictures/wallpaper2.jpg",
  window_background_image_hsb = {
    brightness = 0.15,
    hue = 1.0
  },
  font = wezterm.font('JetBrains Mono', {weight = "Bold"}),
  font_size = 14
}
