vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true        -- absolute line numbers
vim.opt.fillchars:append({ diff = "╱" }) -- nicer diff filler (used by diffview)
vim.opt.signcolumn = "yes"
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.clipboard:append("unnamedplus") -- use system clipboard (pbcopy/pbpaste on macOS)
vim.opt.autoread = true
vim.opt.updatetime = 2000

vim.diagnostic.config({
  virtual_text = true,
})

require("config.lsp").setup()

-- Reload files changed outside of Neovim.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "TermLeave" }, {
  callback = function()
    vim.cmd("checktime")
  end,
})

vim.keymap.set("n", "<leader>x", ":bp | bd #<CR>", { desc = "Close buffer, keep layout" })

vim.keymap.set("n", "gl", vim.diagnostic.open_float)

-- Move selection down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Move selection up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

require("config.lazy")
