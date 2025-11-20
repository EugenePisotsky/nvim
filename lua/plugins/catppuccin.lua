return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        integrations = {
          telescope = {
            enabled = true,
            style = "nvchad",
          },
        },
      })
      vim.cmd.colorscheme("catppuccin-frappe")

      -- Custom Telescope colors
      local bg = "#2F3448"
      local border = "#51576D"
      local fg = "#C6D0F5"
      local sel_bg = "#414559"

      -- Window separators (normal splits + plugins like Diffview)
      vim.api.nvim_set_hl(0, "WinSeparator", { fg = border, bg = "NONE" })
      vim.api.nvim_set_hl(0, "VertSplit", { fg = border, bg = "NONE" })
      vim.api.nvim_set_hl(0, "DiffviewWinSeparator", { fg = border, bg = "NONE" })

      -- Main backgrounds + text color
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = bg, fg = fg })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = bg, fg = fg })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = bg, fg = fg })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = bg, fg = fg })

      -- Borders
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = border, bg = bg })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = border, bg = bg })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = border, bg = bg })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = border, bg = bg })

      -- Selection: text + background
      vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = fg, bg = sel_bg, bold = true })
      vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = fg, bg = sel_bg })

      -- Prompt prefix arrow (input) - no special background
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { fg = fg, bg = bg })

      -- Titles (e.g. "File Preview", "Find Files") - unify background + text color
      vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = fg, bg = bg })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = fg, bg = bg })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { fg = fg, bg = bg })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { fg = fg, bg = bg })
    end,
  },
}
