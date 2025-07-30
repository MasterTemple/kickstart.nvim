-- alternative: https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-files.md
return {
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      -- i want Backspace to go to the parent directory, but only when in Oil
      { '<BS>', '<cmd>Oil<CR>' },
    },
  },
}
