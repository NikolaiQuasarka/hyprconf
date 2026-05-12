-- require "variables"

local mainMod = "SUPER"
local left = "H"
local down = "J"
local up = "K"
local right = "L"

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(TERMINAL))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(
    mainMod .. " + Delete",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(MENU))
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
hl.bind(mainMod .. "+B", hl.dsp.exec_cmd(IPC .. " launcher clipboard"))
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
hl.bind(mainMod .. "+ ESCAPE", hl.dsp.exec_cmd(TERMINAL .. " " .. SYSTEM_MONITOR))

-- open hyprland config
hl.bind(mainMod .. "+N", hl.dsp.exec_cmd(EDITOR .. ' ~/.config/hypr/'))
