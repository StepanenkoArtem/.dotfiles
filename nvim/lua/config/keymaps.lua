-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

vim.o.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz"

-- for cyrillic layout
bind("i", "<c-х>", "<C-[>", opts)
bind("n", "л", "gk", opts)
bind("n", "о", "gj", opts)
bind("i", "<C-г>", "<C-G>u<C-U>", opts)
bind("i", "<C-ц>", "<C-G>u<C-W>", opts)

bind("n", "[c", function()
  require("treesitter-context").go_to_context()
end)

vim.keymap.set("n", "<leader>[", "<Cmd>call append(line('.') - 1, repeat([''], v:count1))<CR>")
vim.keymap.set("n", "<leader>]", "<Cmd>call append(line('.'),     repeat([''], v:count1))<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "kk", "<Esc>")
vim.keymap.set("i", "оо", "<Esc>")
vim.keymap.set("i", "лл", "<Esc>")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>h", vim.diagnostic.open_float)

-- Ruff-specific keybindings for Python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Fix all with <leader>cf
    vim.keymap.set("n", "<leader>cf", function()
      -- Save the file first
      vim.cmd("write")
      -- Run ruff check --fix to fix imports and other issues
      vim.fn.system("ruff check --fix " .. vim.fn.expand("%:p"))
      -- Run ruff format
      vim.fn.system("ruff format " .. vim.fn.expand("%:p"))
      -- Reload the buffer
      vim.cmd("edit!")
    end, { buffer = true, desc = "Fix All & Format" })
  end,
})
