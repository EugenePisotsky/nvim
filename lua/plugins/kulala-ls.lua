return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  ft = { "http", "rest" },
  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = cmp.default_capabilities(capabilities)
    end

    local ok_config, _ = pcall(vim.lsp.config, "kulala_ls", {
      capabilities = capabilities,
      filetypes = { "http", "rest" },
    })

    if not ok_config then
      vim.notify("kulala_ls config not found", vim.log.levels.WARN)
      return
    end

    vim.lsp.enable("kulala_ls")
  end,
}
