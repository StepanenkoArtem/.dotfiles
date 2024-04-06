return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependecies = {
      "mason-nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = false,
      },
      diagnostics = {
        -- underline = true,
        virtual_text = true,
        float = {
          border = "rounded",
        },
      },

      servers = {
        kotlin_language_server = {},
        -- https://github.com/typescript-language-server/typescript-language-server/pull/218
        -- https://github.com/microsoft/TypeScript/issues/13270
        tsserver = {
          settings = {
            tsserver = {
              -- codeLens = {
              --   enable = true,
              -- },
              init_options = {
                preferences = {
                  quoteStyle = "single",
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                  importModuleSpecifierPreference = "non-relative",
                },
              },
            },
          },
        },
        html = {
          filetypes = { "html", "blade" },
        },
        bashls = {},
        lemminx = {},
        -- phpactor = {
        --   filetypes = { "php", "blade" },
        -- },
        ltex = {
          settings = {
            ltex = {
              language = "ru-RU",
            },
          },
        },
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        },
        solargraph = {
          mason = false,
          enabled = false,
        },
        rubocop = {
          cmd = { "rubocop", "--lsp" },
        },
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
    },
  },
}
