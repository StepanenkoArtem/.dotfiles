return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      nginx = { "nginxbeautifier" },
      ["yaml.ansible"] = { "prettier" },
      yaml = { "prettier" },
    },
    formatters = {
      nginxbeautifier = {
        command = "nginxbeautifier",
        args = { "-s", "4", "-i", "$FILENAME", "-o", "$FILENAME" },
        stdin = false,
      },
    },
  },
}
