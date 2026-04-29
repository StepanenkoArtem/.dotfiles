return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      codelens = {
        enabled = false,
      },
      diagnostics = {
        underline = true,
        virtual_text = false,
        virtual_lines = { current_line = true },
        float = {
          border = "rounded",
        },
        severity_sort = true,
      },

      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                -- Let ruff handle these
                ignore = { "*" },
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                  reportUnusedVariable = "none",
                  reportUnusedImport = "none",
                },
              },
            },
          },
        },
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
        nginx_language_server = {},
        lemminx = {},
        -- phpactor = {
        --   filetypes = { "php", "blade" },
        -- },
        ltex = {
          settings = {
            ltex = {
              language = "ua-UA",
            },
          },
        },
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.systemlist("which ruby-lsp")[1] },
        },
        -- solargraph = {
        --   mason = true,
        --   enabled = true,
        -- },
        rubocop = {
          cmd = { "rubocop", "--lsp" },
          flags = {
            debounce_text_changes = 5000, -- Increased debounce for large codebase
          },
          settings = {
            -- Enable caching for better performance
            cache = true,
            -- Use parallel processing
            parallel = true,
          },
          -- Only activate for reasonably sized files
          filetypes = { "ruby" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".rubocop.yml", "Gemfile")(fname)
          end,
        },
        ansiblels = {
          settings = {
            ansible = {
              validation = {
                lint = { enabled = true },
              },
            },
          },
        },
        rust_analyzer = { enabled = false },
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
              -- Ruff will use the configuration from ruff.toml in the project
              -- No need to specify args here - it will read from the config file
              lint = {
                enable = true,
                preview = true,
              },
              format = {
                preview = true,
              },
              -- Enable organizing imports
              organizeImports = true,
              -- Enable fix all
              fixAll = true,
            },
          },
          capabilities = {
            -- Enable hover for diagnostic info
            hoverProvider = true,
          },
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
        },
        ruff_lsp = {
          keys = {
            {
              "<leader>co",
              LazyVim.lsp.action["source.organizeImports"],
              desc = "Organize Imports",
            },
          },
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
      setup = {
        ["ruff"] = function()
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and client.name == "ruff" then
                client.server_capabilities.hoverProvider = true
                client.server_capabilities.codeActionProvider = true
                client.server_capabilities.documentFormattingProvider = true
              end
            end,
          })
        end,
      },
    },
  },
}
