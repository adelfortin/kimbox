local M = {}

local fn = vim.fn
local api = vim.api

M.bg = "#000000"
M.fg = "#ffffff"

M.log = {
    levels = vim.log.levels
}

M.is_nvim = fn.has("nvim") == 1
M.has_api = M.is_nvim and fn.has("nvim-0.7") == 1

---Convert a `gui=...` into valid arguments for `api.nvim_set_hl`
---@param style string
---@return table
M.convert_gui = function(style)
    if not style or style:lower() == "none" then
        return {}
    end

    local gui = {}
    style = style:lower()
    for token in style:gmatch("([^,]+)") do
        gui[token] = true
    end

    return gui
end

---Highlight using Vim's language
---@param highlights any
local function vim_highlights(highlights)
    local to_highlight = {}
    for group, opts in pairs(highlights) do
        if opts.link then
            -- vim.api.nvim_set_hl(0, group_name, group_settings)
            table.insert(to_highlight, ("highlight! link %s %s"):format(group, opts.link))
        else
            table.insert(
                to_highlight,
                ("hi %s guifg=%s guibg=%s guisp=%s gui=%s"):format(
                    group,
                    opts.fg or "none",
                    opts.bg or "none",
                    opts.sp or "none",
                    opts.gui or "none"
                )
            )
        end
    end
    vim.cmd(table.concat(to_highlight, "\n"))
end

---Highlight using the Nvim API
---@param highlights any
local function nvim_highlights(highlights)
    for group, opts in pairs(highlights) do
        if not utils.is_empty(opts.link) then
            api.nvim_set_hl(0, group, {link = opts.link})
        else
            local values = M.convert_gui(opts.gui)
            values.bg = opts.bg
            values.fg = opts.fg
            values.sp = opts.sp
            api.nvim_set_hl(0, group, values)
        end
    end
end

-- M.highlight = M.tern(M.has_api, nvim_highlights, vim_highlights)0
M.highlight = nvim_highlights
---Echo a message with `nvim_echo`
---@param msg string message
---@param hl string highlight group
M.echomsg = function(msg, hl)
    hl = hl or "Title"
    api.nvim_echo({{msg, hl}}, true, {})
end

---Display notification message
---@param msg string
---@param level number
---@param opts table?
M.notify = function(msg, level, opts)
    opts = vim.tbl_extend("force", opts or {}, {title = "kimbox"})
    vim.notify(msg, level, opts)
end

---`INFO` message
---@param msg string
---@param notify boolean?
---@param opts table?
M.log.info = function(msg, notify, opts)
    if notify then
        M.notify(msg, M.log.levels.INFO, opts)
    else
        M.echomsg(("[INFO]: %s"):format(msg), "Directory")
    end
end

---`WARN` message
---@param msg string
---@param notify boolean?
---@param opts table?
M.log.warn = function(msg, notify, opts)
    if notify then
        M.notify(msg, M.log.levels.WARN, opts)
    else
        M.echomsg(("[WARN]: %s"):format(msg), "WarningMsg")
    end
end

---`ERROR` message
---@param msg string
---@param notify boolean?
---@param opts table?
M.log.err = function(msg, notify, opts)
    if notify then
        M.notify(msg, M.log.levels.ERROR, opts)
    else
        M.echomsg(("[ERR]: %s"):format(msg), "ErrorMsg")
    end
end

---Return a default value if `x` is `nil`
---@param x any
---@param default any
---@return any
M.get_default = function(x, default)
    return M.ife_nil(x, default, x)
end

---Similar to `vim.F.nil` except that an alternate default value can be given
---@param x any
---@param is_nil any
---@param is_not_nil any?
M.ife_nil = function(x, is_nil, is_not_nil)
    if x == nil then
        return is_nil
    else
        return is_not_nil
    end
end

---Return one of two values based on a conditional
---@param condition boolean|nil Statement to be tested
---@param is_if any Return if condition is truthy
---@param is_else any Return if condition is not truthy
M.tern = function(condition, is_if, is_else)
    if condition then
        return is_if
    else
        return is_else
    end
end

---Check if `string` is empty or `nil`
---@return boolean
M.is_empty = function(str)
    return str == "" or str == nil
end

---Convert a hex color (i.e., `#FFFFFF`) into an RGB(255, 255, 255)
---@param hex string
---@return table<number>
M.hexToRgb = function(hex)
    local p = "[abcdef0-9][abcdef0-9]"
    local pat = ("^#(%s)(%s)(%s)$"):format(p, p, p)

    hex = hex:lower()
    assert(hex:match(pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex))

    local r, g, b = hex:match(pat)

    return {
        tonumber(r, 16),
        tonumber(g, 16),
        tonumber(b, 16)
    }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
M.blend = function(fg, bg, alpha)
    bg = M.hexToRgb(bg)
    fg = M.hexToRgb(fg)

    local blendChannel = function(i)
        local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

M.darken = function(hex, amount, bg)
    return M.blend(hex, bg or M.bg, math.abs(amount))
end

M.lighten = function(hex, amount, fg)
    return M.blend(hex, fg or M.fg, math.abs(amount))
end

return M