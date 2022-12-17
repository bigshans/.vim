-- init.lua

local plugin_config = require "lua_plugin"

local enable_plugin = {
    'treesitter',
    'orgmode',
    'npairs',
    'telescope',
    'hop',
    'bufferline',
    'indent_blank_line',
    'incline',
    'nvim_ts_autotag',
    'todo_comments',
    'comment',
    'rest',
    -- 'hydra',
    -- 'dashboard',
    -- 'winbar',
    -- 'nvim_tree',
    -- 'scrollview',
}

for _, v in ipairs(enable_plugin) do
    plugin_config[v]()
end

-- for user

require('markdown_org')
