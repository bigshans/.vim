# Vim 配置

一套以 Vim 为主、兼顾 VSCode / JetBrains 的 Vimscript 配置。默认配色为本地开发的
[墨观 Inkstone](https://github.com/Konata9/inkstone)，插件用 vim-plug 管理，
LSP 走 coc.nvim。

- 入口：`~/.vimrc` 是 `~/.vim/_vimrc` 的软链接
- 日常以普通 Vim 9.2 使用；`init.vim` / `mini.vim` 是备用入口
- 配置按“一个插件一个文件”组织，插件清单集中在 `core/plugins.vim`

## 环境要求

| 依赖 | 用途 | 是否必需 |
|---|---|---|
| Vim 9.2+ | 主体 | 必需 |
| git | vim-plug 安装插件 | 必需 |
| node + yarn | coc.nvim 及语言服务 | 用 Coc 时必需 |
| ripgrep / fd | LeaderF / vim-project 搜索 | 强烈建议 |
| Nerd Font | airline / 图标 | 建议 |
| fcitx5-remote | 输入法状态切换 | 可选 |
| python3 | fcitx 插件回退路径 | 可选 |

## 快速开始

仓库本身放在 `~/.vim`，并让 `~/.vimrc` 指向 `_vimrc`：

```sh
git clone <repo> ~/.vim
ln -sf ~/.vim/_vimrc ~/.vimrc
vim +PlugInstall
```

首次启动时 coc 会根据 `g:coc_global_extensions` 自动安装语言服务。之后日常更新：

```vim
:PlugUpdate     " 更新插件
:PlugUpgrade    " 更新 vim-plug
:CocUpdate      " 更新 coc 扩展
```

## 目录结构

```
~/.vim
├── _vimrc              # 真正的入口（~/.vimrc 指向它）
├── init.vim            # Neovim / VSCode-Neovim 入口
├── mini.vim            # 最小配置，排查问题时用
├── ginit.vim           # GUI（gvim）专用
├── core/
│   ├── options.vim     # 编辑器选项
│   ├── plugins.vim     # 插件清单 + 配置加载顺序
│   ├── builtin.vim     # 通用键位与内置命令
│   ├── theme.vim       # 配色与主题切换
│   ├── commands.vim    # 自定义命令
│   └── conf.d/         # 每个插件一个配置文件
├── autoload/           # packs#*（插件管理）、utils#*（公共函数）
├── plugin/             # dashboard、terminal-help 等自定义插件
├── ftplugin/           # 文件类型相关的选项与映射
├── after/ftplugin/     # b:undo_ftplugin 清理（见“维护约定”）
├── syntax/             # 自定义语法补充
├── after/syntax/       # 例如 PKGBUILD 的 license 兼容
├── UltiSnips/          # 代码片段
├── tasks.ini           # asynctasks 任务
├── ideavimrc           # JetBrains IdeaVim 配置
├── vscode/             # VSCode + Neovim 配置
├── win-coc/            # Windows 下的 coc 配置
└── bundle/             # vim-plug 安装的插件（已 gitignore）
```

## 配置是怎么加载的

1. `~/.vimrc` → `_vimrc`
2. `_vimrc` 把配置目录加入 `runtimepath`，依次加载：
   `core/options.vim` → `core/plugins.vim` → `core/builtin.vim`
   → `core/theme.vim` → `core/commands.vim`
3. `core/plugins.vim` 里每个 `packs#def()` 既注册插件，也登记它的配置名；
   `packs#end()` 在 `plug#end()` 之后才会 source 对应的 `core/conf.d/<name>.vim`
4. vimrc 执行完后，Vim 才加载各插件的 `plugin/` 脚本；
   文件类型相关的清理逻辑放在 `after/ftplugin/`，保证在插件自带 ftplugin 之后执行

因此 `core/conf.d/` 下的文件只是“候选配置”，只有被 `core/plugins.vim` 引用时才会生效。

## 键位约定

`<leader>` 是空格。前缀基本按用途分组，记住前缀就能猜键位：

| 前缀 | 含义 | 例子 |
|---|---|---|
| `<leader>f` | file / 文件 | `<leader>ff` 找文件、`<leader>fs` 保存 |
| `<leader>j` | jump / LSP（coc） | `<leader>jr` 重命名、`<leader>jd` 诊断 |
| `<leader>s` | search | `<leader>sr` 全文搜索、`<leader>ss` 搜当前 buffer |
| `<leader>p` | project / session | `<leader>pp` 项目列表、`<leader>ps` 保存会话 |
| `<leader>t` | terminal | `<leader>tt` 切换 floaterm |
| `<leader>g` | git | `<leader>gc` commit、`<leader>gd` diff |
| `<leader>w` / `<leader>b` | window / buffer-tab | `<leader>wv` 垂直分屏、`<leader>b3` 第 3 个 tab |
| `<leader>e` | easymotion | `<leader>ef` 单字符跳转 |
| `<leader>c` | comment | `<leader>ci` 注释切换 |
| `<leader>a` | async | `<leader>ar` 异步命令、`<leader>ad` 停止 |
| `<leader>P` | plugin | `<leader>Pi` 安装插件 |

窗口与 tab 另有不带 leader 的快捷方式：`zh/zj/zk/zl` 切窗口、
`<M-1>`…`<M-0>` 切 tab、`<M-j>/<M-k>` 移动行。

## 日常操作

### 文件、窗口与项目

| 快捷键 | 作用 |
|---|---|
| `<leader>q` | 关闭当前 buffer（最后一个则退出） |
| `<leader>Q` | 强制退出全部 |
| `<leader>fs` / `<leader>fS` | 保存 / 以 root 保存 |
| `<leader>ft` | 打开或关闭文件树（coc-explorer） |
| `cd` | 把 cwd 切到当前文件所在目录 |
| `<leader>op` / `<leader>oc` | 打开 `core/plugins.vim` / 搜索配置文件 |
| `zh` `zj` `zk` `zl` | 向左 / 下 / 上 / 右切窗口 |
| `<C-J>` / `<C-K>` | 向下 / 上切窗并最大化 |
| `<leader>w1`…`<leader>w9` | 跳到第 N 个窗口 |
| `<leader>wc` / `<leader>ws` / `<leader>wv` | 关闭 / 水平分割 / 垂直分割 |
| `<leader>b1`…`<leader>b0` | 跳到第 N 个 tab |
| `<leader>bn` / `<leader>bp` / `<leader>bd` | 下一个 / 上一个 / 关闭 tab |
| `<M-1>`…`<M-0>` | 跳到第 N 个 tab |

### 项目与会话

配置里有两套相关机制，职责不同：

- **vim-project**：以“项目（根目录）”为单位，隔离搜索、任务、git 和配置，
  可为每个项目保存窗口布局（`use_session=1`）。数据在 `~/.vim/vim-project-config/`。
- **vim-session**：显式的全局会话，保存/恢复当前窗口与缓冲区布局。
  数据在 `~/.vim/sessions/`，`autosave`/`autoload` 均关闭，不会自动恢复。

| 快捷键 | 作用 |
|---|---|
| `<leader>pp` | 项目列表 |
| `<leader>pf` / `<leader>pg` | 项目内搜文件 / 全文搜索 |
| `<leader>pr` | 运行项目任务 |
| `<leader>pG` / `<leader>pi` | 项目 git 状态 / 项目信息 |
| `<leader>pa` | 把当前目录添加为项目（无 vim-project 时退回存为 session） |
| `<leader>ps` | 保存全局 session |
| `<leader>po` / `<leader>sp` | 打开全局 session |
| `<leader>pd` / `<leader>pc` | 删除 / 关闭 session |

### 搜索

| 快捷键 | 作用 |
|---|---|
| `<leader>ff` | 找文件（LeaderF） |
| `<leader>sb` | buffer 列表 |
| `<leader>sr` | 全项目 ripgrep 搜索 |
| `<leader>ss` | 搜索当前 buffer 的行 |
| `<leader>sh` | 搜索 help |
| `<leader>sd` | LeaderF file |
| `<leader>st` | 搜索 asynctasks 任务 |
| `<leader>tf` | 搜索 floaterm |
| `<C-S-f>` | CtrlSF 搜索 |

### LSP（coc.nvim）

| 快捷键 | 作用 |
|---|---|
| `gd` / `gy` / `gi` / `gr` | 定义 / 类型定义 / 实现 / 引用 |
| `K` 或 `<leader>jk` | 查看文档 |
| `<leader>ja` / `<leader>je` | code action / refactor |
| `<leader>jf` / `<leader>jF` | 修复当前 / 修复全部（可视模式为对选区 refactor） |
| `<leader>jr` | 重命名 |
| `<leader>jl` | codelens action |
| `<leader>jc` / `<leader>jd` | 当前行诊断 / 诊断列表 |
| `[g` / `]g` | 上 / 下一条诊断 |
| `<leader>jo` | 打开或关闭 outline |
| `<leader>jD` | 切换当前 buffer 的补全 |
| `<leader>j=` | 格式化 |
| `T` | 翻译（coc-translator） |
| `<leader>oC` | 打开 `coc-settings.json` |

### 编辑

| 快捷键 | 作用 |
|---|---|
| `<leader>ci` | 注释 / 取消注释（tcomment） |
| `;=` | Autoformat |
| `f` / `F` | clever-f 增强的字符跳转 |
| `<leader>ef` / `<leader>eF` | easymotion 单 / 双字符跳转 |
| `sa{motion}{char}` | 添加环绕（vim-sandwich） |
| `sd{char}` / `sr{old}{new}` | 删除 / 替换环绕 |
| `<M-j>` / `<M-k>` | 向下 / 向上移动行（普通、插入、可视） |
| `Y` / `P` | 复制到系统剪贴板 / 从剪贴板粘贴 |
| `<leader>y` | 打开 coc yank 列表 |
| `<C-g>` | 清除搜索高亮 |

### 多光标（vim-visual-multi）

默认映射已关闭，只保留常用入口；进入多光标模式后按 `?` 可查看其余操作。

| 快捷键 | 作用 |
|---|---|
| `<C-n>` | 选中当前词 / 下一个匹配 |
| `<C-LeftMouse>` | 鼠标添加光标 |
| `<C-RightMouse>` | 鼠标选词 |
| `<M-C-RightMouse>` | 列选择 |

### Git

| 快捷键 | 作用 |
|---|---|
| `<leader>ga` | `git add .` |
| `<leader>gb` / `<leader>gc` | blame / commit |
| `<leader>gd` / `<leader>gr` | diff 分屏 / `:Gread` |
| `<leader>gg` | `:Git` |
| `<leader>gps` / `<leader>gpl` | push / pull |
| `<leader>gw` | `:Gwrite` |

### 终端与异步任务

| 快捷键 | 模式 | 作用 |
|---|---|---|
| `<leader>tt` / `<leader>tn` / `<leader>tk` | 普通 | 切换 / 新建 / 关闭 floaterm |
| `<M-t>` | 普通 | 打开或关闭 terminal-help 终端 |
| `<M-7>` | floaterm 内 | 新建 floaterm |
| `<M-p>` / `<M-n>` | floaterm 内 | 上一个 / 下一个 floaterm |
| `<leader>af` | 普通 | 在 floaterm 运行 asynctask |
| `<leader>ar` / `<leader>ad` | 普通 | 运行自定义异步命令 / 停止任务 |

任务定义在 `tasks.ini`，`<leader>st` 可搜索并运行。

### 导航（vim-navigator）

| 快捷键 | 作用 |
|---|---|
| `<tab><tab>` 或 `<leader>?` | 打开 which-key 风格导航菜单 |

菜单按用途分组（文件、LSP、缓冲区/标签、搜索、Git、项目/会话、终端等），
条目描述与上面的键位表一致。忘记快捷键时，打开菜单按对应首字母即可继续查找；
也可以用 `<tab><tab>` 进入分组后再按具体键，或随时按 `Esc` 退出。

## 插件管理

插件清单在 `core/plugins.vim`，统一通过 `packs#def()` 注册：

```vim
" 只要插件
call packs#def('tpope/vim-repeat')

" 插件 + 配置文件 core/conf.d/coc.vim
call packs#def('neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile' }, 'coc')

" 懒加载：首次执行 :Goyo 时才加载
call packs#def('junegunn/goyo.vim', {'on': 'Goyo'}, 'goyo')

" 按文件类型加载
call packs#def('preservim/vim-markdown', { 'for': 'markdown' }, 'markdown')
```

新增插件时：

1. 在 `core/plugins.vim` 加一行 `packs#def`，需要配置就带上配置名
2. 在 `core/conf.d/` 新建同名 `.vim` 文件
3. `:PlugInstall`，重启

### 休眠配置

`core/conf.d/` 里有些文件对应的插件暂时停用，文件本身保留，方便以后启用。
这些配置不会被加载，可用命令查看：

```vim
:PacksDormant
```

当前休眠的配置：`comment`、`nerdcommenter`、`startify`、`vim-winlayout`。

> `comment` 与 `tcomment` 都定义了 `<leader>ci`，两者只应启用一个。

## 主题

默认使用 inkstone（本地开发，放在 `bundle/vim-inkstone`，不在 vim-plug 管理内）。

```vim
:SetTheme sonokai        " 切换配色
:SetTheme inkstone
:Inkstone xuanzhi        " 切换 inkstone 变体
```

可用变体：`canghai`（默认）、`xuanmo`、`xuanmo-dimmed`、`xuanzhi`、
`xuanzhi-dimmed`、`qingci`。默认开启 `termguicolors`；只有在 256 色终端下
inkstone 才会计算 cterm 近似色。

## 多入口与多编辑器

| 入口 | 用途 |
|---|---|
| `~/.vimrc -> _vimrc` | 默认 Vim 入口 |
| `init.vim` | Neovim / VSCode-Neovim；存在 `g:vscode` 时转向 `vscode/init.vim` |
| `mini.vim` | 最小配置，用于排查插件问题 |
| `vscode/` | VSCode + Neovim 的键位与设置 |
| `ideavimrc` | JetBrains IDE 的 IdeaVim 配置 |
| `win-coc/` | Windows 下的 coc 配置 |

这些入口与主配置保持“意图一致”，但具体键位并不完全相同（例如 VSCode 里
`<leader>ft` 是切换侧边栏）。

## 维护约定

- **文件类型清理**：buffer 局部映射和选项的还原写在 `after/ftplugin/<ft>.vim`，
  通过 `utils#undo_append()` 注册、`utils#unmap_buffer()` 安全解绑。
  不要写在 `ftplugin/`，否则会被 Vim 运行时的 `b:undo_ftplugin` 覆盖。
- **公共函数**：放 `autoload/utils.vim`；插件加载逻辑在 `autoload/packs.vim`。
- **段落/命令**：自定义命令集中在 `core/commands.vim`，通用键位在 `core/builtin.vim`。
- **性能**：改动启动相关代码后可用
  `vim --startuptime /tmp/st.log -c qa` 对比，避免明显回退。
- **已知情况**：打开 markdown 时可能看到一条来自 Vim 自带
  `ftplugin/markdown.vim` 的 `E31`（其 `sil! nunmap <buffer> [[` 在 Vim 9.2 下
  未能抑制），不影响功能，也不是本配置引入的。
