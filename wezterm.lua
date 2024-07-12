--finally cleaned it up a bit

local wezterm=require("wezterm")
local config={}

if wezterm.config_builder then
    config=wezterm.config_builder()
end

--generic settings
config.check_for_updates=true
config.color_scheme="sleepyhollow"
config.front_end="OpenGL"
config.default_cwd=wezterm.home_dir
config.enable_kitty_graphics=true
config.window_background_opacity=0.95
config.text_background_opacity=0.95
config.use_fancy_tab_bar=false
config.hide_tab_bar_if_only_one_tab=true

--font stuff
config.font=wezterm.font("Ubuntu Mono")
config.font_size=12.0
config.freetype_load_target="Light"
config.freetype_load_flags="NO_HINTING"
config.display_pixel_geometry="RGB"
config.warn_about_missing_glyphs=true
config.adjust_window_size_when_changing_font_size=false

config.window_padding={
    left=0,
    right=0,
    top=0,
    bottom=0
}

--keybinds
config.mouse_bindings={
    --get rid of the stupid copy on selection/highlight shit
    {event={Up={streak=1,button="Left"}},mods="NONE",action=wezterm.action.Nop}
}

config.keys={
    --switching tabs
    {key="LeftArrow",mods="SHIFT",action=wezterm.action.ActivateTabRelative(-1)},
    {key="RightArrow",mods="SHIFT",action=wezterm.action.ActivateTabRelative(1)},

    --creating and moving around panes
    {key="j",mods="CTRL|SHIFT",action=wezterm.action.SplitHorizontal{args={"bash"}}},
    {key="h",mods="CTRL|SHIFT",action=wezterm.action.SplitVertical{args={"bash"}}},
    {key="LeftArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Left")},
    {key="RightArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Right")},
    {key="UpArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Up")},
    {key="DownArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Down")},
}

return config
