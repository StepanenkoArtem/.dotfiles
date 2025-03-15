-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.o.spelllang = "ua_ua, en_us, ru_ru"
vim.o.linebreak = true
vim.g.autoformat = false
vim.opt.relativenumber = false
-- LSP Server to use for Rust.
-- Set to "bacon-ls" to use bacon-ls instead of rust-analyzer.
-- only for diagnostics. The rest of LSP support will still be
-- provided by rust-analyzer.
-- vim.g.lazyvim_rust_diagnostics = "rust-analyzer"
