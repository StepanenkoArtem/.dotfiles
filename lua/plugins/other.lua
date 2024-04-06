return {
  -- {
  --   "adalessa/laravel.nvim",
  --   ft = { "php" },
  --   opts = {},
  -- },
  {
    "tigion/nvim-asciidoc-preview",
    ft = { "asciidoc" },
    opts = {},
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  { "isobit/vim-caddyfile" },
  { -- maybe https://github.com/0x00-ketsu/autosave.nvim
    "0x00-ketsu/autosave.nvim",
    opts = {},
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>j", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup()
    end,
  },
  { "slim-template/vim-slim" },
  { "NvChad/nvim-colorizer.lua" },
  { "tpope/vim-rails" },
  --     use 'slim-template/vim-slim'
  { "dhruvasagar/vim-table-mode" },
  { "tree-sitter/tree-sitter-embedded-template" },
  { "RRethy/nvim-treesitter-endwise" },
  { "APZelos/blamer.nvim" },
  { "dyng/ctrlsf.vim" },
  { "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
  { "digitaltoad/vim-pug" },
  -- {
  --   "kylechui/nvim-surround",
  --   version = "*", -- Use for stability; omit to use `main` branch for the latest features
  --   event = "VeryLazy",
  --   opts = {},
  -- },
}
