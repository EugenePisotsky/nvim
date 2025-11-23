return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    -- Drop-down keeps prompt attached to results, full layout uses boxed borders.
    local sharp_dropdown_borders = {
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }
    local sharp_full_borders = {
      prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      results = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    }

    telescope.setup({
      defaults = {
        -- Make all Telescope borders sharp by default (applies to any picker/extension)
        borderchars = sharp_full_borders,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          borderchars = sharp_dropdown_borders,
        },
        buffers = {
          theme = "dropdown",
          borderchars = sharp_dropdown_borders,
        },
      },
    })

    -- Keymaps (the ones people use 99% of the time)
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help tags" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "LSP Symbols" })
  end,
}
