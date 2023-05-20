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
        a = {fg = c.gray3, bg = c.gray1},
        b = {fg = c.gray1, bg = c.gray3}
    },
    insert = {
        a = {fg = c.green3, bg = c.green1, gui = "bold"},
        b = {fg = c.green3, bg = c.green2},
        c = {fg = c.green1, bg = c.green3},
        x = {fg = c.green1, bg = c.green3},
        y = {fg = c.green3, bg = c.green2, gui = "bold"},
        z = {fg = c.green3, bg = c.green1, gui = "bold"}
    },
    replace = {
        a = {fg = c.red3, bg = c.red1, gui = "bold"},
        b = {fg = c.red3, bg = c.red2},
        c = {fg = c.red2, bg = c.red3},
        x = {fg = c.red2, bg = c.red3}
    },
    terminal = {
        a = {fg = c.orange3, bg = c.orange1, gui = "bold"},
        b = {fg = c.orange3, bg = c.orange2},
        c = {fg = c.orange1, bg = c.orange3},
        x = {fg = c.orange1, bg = c.orange3},
        y = {fg = c.orange3, bg = c.orange2, gui = "bold"},
        z = {fg = c.orange3, bg = c.orange1, gui = "bold"}
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
