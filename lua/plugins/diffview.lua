return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewToggleFiles",
  },
  config = function()
    local diffview = require("diffview")

    diffview.setup({
      enhanced_diff_hl = true,
      use_icons = false, -- hide devicons in file list (folders/files)
      signs = {
        -- use matching triangles with spacing for folded/open rows
        fold_closed = "▸ ",
        fold_open = "▾ ",
      },
    })

    -- Make the delete filler (////) subtle and match your palette
    vim.api.nvim_set_hl(0, "DiffviewDiffDeleteDim", { fg = "#414559", bg = "NONE" })
    -- Keep folder labels at normal foreground intensity
    vim.api.nvim_set_hl(0, "DiffviewFolderName", { link = "Normal" })

    vim.keymap.set("n", "<leader>dv", "<cmd>DiffviewOpen<CR>", { desc = "Diffview: Open" })
    vim.keymap.set("n", "<leader>df", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview: File history" })
    vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Diffview: Close" })
    vim.keymap.set("n", "<leader>dt", "<cmd>DiffviewToggleFiles<CR>", { desc = "Diffview: Toggle files panel" })
  end,
}
