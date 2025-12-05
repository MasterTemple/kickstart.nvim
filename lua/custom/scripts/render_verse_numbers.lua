-- https://chatgpt.com/c/692774e5-c7ec-8325-81c8-d2b61de15ab2

local ns = vim.api.nvim_create_namespace 'md_render'
local bufnr = vim.api.nvim_get_current_buf()

-------------------------------------------------------
-- 1. Define conceal rules using syntax matches
-------------------------------------------------------

-- A utility: define a concealed syntax match for a literal pattern
local function conceal(pattern)
  vim.cmd(('syntax match MdRenderConceal /%s/ conceal'):format(pattern))
end

local function concealers()
  -- Conceal Bible verses: `<sup>12</sup>`
  conceal '<sup>\\d\\+<\\/sup>'
end

vim.opt_local.conceallevel = 2
-- vim.opt_local.concealcursor = 'nc'

-------------------------------------------------------
-- 2. Rules for replacement virtual text
-------------------------------------------------------

local rules = {}

local function add_rule(pattern, handler)
  table.insert(rules, { pattern = pattern, handler = handler })
end

-------------------------------------------------------
-- 3. Replacement rules
-------------------------------------------------------

-- <sup>12</sup> → 12
add_rule('<sup>%d+</sup>', function(match)
  local num = match:match '%d+' .. ' '
  -- return num, 'MdSup', nil
  return num, '@module', nil
end)

vim.api.nvim_set_hl(0, 'MdSup', {
  fg = '#aaaaaa',
})

-------------------------------------------------------
-- 4. Main renderer
-------------------------------------------------------

local function render()
  concealers()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for i, line in ipairs(lines) do
    if i ~= cursor_line then
      for _, r in ipairs(rules) do
        local s, e = line:find(r.pattern)
        if s then
          local txt, hl, col = r.handler(line:sub(s, e))
          vim.api.nvim_buf_set_extmark(bufnr, ns, i - 1, col or (s - 1), {
            virt_text = { { txt, hl } },
            virt_text_pos = 'inline',
            end_row = i - 1,
            end_col = e - 2,
          })
        end
      end
    end
  end
end

-------------------------------------------------------
-- 5. Autocmds
-------------------------------------------------------

vim.api.nvim_create_autocmd({ 'BufEnter', 'TextChanged', 'TextChangedI', 'CursorMoved', 'CursorMovedI' }, { callback = render, pattern = { '*.md' } })
