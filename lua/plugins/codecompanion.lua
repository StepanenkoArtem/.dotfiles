return {
  "olimorris/codecompanion.nvim",
  opts = {
    strategies = {
      chat = { adapter = "anthropic" },
      inline = { adapter = "anthropic" },
      complete = { adapter = "anthropic" },
      test = { adapter = "anthropic" },
    },
    adapters = {
      anthropic = function()
        return require("codecompanion.adapters").extend("anthropic", {
          env = {
            api_key = "cmd: op read op://personal/Claude_API/credential --no-newline",
          },
        })
      end,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
