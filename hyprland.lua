-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")

------------------
---- MONITORS ----
------------------
hl.notification.create { text = "Lua config is used", duration = 500 }

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto"
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "kitty"
local fileManager = "dolphin"
local menu = "fuzzel"
-- local browser       = "zen-browser"
local systemMonitor = "btop"
local widgetSystem = "qs -c noctalia-shell" -- no-duplicate
local ipc = "qs -c noctalia-shell ipc call"
local editor = "zeditor"
local notifySystem = "swaync"

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
    hl.exec_cmd(widgetSystem)
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("kbuildsycoca6")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("systemctl start --user app-Flameshot@autostart.service")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_MENU_PREFIX", "arch-")
hl.env("QT_QPA_PLATFORMTHEME", "kde")
hl.env("XDG_SCREENSHOTS_DIR", "$HOME/Изображения/Снимки экрана")
hl.env("TERM", terminal)

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = {
                colors = {
                    "rgba(26,152,255,1)",
                    "rgba(219,50,196,0.4)",
                    "rgba(72,213,185,0.5)",
                    "rgba(140,100,249,0.8)"
                },
                angle = 40
            },
            inactive_border = "rgba(595959aa)"
        },
        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,
        layout = "dwindle"
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        --- inactive_opacity = 1.0,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a
        },
        blur = {
            enabled = true,
            size = 8,
            passes = 5
            --- vibrancy = 0.1696,
        }
    },
    animations = {
        enabled = true
    },
    input = {
        kb_layout = "us,ru",
        kb_variant = "",
        kb_model = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0.2, -- -1.0 - 1.0, 0 means no modification.
        repeat_delay = 300,
        touchpad = {
            natural_scroll = true
        }
    }
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
-- name  = "no-gaps-wtv1",
-- match = { float = false, workspace = "w[tv1]" },
-- border_size = 0,
-- rounding    = 0,
-- })
-- hl.window_rule({
-- name  = "no-gaps-f1",
-- match = { float = false, workspace = "f[1]" },
-- border_size = 0,
-- rounding    = 0,
-- })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        -- pseudotile = true,     --- Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true -- You probably want this
    }
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master"
    }
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true
    }
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false -- If true disables the random hyprland logo / anime girl background. :(
    }
})

-- gestures
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local left = "H"
local down = "J"
local up = "K"
local right = "L"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(
    mainMod .. " + Delete",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", function ()
    local active_window = hl.get_active_window()

    if not active_window then
        return
    end

    local actions = {
        hl.dsp.window.resize { x = 1920 * 0.3, y = 1200 * 0.3 }, hl.dsp.window.pin(),
        hl.dsp.window.move { direction = "u" }, hl.dsp.window.move { direction = "r" }
    }

    local is_floating = active_window.floating
    local is_pinned = active_window.pinned

    if is_floating then
        if not is_pinned then
            for _, action in pairs(actions) do
                hl.dispatch(action)
            end
        else
            hl.dispatch(hl.dsp.window.float { action = "off" })
        end
        return
    end

    table.insert(actions, 1, hl.dsp.window.float {})

    for _, action in pairs(actions) do
        hl.dispatch(action)
    end
end)
hl.bind(mainMod .. " + U", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. "+B", hl.dsp.exec_cmd(ipc .. " launcher clipboard"))
hl.bind(mainMod .. "+bracketright", hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + " .. left, hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + " .. down, hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + " .. up, hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + " .. right, hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move to available workspace
hl.bind(mainMod .. "+A", hl.dsp.focus { workspace = "empty" })
hl.bind(mainMod .. "+SHIFT+A", hl.dsp.window.move { workspace = "empty" })

-- Fulscreen
hl.bind(mainMod .. "+F", hl.dsp.window.fullscreen())

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
    "XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 3%+"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Move
hl.bind(mainMod .. "+ SHIFT" .. "+" .. left, hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. "+ SHIFT" .. "+" .. down, hl.dsp.window.move({ direction = "d" }))
hl.bind(mainMod .. "+ SHIFT" .. "+" .. up, hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. "+ SHIFT" .. "+" .. right, hl.dsp.window.move({ direction = "r" }))

-- Resize
hl.bind(mainMod .. "+ CTRL" .. " + " .. left, hl.dsp.window.resize { x = -70, y = 0, relative = true }, {
    repeating = true
})
hl.bind(mainMod .. "+ CTRL" .. " + " .. down, hl.dsp.window.resize { x = 0, y = 50, relative = true }, {
    repeating = true
})
hl.bind(mainMod .. "+ CTRL" .. " + " .. up, hl.dsp.window.resize { x = 0, y = -50, relative = true }, {
    repeating = true
})
hl.bind(mainMod .. "+ CTRL" .. " + " .. right, hl.dsp.window.resize { x = 70, y = 0, relative = true }, {
    repeating = true
})

-- player
hl.bind("ALT" .. "+ R", hl.dsp.exec_cmd("playerctl play-pouse"))

-- screenshots
local user = os.getenv("USER")
local flameshot_dir = "/home/" .. user .. "/Изображения/Снимки экрана/"
hl.bind("F12", hl.dsp.exec_cmd('flameshot screen -c -p' .. ' "' .. flameshot_dir .. '"'))
hl.bind("CTRL" .. "+ F12", hl.dsp.exec_cmd("flameshot gui"))

-- system monitor
hl.bind(mainMod .. "+ ESCAPE", hl.dsp.exec_cmd(terminal .. " " .. systemMonitor))

-- open hyprland config
hl.bind(mainMod .. "+N", hl.dsp.exec_cmd(editor .. ' ~/.config/hypr/'))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize"
})
-- suppressMaximizeRule:set_enabled(false)

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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
-- name  = "no-anim-overlay",
-- match = { namespace = "^my-overlay$" },
-- no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
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
