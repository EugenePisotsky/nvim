local M = {}

function M.setup()
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
      local bufnr = event.buf

      vim.schedule(function()
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return
        end

        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end

        local function lsp_goto(method, title)
          return function()
            local clients = vim.lsp.get_clients({ bufnr = bufnr })
            if #clients == 0 then
              vim.notify("No LSP client attached", vim.log.levels.WARN)
              return
            end

            local pending = 0
            local results = {}
            local supported = false

            local function jump_to(location, encoding)
              vim.lsp.util.show_document(location, encoding or "utf-16", { reuse_win = true, focus = true })
              local dest_bufnr = vim.api.nvim_get_current_buf()
              for _, client in ipairs(clients) do
                pcall(vim.lsp.buf_attach_client, dest_bufnr, client.id)
              end
            end

            local function finalize()
              vim.schedule(function()
                if #results == 0 then
                  vim.notify("No locations found", vim.log.levels.INFO)
                  return
                end

                if #results == 1 then
                  jump_to(results[1].location, results[1].encoding)
                  return
                end

                local choices = {}
                for _, res in ipairs(results) do
                  local item = vim.lsp.util.locations_to_items({ res.location }, res.encoding)[1]
                  local display = ("%s:%d:%d %s"):format(item.filename, item.lnum, item.col, item.text or "")
                  table.insert(choices, { location = res.location, encoding = res.encoding, display = display })
                end

                vim.ui.select(choices, {
                  prompt = title,
                  format_item = function(choice)
                    return choice.display
                  end,
                }, function(choice)
                  if choice then
                    jump_to(choice.location, choice.encoding)
                  end
                end)
              end)
            end

            for _, client in ipairs(clients) do
              local ok_supports, supports = pcall(function()
                return client:supports_method(method)
              end)
              if ok_supports and supports then
                supported = true
                pending = pending + 1
                local encoding = client.offset_encoding or "utf-16"
                local params = vim.lsp.util.make_position_params(0, encoding)
                client:request(method, params, function(err, result)
                  if not err and result then
                    local locs = vim.islist(result) and result or { result }
                    for _, loc in ipairs(locs) do
                      table.insert(results, { location = loc, encoding = encoding })
                    end
                  end
                  pending = pending - 1
                  if pending == 0 then
                    finalize()
                  end
                end, bufnr)
              end
            end

            if not supported then
              vim.notify("No LSP client supports: " .. method, vim.log.levels.WARN)
            end
          end
        end

        map("n", "gd", lsp_goto("textDocument/definition", "LSP Definitions"), "Go to definition")
        map("n", "gD", lsp_goto("textDocument/declaration", "LSP Declarations"), "Go to declaration")
        map("n", "gI", lsp_goto("textDocument/implementation", "LSP Implementations"), "Go to implementation")
        map("n", "gt", lsp_goto("textDocument/typeDefinition", "LSP Type Definitions"), "Go to type definition")

        map("n", "gr", function()
          local ok, builtin = pcall(require, "telescope.builtin")
          if ok then
            return builtin.lsp_references()
          end
          return vim.lsp.buf.references()
        end, "Find references")

        map("n", "K", vim.lsp.buf.hover, "Hover")
      end)
    end,
  })
end

return M

