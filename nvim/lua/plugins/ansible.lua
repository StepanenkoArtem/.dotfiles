return {
  -- The lang.ansible extra adds ansible-lint to Mason's ensure_installed,
  -- which would create a second copy (own bundled ansible-core) and shadow
  -- the ansible-lint from the mise-managed Python install. Keep a single
  -- copy (same ansible-core as the CLI/CI) by dropping it from Mason and
  -- relying on the one already on PATH.
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "ansible-lint"
      end, opts.ensure_installed or {})
    end,
  },
}
