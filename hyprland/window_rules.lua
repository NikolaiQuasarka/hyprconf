hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize"
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false
    },
    no_focus = true
})

hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true
})

hl.window_rule {
    name = "strawberry-worksapce9",
    match = {
        class = ".*strawberry.*"
    },
    workspace = 9
}

hl.window_rule {
    name = "telegram-special-workspace",
    match = {
        class = ".*(telegram|com.ayugram.desktop).*"
    },
    workspace = "special:magic"
}

hl.window_rule {
    name = "waydroid-fullscreen",
    match = {
        class = "(?i).*waydroid.*"
    },
    fullscreen = true
}

hl.window_rule {
    name = "floating-popup",
    match = {
        modal = true
    },
    float = true
}

hl.window_rule {
    name = "flameshot-window-fix",
    match = {
        class = ".*flameshot.*"
    },
    float = true,
    animation = "popin 100%"
}

hl.window_rule { name = "foliate-tile", match = { class = "Foliate" }, tile = true }

hl.window_rule {
    name = "modal-float",
    match = {
        modal = true
    },
    float = true
}

hl.window_rule {
    name = "dolphin-modal_floatin",
    match = { class = "org.freedesktop.impl.portal.desktop.kde" },
    float = true,
    size = { "(monitor_w*0.55)", "(monitor_h*0.35)" }
}

hl.window_rule {
    name = ".*Minecraft.*",
    match = {
        class = "minecraft"
    },
    immediate = false
}
