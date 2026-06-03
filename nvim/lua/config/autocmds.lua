-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.opt.wrap = false
vim.g.blamer_enabled = true
vim.opt.colorcolumn = "120" -- show vertical line
vim.opt.cursorline = true

-- Detect Ansible YAML files
vim.filetype.add({
  pattern = {
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*%.ya?ml"] = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    -- Playbooks kept directly under an ansible/ dir (this project's layout)
    [".*/ansible/.*%.ya?ml"] = "yaml.ansible",
    -- Detect playbooks by content (files with "hosts:" key)
    [".*%.ya?ml"] = {
      function(path, bufnr)
        local content = vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)
        for _, line in ipairs(content) do
          if line:match("^%s*-%s+hosts:") then
            return "yaml.ansible"
          end
        end
      end,
      { priority = 10 },
    },
  },
})
