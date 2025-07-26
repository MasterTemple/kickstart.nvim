-- return {}
return {
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    keys = {
      { mode = 'n', '<leader>/', '<cmd>lua require("Comment.api").toggle.linewise.current()<CR>', { desc = 'Toggle comment' } },
      { mode = 'v', '<leader>/', '<Esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', { desc = 'Toggle comment' } },
    },
  },
}
