return {

  -- extend auto completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
  },

  -- tidy: auto-remove whitespace errors
  {
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    opts = {
      filetype_exclude = { "markdown", "diff" },
    },
  },

}
