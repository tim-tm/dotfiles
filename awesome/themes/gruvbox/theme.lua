-------------------------------
--  "gruvbox" awesome theme  --
--          By Tim T.        --
-------------------------------

local dpi = require("beautiful.xresources").apply_dpi
local config_dir = string.format("%s/.config/awesome", os.getenv("HOME"))
local wallpaper_path = string.format("%s/themes/gruvbox/wallpapers/1.png", config_dir)

local theme = {}

theme.wallpaper = wallpaper_path
theme.font = "JetBrainsMono Nerd Font Mono 9"

theme.fg_normal  = "#d4be98"
theme.fg_focus   = "#ddc7a1"
theme.fg_urgent  = "#ddc7a1"
theme.bg_normal  = "#141617"
theme.bg_focus   = "#1d2021"
theme.bg_urgent  = "#282828"
theme.bg_systray = theme.bg_normal

theme.useless_gap   = dpi(7)
theme.border_width  = dpi(1)
theme.border_normal = theme.bg_normal
theme.border_focus  = "#7c6f64"
theme.border_marked = "#504945"

theme.titlebar_bg_focus  = theme.bg_normal
theme.titlebar_bg_normal = theme.bg_normal

theme.mouse_finder_color = "#d3869b"

theme.menu_height = dpi(15)
theme.menu_width  = dpi(100)

theme.icon_font = "Noto Color Emoji"

return theme
