local colorschemes = {
    "savq/melange-nvim",
    "ellisonleao/gruvbox.nvim",
}

local plugins_table = {}

for _, colorscheme in ipairs(colorschemes) do
    local temp = {}
    table.insert(temp, colorscheme)
    temp["priority"] = 1000

    table.insert(plugins_table, temp)
end

return plugins_table
