require('shawn.packer')
-- SETTINGS
------------------------------------------------------------
vim.opt.guicursor = ""
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.encoding="utf-8"
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.background = 'dark'
vim.opt.errorbells= false
vim.opt.swapfile = false
vim.opt.scrolloff=10
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.laststatus = 3
vim.opt.winbar = "%f"
vim.g.loaded_matchparen = 1
vim.g.ycm_cache_monifunc = 0
-- command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

--Treesitter
------------------------------------------------------------
require('shawn.treesitter');
require('vim-be-good');

--language servers
--require'lspconfig'.rome.setup{}

--ToggleTerm
------------------------------------------------------------
require('toggleterm').setup{
    size = function(term)
        if term.direction == "horizontal" then
            return 10
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<leader>tm]],
    insert_mappings = false,
    terminal_mappings = true,
    -- on_open = fun(t: Terminal), -- function to run when the terminal opens
    -- on_close = fun(t: Terminal), -- function to run when the terminal closes
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,
    shell = vim.o.shell,
}

--Lualine
------------------------------------------------------------
require('lualine').setup()

--Telescope
------------------------------------------------------------
require('telescope').setup()

--Nvim Tree
------------------------------------------------------------
require("nvim-tree").setup()


-- REMAPS
------------------------------------------------------------
local nnoremap = require('shawn.keymap').nnoremap
local inoremap = require('shawn.keymap').inoremap
local vnoremap = require('shawn.keymap').vnoremap
local nmap = require('shawn.keymap').nmap

-- leader
vim.g.mapleader = ' '

--remap esc to home row
inoremap("kj", "<Esc>")

-- center cursor on screen while searching n
nnoremap("<leader>n", "nzz")

-- capital Y now just goes from cursor to end of line, like capital D and C
nnoremap("Y","y$")

-- Bracket Matching
inoremap("{<CR>", "{<CR>}<ESC>O")
inoremap("(" ,"()<Esc>ha")
inoremap("[", "[]<Esc>ha")

-- moving lines
nnoremap("<C-j>", ":m .+1<CR>==")
nnoremap("<C-k>", ":m .-2<CR>==")
inoremap("<C-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<C-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<C-j>", ":m '>+1<CR>gv=gv")
vnoremap("<C-k>", ":m '<-2<CR>gv=gv")

-- jumps re-center
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

-- search re-center
nnoremap("n", "nzz")
nnoremap("N", "Nzz")

-- go to file under cursor
vnoremap("gf", "<C-W>gf")

-- easier window management
nnoremap("<leader>w", "<C-w>")

-- splits
nnoremap("<C-left>", ":vertical resize +3<CR>")
nnoremap("<C-right>", ":vertical resize -3<CR>")
nnoremap("<C-up>", ":resize +3<CR>")
nnoremap("<C-down>", ":resize -3<CR>")

-- buffers
nnoremap ("<leader>bk", ":bw<CR>")
nnoremap ("<leader>bn", ":bn<CR>")
nnoremap ("<leader>bp", ":bp<CR>")

-- Nvim Tree
nmap("<leader>tr", ":NvimTreeToggle<CR>")

--Telescope
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fg","<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fb","<cmd>lua require('telescope.builtin').buffers()<cr>")  
nnoremap("<leader>fh","<cmd>lua require('telescope.builtin').help_tags()<cr>")  
