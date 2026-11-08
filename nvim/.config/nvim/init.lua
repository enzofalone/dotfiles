vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.relativenumber = true
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "none"

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
		{src = "https://github.com/vague2k/vague.nvim"},
		{src = "https://github.com/stevearc/oil.nvim"},
		{src = "https://github.com/echasnovski/mini.pick"},
		{src = "https://github.com/neovim/nvim-lspconfig"},
		{src = "https://github.com/chomosuke/typst-preview.nvim"},
})

require "mini.pick".setup()
require "oil".setup()

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

-- mini.pick
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

-- oil.nvim
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.lsp.enable({'lua_ls'})

vim.cmd("colorscheme vague")
