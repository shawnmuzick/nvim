--Motions
vim.keymap.set("i", "kj", "<Esc>") --remap esc
vim.keymap.set("n", "<leader>n", "nzz")--center line on search hop
vim.keymap.set("n", "<leader>N", "Nzz")--center line on search hop

-- jumps re-center
vim.keymap.set("n","<C-d>", "<C-d>zz")
vim.keymap.set("n","<C-u>", "<C-u>zz")

--terminal escape
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('t', '<space>w','<C-\\><C-n><C-w>',opts);

-- Bracket Matching
vim.keymap.set("i", "{<CR>", "{<CR>}<ESC>O")
--vim.keymap.set("i", "(", "()<Esc>ha")
--vim.keymap.set("i", "[", "[]<Esc>ha")

--marks
vim.keymap.set("n", "<leader>m", "`")

-- resize splits
vim.keymap.set("n", "<C-left>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<C-right>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<C-up>", ":resize +3<CR>")
vim.keymap.set("n", "<C-down>", ":resize -3<CR>")

-- buffers
vim.keymap.set("n", "<leader>bk", ":bw<CR>")
vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bp", ":bp<CR>")

-- moving lines
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- go to file under cursor
vim.keymap.set("n","gf", "<C-W>gf")

-- capital Y now just goes from cursor to end of line, like capital D and C
vim.keymap.set("n","Y","y$")

-- easier window management
vim.keymap.set("n","<leader>w", "<C-w>")

--Fugitive
vim.keymap.set("n","<leader>G", ":Git<CR>")

--remap exit
vim.keymap.set("n","<leader>Q",":qa!<CR>")
