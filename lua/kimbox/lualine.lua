local M = {}

---@return KimboxLualineConfig
function M.theme()
  return require("lualine.themes.kimbox")
end

---@return KimboxColors|{[string]: string}
function M.colors()
  local c = require("kimbox.colors")
  return {
    fg = c.fg0,
    bg = c.bg0,
    bg2 = c.bg2,
    grullo_grey = c.grullo_grey,
    red = c.teaberry,
    red2 = c.red,
    green = c.green,
    yellow = c.yellow,
    orange = c.orange,
    blue = c.blue,
    magenta = c.magenta,
    purple = c.purple,
    cyan = c.aqua,
    salmon = c.salmon,
    blue1 = "#3B5998",
    blue2 = "#8B9DC3",
    blue3 = "#DFE3EE",
    purple1 = "#8D0A9D",
    purple2 = "#9E36D2",
    purple3 = "#CA69E3",
    red1 = "#CB2424",
    red2 = "#FE2E2E",
    red3 = "#FE5757",
  }
end

return M
