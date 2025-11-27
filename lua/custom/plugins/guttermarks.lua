return {
  {
    'dimtion/guttermarks.nvim',
    event = 'VeryLazy',
    opts = {
      special_mark = {
        enabled = true, -- Disabled by default
        marks = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' },
        highlight_group = 'DiagnosticError',
        priority = 12,
      },
    },
  },
}
