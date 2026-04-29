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
      override = function()
        return {
          -- Brighter colors for neo-tree (tracked vs gitignored)
          NeoTreeFileName = { fg = "#c0c0c0" },
          NeoTreeDirectoryName = { fg = "#c0c0c0" },
          NeoTreeDirectoryIcon = { fg = "#c0c0c0" },
          NeoTreeGitIgnored = { fg = "#7f7f7f" },
        }
      end,
    })
    vim.cmd([[colorscheme monokai-pro]])
  end,
}
