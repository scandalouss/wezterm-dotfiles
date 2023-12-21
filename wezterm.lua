local wezterm=require("wezterm")
local config={}

if wezterm.config_builder then
    config=wezterm.config_builder()
end

--config begins here

config={
    font=wezterm.font("UbuntuMono Nerd Font"),
    font_size=10.0,
    check_for_updates=false,
    color_scheme="sea-anemone",
    window_background_opacity=0.95,
    text_background_opacity=0.95,
    hide_tab_bar_if_only_one_tab=true,
    adjust_window_size_when_changing_font_size=false,
    use_fancy_tab_bar=false,
    front_end="OpenGL",
    freetype_load_target="Light",
    freetype_load_flags="DEFAULT|NO_AUTOHINT|NO_HINTING",
    display_pixel_geometry="BGR",
}

--config ends here

return config
