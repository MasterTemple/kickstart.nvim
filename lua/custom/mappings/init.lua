-- dofile("custom.mappings.visual")
-- require("normal")
-- local config_path = vim.fn.stdpath 'config'
--
-- for _, file in ipairs(vim.fn.readdir(config_path .. '/lua/custom/mappings/', [[v:val =~ '\.lua$']])) do
--   require(file:gsub('%.lua$', ''))
-- end
--
-- local lfs = require 'lfs'
-- for file_name in lfs.dir(directory_path) do
--   -- Exclude "." and ".." and ensure it's a .lua file
--   if file_name ~= '.' and file_name ~= '..' and file_name:match '%.lua$' then
--     local full_path = directory_path .. file_name
--     -- Option 1: Using dofile (executes the file directly)
--     dofile(full_path)
--     -- Option 2: Using require (loads as a module, typically returns a table)
--     -- Note: For require, you might need to adjust the path to be relative to Lua's package.path
--     -- Example for a module named 'my_module.lua' in 'lua_files/':
--     -- local module_name = file_name:gsub("%.lua$", "") -- Removes .lua extension
--     -- require("lua_files." .. module_name) -- Adjust based on your package path setup
--   end
-- end
--
local dir = 'custom.mappings.'
local files = { 'normal', 'insert', 'visual', 'cursor' }
for _, file in pairs(files) do
  require(dir .. file)
end

-- require 'custom.mappings.normal'
-- require 'custom.mappings.visual'
