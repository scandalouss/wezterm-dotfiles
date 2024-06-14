--gonna clean this up hella later,
--just getting it to a working state atm
--it'll grow/get cleaned as necessary 
--or not, i'm not that picky

local wezterm=require("wezterm")
local config={}

if wezterm.config_builder then
    config=wezterm.config_builder()
end

config={
    font=wezterm.font("Ubuntu Mono"),
    font_size=10.0,
    check_for_updates=false,
    color_scheme="jellyfish",
    window_background_opacity=0.95,
    text_background_opacity=0.95,
    hide_tab_bar_if_only_one_tab=true,
    adjust_window_size_when_changing_font_size=false,
    use_fancy_tab_bar=false,
    front_end="OpenGL",
    freetype_load_target="Light",
    freetype_load_flags="NO_HINTING",
    display_pixel_geometry="RGB",
    warn_about_missing_glyphs=false,
    enable_kitty_graphics=true,

    window_padding={
        left=0,
        right=0,
        top=0,
        bottom=0,
    },

    keys={
        {
            key='LeftArrow',
            mods='SHIFT',
            action=wezterm.action.ActivateTabRelative(-1),
        },
        {
            key='RightArrow',
            mods='SHIFT',
            action=wezterm.action.ActivateTabRelative(1),
        },
        {
            key='j',
            mods='CTRL|SHIFT',
            action=wezterm.action.SplitHorizontal{
                args={'bash'}
            },
        },
        {
            key='h',
            mods='CTRL|SHIFT',
            action=wezterm.action.SplitVertical{
                args={'bash'}
            },
        },
        {
            key='LeftArrow',
            mods='CTRL',
            action=wezterm.action.ActivatePaneDirection 'Left',
        },
        {
            key='RightArrow',
            mods='CTRL',
            action=wezterm.action.ActivatePaneDirection 'Right',
        },
        {
            key='UpArrow',
            mods='CTRL',
            action=wezterm.action.ActivatePaneDirection 'Up',

        },
        {
            key='DownArrow',
            mods='CTRL',
            action=wezterm.action.ActivatePaneDirection 'Down'
        },
    }
}

return config
