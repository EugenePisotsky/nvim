return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>sf", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>st", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  opts = {
    auto_restore_enabled = false,
    auto_save_enabled = true,
    session_lens = {
      picker = "telescope",
      picker_opts = {
        theme = "dropdown",
        borderchars = {
          prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
          preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
        },
      },
      load_on_setup = true,
    },
  },
}
