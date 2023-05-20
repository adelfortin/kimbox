local c = require("kimbox.lualine").colors()

---@class KimboxLualineConfig
local kimbox = {
    normal = {
        a = {fg = c.blue3, bg = c.blue1, gui = "bold"},
        b = {fg = c.blue3, bg = c.blue2},
        c = {fg = c.blue1, bg = c.blue3},
        x = {fg = c.blue1, bg = c.blue3},
        y = {fg = c.blue3, bg = c.blue2, gui = "bold"},
        z = {fg = c.blue3, bg = c.blue1, gui = "bold"}
    },
    command = {
        a = {fg = c.purple3, bg = c.purple1, gui = "bold"},
        b = {fg = c.purple1, bg = c.purple3},
        c = {fg = c.purple1, bg = c.purple3},
        x = {fg = c.purple3, bg = c.purple2}
    },
    inactive = {
        a = {fg = c.red, bg = c.bg},
        b = {fg = c.magenta, bg = c.bg}
    },
    insert = {
        a = {fg = c.green, bg = c.bg, gui = "bold"},
        b = {fg = c.fg, bg = c.bg},
        c = {fg = c.fg, bg = c.bg2},
        x = {fg = c.fg, bg = c.bg},
        y = {fg = c.green, bg = c.bg, gui = "bold"},
        z = {fg = c.green, bg = c.bg, gui = "bold"}
    },
    replace = {
        a = {fg = c.red3, bg = c.red1, gui = "bold"},
        b = {fg = c.red3, bg = c.red2},
        c = {fg = c.red2, bg = c.red3},
        x = {fg = c.red2, bg = c.red3}
    },
    terminal = {
        a = {fg = c.yellow, bg = c.bg, gui = "bold"},
        b = {fg = c.fg, bg = c.bg},
        c = {fg = c.fg, bg = c.bg2},
        x = {fg = c.fg, bg = c.bg},
        y = {fg = c.yellow, bg = c.bg, gui = "bold"},
        z = {fg = c.yellow, bg = c.bg, gui = "bold"}
    },
    visual = {
        a = {fg = c.yellow3, bg = c.yellow1, gui = "bold"},
        b = {fg = c.yellow3, bg = c.yellow2},
        c = {fg = c.yellow1, bg = c.yellow3},
        x = {fg = c.yellow1, bg = c.yellow3},
        y = {fg = c.yellow1, bg = c.yellow2, gui = "bold"},
        z = {fg = c.yellow3, bg = c.yellow1, gui = "bold"}
    }
}

return kimbox
