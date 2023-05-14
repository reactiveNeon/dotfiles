local icons = require("unrav.icons")

local use_icons = true
local function diagnostics_indicator(num, _, diagnostics, _)
    local result = {}
    local symbols = {
        error = icons.diagnostics.Error,
        warning = icons.diagnostics.Warning,
        info = icons.diagnostics.Information,
    }
    if not use_icons then
        return "(" .. num .. ")"
    end
    for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
            table.insert(result, symbols[name] .. " " .. count)
        end
    end
    -- TODO: what is this error?
    result = table.concat(result, " ")
    return #result > 0 and result or ""
end


local bufferline = require("bufferline")
bufferline.setup{
    options = {
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = diagnostics_indicator,
        color_icons = true,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            }
        },
    },
    highlights = {
        background = {
            fg = "#657b83",
            bg = "#1e1e1e"
        },
        buffer_selected = {
            bold = true,
        },
        warning_diagnostic = {
            bg = "#1e1e1e"
        },
        error_diagnostic = {
            bg = "#1e1e1e"
        },
        fill = {
            bg = "#282828",
        }
    },
}

-- remaps
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
