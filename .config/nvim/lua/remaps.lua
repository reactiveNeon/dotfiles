--- uncomment the below line if you are using netrw
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- replacing this to enable diagnostic on "InsertLeave" event. Me comfotable with <C-c> :)
vim.keymap.set("i", "<C-c>", "<C-[>")
vim.keymap.set("i", "<C-[>", "<C-c>")

-- centering the cursor while half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- for copying into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- like alt+arrow in VSCode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- TODO: add delete to void register
-- TODO: for managing buffers
-- TODO: add Primeagean's remaps
