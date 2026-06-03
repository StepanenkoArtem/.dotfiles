return {
  -- The lang.ansible extra adds ansible-lint to Mason's ensure_installed,
  -- which would create a second copy (own bundled ansible-core) and shadow
  -- the mise-managed ansible-lint inside Neovim. Keep a single, mise-aligned
  -- ansible-lint (same ansible-core as the CLI/CI) by dropping it from Mason.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "ansible-lint"
      end, opts.ensure_installed or {})
    end,
  },
}
