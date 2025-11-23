return {
  "pmizio/typescript-tools.nvim",
  ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = cmp.default_capabilities(capabilities)
    end

    return {
      capabilities = capabilities,
    }
  end,
}
