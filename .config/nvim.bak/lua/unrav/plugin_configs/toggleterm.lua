local pwsh = "pwsh.exe"

vim.keymap.set("n", "<C-t>", vim.cmd.ToggleTerm)

require("toggleterm").setup{
    shell = pwsh,
    open_mapping = [[<C-\>]],
}
