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
          -- Brighter colors for neo-tree (tracked vs gitignored vs hidden)
          NeoTreeFileName = { fg = "#dcdcdc" },
          NeoTreeDirectoryName = { fg = "#f0f0f0" },
          NeoTreeDirectoryIcon = { fg = "#f0f0f0" },
          NeoTreeGitIgnored = { fg = "#a0a0a0" },
          NeoTreeDotfile = { fg = "#a0a0a0" },
          NeoTreeHiddenByName = { fg = "#a0a0a0" },
        }
      end,
    })
    vim.cmd([[colorscheme monokai-pro]])

    local function apply_overrides()
      -- Neo-tree
      vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#dcdcdc" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#f0f0f0" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#f0f0f0" })
      vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#f0f0f0", bold = true })
      vim.api.nvim_set_hl(0, "NeoTreeGitIgnored", { fg = "#a0a0a0" })
      vim.api.nvim_set_hl(0, "NeoTreeDotfile", { fg = "#a0a0a0" })
      vim.api.nvim_set_hl(0, "NeoTreeHiddenByName", { fg = "#a0a0a0" })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#c8c8c8" })
      vim.api.nvim_set_hl(0, "Directory", { fg = "#f0f0f0" })
      -- Code comments — lighter, keep italic
      vim.api.nvim_set_hl(0, "Comment", { fg = "#8b8b8b", italic = true })
      vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
    end

    apply_overrides()
    -- Re-apply after plugins load / on any colorscheme switch
    vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter", "FileType" }, {
      pattern = "*",
      callback = function(args)
        if args.event == "FileType" and args.match ~= "neo-tree" then
          return
        end
        apply_overrides()
      end,
    })
  end,
}
