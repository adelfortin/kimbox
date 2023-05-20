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
        b = {fg = c.purple3, bg = c.purple2},
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
        a = {fg = c.red, bg = c.bg, gui = "bold"},
        b = {fg = c.fg, bg = c.bg},
        c = {fg = c.fg, bg = c.bg2},
        x = {fg = c.fg, bg = c.bg}
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
        a = {fg = c.salmon, bg = c.bg, gui = "bold"},
        b = {fg = c.fg, bg = c.bg},
        c = {fg = c.fg, bg = c.bg2},
        x = {fg = c.fg, bg = c.bg},
        y = {fg = c.salmon, bg = c.bg, gui = "bold"},
        z = {fg = c.salmon, bg = c.bg, gui = "bold"}
    }
}

return kimbox
