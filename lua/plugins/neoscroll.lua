return {
  "karb94/neoscroll.nvim",
  opts = {},
  config = function()
    require('neoscroll').setup({
      easing_function = "quadratic", -- smoother
      hide_cursor = false,
    })
  end,
}
