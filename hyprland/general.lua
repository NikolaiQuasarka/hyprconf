hl.config {
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
    }
}
