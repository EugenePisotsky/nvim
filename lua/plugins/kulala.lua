return {
  "mistweaverco/kulala.nvim",
  -- Lazy-load on common Kulala key prefixes and HTTP-ish buffers
  keys = {
    { "<leader>Rs", desc = "Kulala: send request" },
    { "<leader>Ra", desc = "Kulala: send all requests" },
    { "<leader>Rb", desc = "Kulala: open scratchpad" },
  },
  ft = { "http", "rest" },
  opts = {
    -- Enable Kulala's built-in mappings with our leader prefix
    global_keymaps = true,
    global_keymaps_prefix = "<leader>R",
    kulala_keymaps_prefix = "",
    default_winbar_panes = { "body", "headers_body", "verbose", "script_output" },
    ui = {
      display_mode = "split",
      default_view = "headers_body",
      show_request_summary = false,
      max_response_size = 5 * 1024 * 1024,
    },
    lsp = {
      enable = true,
    },
  },
}
