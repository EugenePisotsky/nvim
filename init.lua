vim.opt.number = true        -- absolute line numbers
vim.opt.fillchars:append({ diff = "╱" }) -- nicer diff filler (used by diffview)

vim.diagnostic.config({
  virtual_text = true,
})

require("config.lazy")
