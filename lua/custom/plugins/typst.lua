return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    -- lazy.nvim will implicitly calls `setup {}`
    opts = {
      open_cmd = 'uwsm app -- brave --new-window --ozone-platform=wayland --app=%s',
    },
  },
}
