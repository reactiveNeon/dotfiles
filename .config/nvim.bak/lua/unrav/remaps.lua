--- GENERAL info
--- - <leader>f... -> focusing stuffs
--- - <leader>b... -> buffer management

--- uncomment the below line if you are using netrw
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- replacing this to enable diagnostic on "InsertLeave" event. Me comfotable with <C-c> :)
vim.keymap.set("i", "<C-c>", "<C-[>")
vim.keymap.set("i", "<C-[>", "<C-c>")

-- centering the cursor while half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- centering the cursor while moving through search terms, and also opens folds for the line if any
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- like alt+arrow in VSCode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- for copying into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- remaps for managing buffers
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext)

-- TODO: add the delete to void register
