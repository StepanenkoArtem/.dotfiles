-- return {
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "catppuccin",
--     },
--   },
-- }

return {
  "loctvl842/monokai-pro.nvim",
  config = function()
    require("monokai-pro").setup({
      filter = "spectrum", -- pro | spectrum | classic | machine | octagon | ristertto
    })
    vim.cmd([[colorscheme monokai-pro]])
  end,
}
