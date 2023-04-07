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
pane_focus_follows_mouse = false,
  mouse_bindings = mb,
--  leader = { key = 'VoidSymbol', timeout_milliseconds = 1000 },
  keys = {
--    {
--      key = 'c',
--      mods = 'CTRL|SHIFT',
--      action = wezterm.action.SpawnCommandInNewTab {
--        args = { 'zsh' },
--        cwd = '~'
--      },
--    },
    {
      key = 't',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.SpawnCommandInNewTab {
        args = { 'zsh' },
        cwd = '~'
      },
    },
    {
      key = 'f',
      mods = 'CTRL',
      action = wezterm.action.TogglePaneZoomState,
    },
--    {
--      key = 'p',
--      mods = 'LEADER',
--      action = act.ActivateTabRelative(-1),
--    },
--    {
--      key = 'n',
--      mods = 'LEADER',
--      action = act.ActivateTabRelative(1),
--    },
    {
      key = 'LeftArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivateTabRelative(-1),
    },
    {
      key = 'RightArrow',
      mods = 'CTRL|SHIFT',
      action = act.ActivateTabRelative(1),
    },
    {
      key = '2',
      mods = 'CTRL',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = '2',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
    {
      key = '5',
      mods = 'CTRL',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = '5',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'LeftArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Left',
    },
    {
      key = 'RightArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Right',
    },
    {
      key = 'UpArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Up',
    },
    {
      key = 'DownArrow',
      mods = 'CTRL',
      action = act.ActivatePaneDirection 'Down',
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
  font = wezterm.font 'JetBrains Mono',
}
