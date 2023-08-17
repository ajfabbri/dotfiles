return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "autopep8", "mypy"})
      end
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = "mason.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.diagnostics.mypy.with({
            cwd = function (_) return vim.fn.getcwd() end,
          }),
          nls.builtins.formatting.autopep8,
        }
      }
    end
  },
}
