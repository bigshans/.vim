local plugin_config = {}

function plugin_config:treesitter()
    -- Load custom tree-sitter grammar for org filetype
    require('orgmode').setup_ts_grammar()
    -- Tree-sitter configuration
    require("nvim-treesitter.install").command_extra_args = {
        curl = { "--proxy", "http://127.0.0.1:8889" },
    }

    require('nvim-treesitter.configs').setup({
        -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
        ensure_installed = 'all',
        ignore_install = {
            'hcl',
            'lua',
            'vim',
            'markdown',
            'swift',
            'typescript',
            'javascript',
            'rust',
            'php',
            'vue',
            'html',
            'twig',
            'diff',
            'nickel',
        },
        sync_install = false,
        highlight = {
            enable = true,
            disable = function(lang, buf)
                if lang ~= 'org' then
                    return false
                end
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
        },
    })
    require("nvim-treesitter.install").prefer_git = true
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
            j = {
                description = 'Journal',
                template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
                target = org_dir .. 'journal.org',
            },
            n = { description = 'Note', template = '* From %?', target = org_dir .. '笔记.org' },
        },
        mappings = {
            global = {
                org_agenda = { '<Leader>oA', '<Leader>oa' },
                org_capture = 'gC',
            },
            org = {
                org_todo = { 'cit', 'mt' },
            },
        },
    })

    require('org-bullets').setup({
        -- symbols = { "◉", "○", "✸", "✿" },
    })
end

function plugin_config:npairs()
    local remap = vim.api.nvim_set_keymap
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    local cond = require('nvim-autopairs.conds')
    local get_prev_char = function(opt)
        return opt.line:sub(opt.col -1, opt.col + #opt.rule.start_pair -2)
    end
    npairs.setup({ map_cr = false })
    npairs.remove_rule('\'')
    npairs.add_rule(Rule('\'', '\''):with_pair(cond.not_before_regex_check('%w')):with_pair(function(_)
        return vim.bo.filetype ~= 'lisp' and vim.bo.filetype ~= 'scheme'
    end))
    npairs.add_rule(Rule('${', '}'):with_pair(cond.before_regex('`.*')):with_pair(function(_)
        return vim.bo.filetype == 'typescript' or vim.bo.filetype == 'javascript'
    end))
    -- Chinese symbol supports
    -- has some problem
    -- local chinese_symbols = {
    --     {'“', '”'},
    --     {'‘', '’'},
    --     {'（', '）'},
    --     {'「', '」'},
    --     {'《', '》'},
    --     {'【', '】'},
    --     {'〔', '〕'},
    -- };
    -- for _, value in ipairs(chinese_symbols) do
    --     npairs.add_rule(Rule(value[1], value[2]))
    -- end
    Rule('>[%w%s]*$', '^%s*</', {
        '-html',
        '-typescript',
        '-typescriptreact',
        '-javascript',
        '-javascriptreact',
        '-svelte',
        '-vue',
        '-xml',
        '-rescript',
    })
    -- skip it, if you use another global object
    _G.MUtils = {}

    MUtils.completion_confirm = function()
        if vim.fn['coc#pum#visible']() ~= 0 then
            return vim.fn['coc#pum#confirm']()
        else
            return npairs.autopairs_cr()
        end
    end

    remap('i', '<CR>', 'v:lua.MUtils.completion_confirm()', { expr = true, noremap = true })
end

function plugin_config:indent_blank_line()
    require('indent_blankline').setup({
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = false,
        buftype_exclude = { 'terminal' },
        filetype_exclude = { 'dashboard', 'startify', 'coc-explorer', 'which_key', 'markdown', 'help', 'json' },
        space_char_blankline = ' ',
    })
end

function plugin_config:telescope()
    require('telescope').setup({
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            layout_config = {
                prompt_position = 'bottom',
            },
            -- sorting_strategy = 'ascending',
        },
        pickers = {},
        extensions = {},
    })
end

function plugin_config:hop()
    require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
end

function plugin_config:bufferline()
    local tab_group = {}
    local tabpagenr = vim.fn['tabpagenr']
    local bufnr = vim.fn['bufnr']
    local buflisted = vim.fn['buflisted']
    vim.api.nvim_create_autocmd({ 'BufEnter' }, {
        pattern = '*',
        callback = function()
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
        end,
    })
    vim.api.nvim_create_autocmd({ 'BufDelete' }, {
        pattern = '*',
        callback = function()
            local tabId = tabpagenr()
            if tab_group[tabId] then
                local new_tab_group = {}
                for k, tab_list in ipairs(tab_group) do
                    local list = {}
                    for _, v in ipairs(tab_list) do
                        if buflisted(v) > 0 then
                            table.insert(list, v)
                        end
                    end
                    if #list ~= 0 then
                        new_tab_group[k] = list
                    end
                end
                tab_group = new_tab_group
            end
        end,
    })
    require('bufferline').setup({
        options = {
            enforce_regular_tabs = false,
            diagnostics = 'coc',
            diagnostics_update_in_insert = true,
            buffer_close_icon = "",
            diagnostics_indicator = function()
                local coc_warn = vim.fn['custom#lightline#coc_diagnostic_warning_num']
                local coc_error = vim.fn['custom#lightline#coc_diagnostic_error_num']
                local error = coc_error()
                local warn = coc_warn()
                if error ~= 0 or warn ~= 0 then
                    if error ~= 0 then
                        return ' ' .. error
                    else
                        return ' ' .. warn
                    end
                end
                return ''
            end,
            numbers = function(opts)
                return string.format(' %s/%s', vim.fn['tabpagenr'](), opts.ordinal)
            end,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    text_align = 'left',
                },
                {
                    filetype = 'coc-explorer',
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = 'Directory',
                    text_align = 'left',
                },
                {
                    filetype = 'vista',
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = 'Tags',
                    text_align = 'right',
                },
            },
            separator_style = 'slant',
            custom_filter = function(buf_number)
                if string.match(vim.fn['bufname'](buf_number), '^term://') then
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
            end,
        },
    })
end

function plugin_config:nvim_tree()
    require('nvim-tree').setup({
        view = {
            mappings = {
                list = {
                    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
                    { key = '<C-e>', action = 'edit_in_place' },
                    { key = { 'O' }, action = 'edit_no_picker' },
                    { key = { '<2-RightMouse>', '<C-]>' }, action = 'cd' },
                    { key = 'E', action = 'vsplit' },
                    { key = 's', action = 'split' },
                    { key = '<C-t>', action = 'tabnew' },
                    { key = '<', action = 'prev_sibling' },
                    { key = '>', action = 'next_sibling' },
                    { key = 'P', action = 'parent_node' },
                    { key = '<BS>', action = 'close_node' },
                    { key = '<Tab>', action = 'preview' },
                    { key = 'K', action = 'first_sibling' },
                    { key = 'J', action = 'last_sibling' },
                    { key = 'I', action = 'toggle_git_ignored' },
                    { key = 'H', action = 'toggle_dotfiles' },
                    { key = 'R', action = 'refresh' },
                    { key = 'a', action = 'create' },
                    { key = 'd', action = 'remove' },
                    { key = 'D', action = 'trash' },
                    { key = 'r', action = 'rename' },
                    { key = '<C-r>', action = 'full_rename' },
                    { key = 'x', action = 'cut' },
                    { key = 'c', action = 'copy' },
                    { key = 'p', action = 'paste' },
                    { key = 'y', action = 'copy_name' },
                    { key = 'Y', action = 'copy_path' },
                    { key = 'gy', action = 'copy_absolute_path' },
                    { key = '[c', action = 'prev_git_item' },
                    { key = ']c', action = 'next_git_item' },
                    { key = '<BS>', action = 'dir_up' },
                    { key = 'S', action = 'system_open' },
                    { key = 'q', action = 'close' },
                    { key = '?', action = 'toggle_help' },
                    { key = 'W', action = 'collapse_all' },
                    { key = 'f', action = 'search_node' },
                    { key = '<C-k>', action = 'toggle_file_info' },
                    { key = '.', action = 'run_file_command' },
                },
            },
        },
    })
end

function plugin_config:incline()
    require('incline').setup({
        render = function(props)
            local bufname = vim.api.nvim_buf_get_name(props.buf)
            local ro = vim.api.nvim_buf_get_option(props.buf, 'readonly');
            local suffix = function (color)
                if ro then
                    return { ' ', guifg = '#FF6578'}
                else
                    return { ' ●', guifg = color }
                end
            end
            if bufname == '' then
                local ft = vim.bo.filetype
                local icon, color = require('nvim-web-devicons').get_icon_color_by_filetype(ft, nil, { default = true })
                local render = {
                    { icon, guifg = color },
                    { ' ' },
                    suffix('#EACB64'),
                }
                if ft ~= '' then
                    table.insert(render, { ' *' .. ft .. ' Buffer*' })
                else
                    icon, color = require('nvim-web-devicons').get_icon_color(bufname, nil, { default = true })
                    render[1] = { icon, guifg = color }
                    table.insert(render, { ' *No Name*' })
                end
                return render
            else
                bufname = vim.fn.fnamemodify(bufname, ':.')
            end
            local icon, color = require('nvim-web-devicons').get_icon_color(bufname, nil, { default = true })
            local max_len = vim.api.nvim_win_get_width(props.win) / 3
            local modified_color = vim.api.nvim_buf_get_option(props.buf, 'modified') and '#EACB64' or '#759D57'
            local render = {
                { icon, guifg = color },
                { ' ' },
                { bufname },
                suffix(modified_color),
            }

            if #bufname > max_len then
                render[2] = { ' …' }
                render[3] = { string.sub(bufname, #bufname - max_len, -1) }
            end
            return render
        end,
        window = {
            zindex = 60,
            width = 'fit',
            placement = { horizontal = 'right', vertical = 'top' },
            margin = {
                horizontal = { left = 1, right = 0 },
                vertical = { bottom = 0, top = 1 },
            },
            padding = { left = 1, right = 1 },
            padding_char = ' ',
        },
        hide = {
            cursorline = 'focused_win',
            focused_win = false,
        },
    })

    vim.cmd([[
    highlight InclineNormal ctermbg=0 guibg=#564D82
    highlight InclineNormalNC ctermbg=0 guibg=#564D82
    ]])
end

function plugin_config:nvim_ts_autotag()
    require('nvim-ts-autotag').setup()
end

function plugin_config:scrollview()
    require('scrollview').setup({
        excluded_filetypes = { 'nerdtree', 'coc-explorer', 'vista' },
    })
end

function plugin_config:todo_comments()
    require('todo-comments').setup({})
end

function plugin_config:winbar()
    require('winbar').setup({
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
        },
    })
end

function plugin_config:dashboard()
    local db = require('dashboard')
    local get_logo = vim.fn['custom#logo#get']

    db.custom_footer = { 'type e to new a buffer or type q to exit' }
    db.custom_header = get_logo()
    db.session_directory = vim.g.dashboard_session_directory

    db.custom_center = {
        {
            icon = '  ',
            desc = 'Open Last Session                       ',
            shortcut = 'SPC s l',
            action = 'SessionLoad',
        },
        { icon = '  ', desc = 'Open Org Agenda                         ', shortcut = 'SPC o A' },
        { icon = '  ', desc = 'Recently Opened Files                   ', shortcut = 'SPC f r' },
        { icon = '  ', desc = 'Open File                               ', shortcut = 'SPC f f' },
        { icon = '⚡ ', desc = 'Plugin Update                           ', shortcut = 'SPC P p' },
        { icon = '✨ ', desc = 'Plugin Install                          ', shortcut = 'SPC P i' },
        { icon = '  ', desc = 'Open Personal Dotfiles                  ', shortcut = 'SPC o d' },
    }
end

function plugin_config:rest()
    require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = true,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
            enabled = true,
            timeout = 150,
        },
        result = {
            -- toggle showing URL, HTTP info, headers at top the of result window
            show_url = true,
            show_http_info = true,
            show_headers = true,
            -- executables or functions for formatting response body [optional]
            -- set them to nil if you want to disable them
            formatters = {
                json = "jq",
                html = function(body)
                    return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
                end
            },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
    })
end

function plugin_config:comment()
    require('Comment').setup()
end

function plugin_config:cmdline()
    require('fine-cmdline').setup()
end

function plugin_config:hydra()
    local hydra = require('hydra')
    hydra({
        name = 'Windows',
        config = {
            invoke_on_body = true,
        },
        mode = 'n',
        body = 'z',
        heads = {
            { 'h', '<C-w>h' },
            { 'j', '<C-w>j' },
            { 'k', '<C-w>k' },
            { 'l', '<C-w>l' },
            { '<Esc>', nil,  { exit = true, desc = false }}
        }
    })
end

return plugin_config
