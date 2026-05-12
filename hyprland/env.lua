-- require "hyprland/variables"

local envs = {
    { "XCURSOR_SIZE", "24" }, { "HYPRCURSOR_SIZE", "24" }, { "XDG_MENU_PREFIX", "arch-" },
    { "QT_QPA_PLATFORMTHEME", "kde" },
    { "XDG_SCREENSHOTS_DIR", "$HOME/Изображения/Снимки экрана" }, { "TERM", TERMINAL }
}

for _, pair in pairs(envs) do
    hl.env(pair[1], pair[2])
end
