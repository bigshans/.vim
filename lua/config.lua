-- init.lua

local plugin_config = {}
local enable_plugin = {
    "treesitter",
    "orgmode",
    "npairs",
    "telescope",
    "hop",
    "bufferline",
    "indent_blank_line",
    "incline",
    "nvim_ts_autotag",
    "todo_comments",
    -- "winbar",
    -- "nvim_tree",
    -- "scrollview",
}

local function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function plugin_config:treesitter()
    -- Load custom tree-sitter grammar for org filetype
    require('orgmode').setup_ts_grammar()
    -- Tree-sitter configuration
    require'nvim-treesitter.configs'.setup {
        -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
        ensure_installed = 'all',
        ignore_install = { 'hcl', 'lua', 'vim', 'markdown', 'swift', 'typescript', 'javascript', 'rust', 'php', 'vue' },
        sync_install = false,
        highlight = {
            enable = true,
            disable = {'org', 'lua', 'vim', 'markdown', 'html', 'typescript', 'javascript', 'rust', 'php', 'vue'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
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
        -- symbols = { "◉", "○", "✸", "✿" },
    }
end

function plugin_config:npairs()
    local remap = vim.api.nvim_set_keymap
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')
    npairs.setup({map_cr = false})
    npairs.remove_rule("'")
    npairs.add_rule(
    Rule("'", "'")
    :with_pair(cond.not_before_regex_check("%w"))
    :with_pair(function(_)
        return vim.bo.filetype ~= "lisp" and vim.bo.filetype ~= "scheme"
    end)
    )
    npairs.add_rule(
    Rule("${", "}")
    :with_pair(cond.before_regex("`.*"))
    :with_pair(function(_)
        return vim.bo.filetype == 'typescript' or vim.bo.filetype == 'javascript'
    end)
    )
    Rule(">[%w%s]*$", "^%s*</",
            { '-html', '-typescript', '-typescriptreact', '-javascript' , '-javascriptreact', '-svelte', '-vue', '-xml', '-rescript'})
    -- skip it, if you use another global object
    _G.MUtils= {}

    MUtils.completion_confirm=function()
        if vim.fn["coc#pum#visible"]() ~= 0  then
            return vim.fn["coc#pum#confirm"]()
        else
            return npairs.autopairs_cr()
        end
    end

    remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
end

function plugin_config:indent_blank_line()
    require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = false,
        buftype_exclude = { "terminal" },
        filetype_exclude = { "dashboard",  'startify', 'coc-explorer', 'which_key', 'markdown', 'help', 'json' },
        space_char_blankline = " ",
    }
end

function plugin_config:telescope()
    require('telescope').setup{
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            layout_config = {
                prompt_position = 'top',
            },
            sorting_strategy = "ascending",
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
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    require('telescope').load_extension('fzf')
end

function plugin_config:hop()
    require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
end

function plugin_config:bufferline()
    local tab_group = {}
    local tabpagenr = vim.fn['tabpagenr'];
    local bufnr = vim.fn['bufnr']
    local buflisted = vim.fn['buflisted']
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
            local max = bufnr('$')
            local buflist = {}
            for buf_num = 1,max do
                if buflisted(buf_num) > 0 then
                    table.insert(buflist, buf_num)
                end
            end
            if tab_group[tabId] then
                local list = {}
                for _, v in ipairs(tab_group[tabId]) do
                    if buflisted(v) > 0 then
                        table.insert(list, v)
                    end
                end
                tab_group[tabId] = list
            end
        end
    })
    require('bufferline').setup{
        options = {
            enforce_regular_tabs = false,
            diagnostics = "coc",
            diagnostics_update_in_insert = true,
            diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            numbers = function(opts)
                return string.format(' %s/%s', vim.fn['tabpagenr'](), opts.ordinal)
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left"
                },
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
            custom_filter = function (buf_number)
                if string.match(vim.fn['bufname'](buf_number), "term") then
                    return false
                end
                local tabId = tabpagenr()
                print(dump(tab_group[tabId]), buf_number)
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

function plugin_config:nvim_tree()
    require'nvim-tree'.setup {
        view = {
            mappings = {
                list = {
                    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
                    { key = "<C-e>",                        action = "edit_in_place" },
                    { key = {"O"},                          action = "edit_no_picker" },
                    { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
                    { key = "E",                        action = "vsplit" },
                    { key = "s",                        action = "split" },
                    { key = "<C-t>",                        action = "tabnew" },
                    { key = "<",                            action = "prev_sibling" },
                    { key = ">",                            action = "next_sibling" },
                    { key = "P",                            action = "parent_node" },
                    { key = "<BS>",                         action = "close_node" },
                    { key = "<Tab>",                        action = "preview" },
                    { key = "K",                            action = "first_sibling" },
                    { key = "J",                            action = "last_sibling" },
                    { key = "I",                            action = "toggle_git_ignored" },
                    { key = "H",                            action = "toggle_dotfiles" },
                    { key = "R",                            action = "refresh" },
                    { key = "a",                            action = "create" },
                    { key = "d",                            action = "remove" },
                    { key = "D",                            action = "trash" },
                    { key = "r",                            action = "rename" },
                    { key = "<C-r>",                        action = "full_rename" },
                    { key = "x",                            action = "cut" },
                    { key = "c",                            action = "copy" },
                    { key = "p",                            action = "paste" },
                    { key = "y",                            action = "copy_name" },
                    { key = "Y",                            action = "copy_path" },
                    { key = "gy",                           action = "copy_absolute_path" },
                    { key = "[c",                           action = "prev_git_item" },
                    { key = "]c",                           action = "next_git_item" },
                    { key = "<BS>",                            action = "dir_up" },
                    { key = "S",                            action = "system_open" },
                    { key = "q",                            action = "close" },
                    { key = "?",                           action = "toggle_help" },
                    { key = "W",                            action = "collapse_all" },
                    { key = "f",                            action = "search_node" },
                    { key = "<C-k>",                        action = "toggle_file_info" },
                    { key = ".",                            action = "run_file_command" }
                }
            }
        }
    }
end

function plugin_config:incline()
    require('incline').setup {
        render = function (props)
            local bufname = vim.api.nvim_buf_get_name(props.buf)
            if bufname == "" then
                return "[No Name]"
            else
                bufname = vim.fn.fnamemodify(bufname, ":.")
            end
            local icon = require("nvim-web-devicons").get_icon(bufname, nil, { default = true })
            local max_len = vim.api.nvim_win_get_width(props.win) / 2
            local render_modified = vim.api.nvim_buf_get_option(props.buf, 'modified') and '+' or ''

            if #bufname > max_len then
                return icon .. " …" .. string.sub(bufname, #bufname - max_len, -1) .. render_modified
            else
                return icon .. " " .. bufname .. render_modified
            end
        end,
        window = {
            zindex = 60,
            width = "fit",
            placement = { horizontal = "right", vertical = "top" },
            margin = {
                horizontal = { left = 1, right = 0 },
                vertical = { bottom = 0, top = 1 },
            },
            padding = { left = 1, right = 1 },
            padding_char = " ",
        },
        hide = {
            cursorline = "focused_win",
            focused_win = false,
        }
    }

    vim.cmd[[
    highlight InclineNormal ctermbg=0 guibg=#564D82
    highlight InclineNormalNC ctermbg=0 guibg=#564D82
    ]]
end

function plugin_config:nvim_ts_autotag()
    require('nvim-ts-autotag').setup()
end

function plugin_config:scrollview()
    require('scrollview').setup({
        excluded_filetypes = {'nerdtree', 'coc-explorer', 'vista'},
    })
end

function plugin_config:todo_comments()
    require("todo-comments").setup {}
end

function plugin_config:winbar()
    require("winbar").setup {
        enabled = true,

        show_file_path = true,
        show_symbols = true,

        colors = {
            path = '', -- You can customize colors like #c946fd
            file_name = '',
            symbols = '',
        },

        icons = {
            file_icon_default = '',
            seperator = '>',
            editor_state = '●',
            lock_icon = '',
        },

        exclude_filetype = {
            'help',
            'startify',
            'dashboard',
            'packer',
            'neogitstatus',
            'NvimTree',
            'Trouble',
            'alpha',
            'lir',
            'Outline',
            'spectre_panel',
            'toggleterm',
            'qf',
            'coc-explorer',
            'which_key',
            '',
        }
    }
end

for _,v in ipairs(enable_plugin) do
    plugin_config[v]()
end

-- for user

require 'markdown_org'
