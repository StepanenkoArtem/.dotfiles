return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")

    -- adapter for Rust/C/C++/Zig
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.expand("~/.local/share/nvim/mason/bin/codelldb"),
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.rust = {
      {
        name = "Debug",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
      },
    }

    -- Adapter for Ruby
    dap.adapters.ruby = {
      type = "executable",
      command = "rdbg",
      args = { "--open", "--port", "12345", "--command" },
    }

    dap.configurations.ruby = {
      {
        type = "ruby",
        request = "attach",
        name = "Attach to Rails",
        port = 12345,
      },
    }
  end,
}
