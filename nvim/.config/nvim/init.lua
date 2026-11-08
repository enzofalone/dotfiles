vim.o.number = true
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.relativenumber = true
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "none"
-- Use system clipboard
vim.o.clipboard = "unnamedplus"
-- Do not autocomplete on ^X^O
vim.o.completeopt = 'menu,menuone,noselect,noinsert'

vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/echasnovski/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require "mini.pick".setup()
require "oil".setup()
require "gitsigns".setup()

-- Keymaps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'clear search highlight' })

-- Keymaps, LSP
vim.keymap.set('n', 'gf', vim.lsp.buf.format, { desc = "LSP format document" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "LSP definition" })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = "LSP declaration" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "LSP references" })
vim.keymap.set('n', 'gh', function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line('.') - 1 })
	if #diagnostics > 0 then
		vim.diagnostic.open_float()
	else
		vim.lsp.buf.hover()
	end
end, { desc = 'Show diagnostic or hover docs' })

vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count = -1, float=true}) end, { desc = "Go to prev diagnostic" })
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count = 1, float=true}) end, { desc = "Go to next diagnostic" })

-- LSP, Lua
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = { version = 'LuaJIT' },
			diagnostics = { globals = { 'vim' } },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file('', true),
			},
		},
	},
})
vim.lsp.enable({ 'lua_ls' })

-- LSP, Odin
vim.lsp.config('ols', {
  cmd = { 'ols' },
  filetypes = { 'odin' },
  root_markers = { 'ols.json', '.git' },
})
vim.lsp.enable('ols')

-- mini.pick
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>h', ':Pick help<CR>')

-- oil.nvim
vim.keymap.set('n', '<leader>e', ':Oil<CR>')

vim.cmd("colorscheme vague")
