-- init.lua

local plugin_config = {}
local enable_plugin = {
    "treesitter",
    "orgmode",
    "npairs",
    "telescope",
    "hop",
    "bufferline",
    -- "scrollview",
}

function plugin_config:treesitter()
    -- Load custom tree-sitter grammar for org filetype
    require('orgmode').setup_ts_grammar()

    -- Tree-sitter configuration
    require'nvim-treesitter.configs'.setup {
        -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
        ensure_installed = 'all',
        ignore_install = { 'lua', 'hcl', 'vim', 'markdown', 'swift' },
        sync_install = false,
        highlight = {
            enable = true,
            disable = {'org', 'lua', 'vim', 'markdown', 'html'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
            additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
        }
    }
end

function plugin_config:orgmode()
    local org_dir = '/projects/aerian/resource/nextcloud-back/org/'
    require('orgmode').setup({
        org_agenda_files = { org_dir .. '*' },
        org_default_notes_file = org_dir .. '笔记.org',
        org_todo_keywords = { 'TODO(t)', 'WAIT(w)', 'LOOP(l)', 'IDEA(i)', '|', 'DONE(d)', 'KILL(k)', 'PROJ(p)' },
        org_capture_templates = {
            t = { description = 'Task', template = '* TODO %?\n %u', target = org_dir .. 'agenda.org' },
            T = { description = 'Todo', template = '* TODO %?\n %u', target = org_dir .. 'agenda.org' },
            j = { description = 'Journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?', target = org_dir .. 'journal.org' },
            n = { description = 'Note', template = '* From %?', target = org_dir .. '笔记.org' }
        },
        mappings = {
            global = {
                org_agenda = {'<Leader>oA', '<Leader>oa'},
                org_capture = 'gC'
            },
            org = {
                org_todo = {'cit', 'mt'}
            }
        }
    })

    require("org-bullets").setup {
        symbols = { "◉", "○", "✸", "✿" },
    }
end

function plugin_config:npairs()
    local remap = vim.api.nvim_set_keymap
    local npairs = require('nvim-autopairs')
    npairs.setup({map_cr = false})

    -- skip it, if you use another global object
    _G.MUtils= {}

    MUtils.completion_confirm=function()
        if vim.fn.pumvisible() ~= 0  then
            return vim.fn["coc#_select_confirm"]()
        else
            return npairs.autopairs_cr()
        end
    end

    remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
end

function plugin_config:indent_blank_line()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

    vim.opt.list = true
    vim.opt.listchars:append("space:⋅")
    vim.opt.listchars:append("eol:↴")

    require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = false,
        buftype_exclude = { "terminal" },
        filetype_exclude = { "dashboard",  'startify', 'coc-explorer', 'which_key', 'markdown', 'help', 'json' },
        space_char_blankline = " ",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
    }
end

function plugin_config:telescope()
    require('telescope').setup{
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key"
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        }
    }
end

function plugin_config:hop()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
end

function plugin_config:bufferline()
    local tab_group = {}
    local tabpagenr = vim.fn['tabpagenr'];
    local bufnr = vim.fn['bufnr']
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = '*',
        callback = function ()
            local tabId = tabpagenr()
            local buf = bufnr()
            if tab_group[tabId] then
                for _, v in ipairs(tab_group[tabId]) do
                    if v == buf then
                        return
                    end
                end
                table.insert(tab_group[tabId], buf)
            else
                tab_group[tabId] = { buf }
            end
        end
    })
    vim.api.nvim_create_autocmd({ "BufDelete" }, {
        pattern = '*',
        callback = function ()
            local tabId = tabpagenr()
            local buf = bufnr()
            if tab_group[tabId] then
                local list = {}
                for _, v in ipairs(tab_group[tabId]) do
                    if v == buf then
                       goto contine
                    end
                    table.insert(list, v)
                    ::contine::
                end
                tab_group[tabId] = list
            end
        end
    })
    require('bufferline').setup{
        options = {
            enforce_regular_tabs = false,
            diagnostics = "coc",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            numbers = function(opts)
                return string.format(' %s/%s.%s', vim.fn['tabpagenr'](), opts.id, opts.ordinal)
            end,
            offsets = {
                {
                    filetype = "coc-explorer",
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = "Directory",
                    text_align = "left"
                },
                {
                    filetype = 'vista',
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = "Tags",
                    text_align = "right"
                }
            },
            separator_style = "slant",
            custom_filter = function (buf_number, buf_numbers)
                if string.match(vim.fn['bufname'](buf_number), "term") then
                    return false
                end
                local tabId = tabpagenr()
                if tab_group[tabId] then
                    for _, p in ipairs(tab_group[tabId]) do
                        if p == buf_number then
                            return true
                        end
                    end
                end
                return false
            end
        }
    };
end

function plugin_config:scrollview()
    require('scrollview').setup({
        excluded_filetypes = {'nerdtree', 'coc-explorer', 'vista'},
    })
end

for _,v in ipairs(enable_plugin) do
    plugin_config[v]()
end

-- for user

require 'markdown_org'
