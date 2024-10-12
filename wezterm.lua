--finally cleaned it up a bit

local wezterm=require("wezterm")
local smartsplits=wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local conf={}

if wezterm.conf_builder then
    conf=wezterm.config_builder()
end

--generic settings
conf.check_for_updates=true
conf.color_scheme="greenred"
conf.front_end="OpenGL"
conf.default_cwd=wezterm.home_dir
conf.default_workspace="home"
conf.enable_kitty_graphics=true
conf.window_background_opacity=0.90
conf.text_background_opacity=1.00
conf.use_fancy_tab_bar=false
conf.hide_tab_bar_if_only_one_tab=true
conf.default_cursor_style="BlinkingBlock"
conf.window_close_confirmation="NeverPrompt"

--font stuff
conf.font=wezterm.font("ubuntumono")
conf.font_size=11.0
conf.freetype_load_target="Light"
conf.freetype_load_flags="NO_HINTING"
conf.display_pixel_geometry="RGB"
conf.warn_about_missing_glyphs=true
conf.adjust_window_size_when_changing_font_size=false

--no padding
conf.window_padding={
    left=0,
    right=0,
    top=0,
    bottom=0
}

--keybinds
conf.mouse_bindings={
    --get rid of the stupid copy on selection/highlight shit
    {event={Up={streak=1,button="Left"}},mods="NONE",action=wezterm.action.Nop},
    {event={Up={streak=2,button="Left"}},mods="NONE",action=wezterm.action.Nop},
    {event={Up={streak=3,button="Left"}},mods="NONE",action=wezterm.action.Nop},
    --disabling copy on selection also disabled opening links with the cursor,
    --turning that back on with this cause it was driving me NUTS
    {event={Up={streak=1,button="Left"}},mods="NONE",action=wezterm.action.OpenLinkAtMouseCursor}
}

conf.keys={
    --switching tabs
    {key="LeftArrow",mods="SHIFT",action=wezterm.action.ActivateTabRelative(-1)},
    {key="RightArrow",mods="SHIFT",action=wezterm.action.ActivateTabRelative(1)},

    --creating and moving around panes
    {key="v",mods="SUPER|CTRL",action=wezterm.action.SplitHorizontal{args={"bash"}}},
    {key="h",mods="SUPER|CTRL",action=wezterm.action.SplitVertical{args={"bash"}}},
    {key="LeftArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Left")},
    {key="RightArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Right")},
    {key="UpArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Up")},
    {key="DownArrow",mods="CTRL",action=wezterm.action.ActivatePaneDirection("Down")},
    {key="l",mods="SUPER|CTRL",action=wezterm.action.RotatePanes"Clockwise"},
    {key="k",mods="SUPER|CTRL",action=wezterm.action.RotatePanes"CounterClockwise"},
    {key="q",mods="SUPER|CTRL",action=wezterm.action.CloseCurrentPane{confirm=true}},
    {key="e",mods="SUPER|CTRL",action=wezterm.action.AdjustPaneSize{"Up", 5}},
    {key="d",mods="SUPER|CTRL",action=wezterm.action.AdjustPaneSize{"Down", 5}},
    {key="f",mods="SUPER|CTRL",action=wezterm.action.AdjustPaneSize{"Right", 5}},
    {key="s",mods="SUPER|CTRL",action=wezterm.action.AdjustPaneSize{"Left", 8}},
}

smartsplits.apply_to_config(conf, {
    modifiers={
        move="CTRL",
        resize="CTRL|ALT"
    },
    direction_keys={
        move={"LeftArrow", "DownArrow", "UpArrow", "RightArrow",},
        resize={"s", "d", "e", "f",}
    }
})

return conf
