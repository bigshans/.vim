
# Table of Contents

# Aerian's Vim for Linux

## Introduction

这是我个人的 Vim 配置

## Config

-   config.vim : 对插件的一些配置
-   plugin.vim : 插件列表
-   shortcut.vim : 自定义快捷键
-   nonscript : 无需插件的的脚本，依赖 script.vim
-   script.vim : 无依赖的一些基本设置以及自定义函数

## 主要插件

| 使用到的插件         | 作用                                       |
| -------------------- | ------------------------------------------ |
| coc.nvim             | 作为最基础的自动补全、代码检测等的基础框架 |
| vim-multiple-cursors | 多光标编辑                                 |
| vim-one              | one 主题                                   |
| emmet-vim            | emmet 缩写                                 |
| auto-pairs           | 括号匹配                                   |
| vim-autoformat       | 自动补全                                   |
| vim-fugitive         | git 命令的 vim 封装                        |
| vim-zenroom2         | 提供更加专注的编辑页面                     |
| vim-which-key        | 按键指导                                   |
| vista.vim            | 基于 LSP 的 Tag 获取插件                   |
| vim-clap             | 有浮动窗口的查找插件                       |
| ack.vim              | 基于 ack 的文件查找插件                    |
| onedark.vim          | onedark 风格的主题                         |
| CamelCaseMotion      | 实现基于驼峰的光标移动                     |
| vimspector           | debug 插件                                 |
| spelunker.vim        | 拼写检查                                   |

## 快捷键

### 常用的基础操作

| 快捷键  | 模式               | 作用                         |
| ------- | ------------------ | ---------------------------- |
| `<leader>q` | 普通模式 | 强制退出 |
| `<leader>Q` | 普通模式 | 强制退出全部 |
| `<leader>fs` | 普通模式 | 保存文件 |
| `<leader>fS` | 普通模式 | 以 root 模式保存文件 |
| `<leader>ft` | 普通模式 | 查看当前文件树 |
| `<leader>y` | 可视模式 | 复制当前文本到系统剪贴板 |
| `<leader>p` | 普通模式 | 粘贴剪贴板的内容 |
| `<C-e>` | 插入模式 | 到行尾 |
| `C-a>` | 插入模式 | 到行首 |

### 多光标

| 快捷键  | 模式               | 作用                         |
| ------- | ------------------ | ---------------------------- |
| `<C-n>` | 普通模式、可视模式 | 多光标模式启动               |
| q       | --                 | 取消当前的多光标，并到下一个 |
| Q       | --                 | 去除当前多光标               |
| n       | --                 | 选中下一个                   |
| N       | --                 | 选中前一个                   |

### Coc

| 快捷键        | 模式     | 作用              |
| ------------- | -------- | ----------------- |
| `<leader>jR`  | 普通模式 | 重启 Coc          |
| `<leader>jf`  | 普通模式 | 修复当前错误      |
| `<leader>jr`  | 普通模式 | 重命名当前 symbol |
| `<leader>ja`  | 普通模式 | 执行 codeaction   |
| K             | 普通模式 | 查看定义的文档    |
| `<leader>jjt` | 普通模式 | 查看类型定义      |
| `<leader>jjf` | 普通模式 | 查看接口定义      |
| gd            | 普通模式 | 查看代码提及处    |

### 多窗口操作

| 快捷键       | 模式     | 作用             |
| ------------ | -------- | ---------------- |
| `<leader>wc` | 普通模式 | 选择窗口         |
| `<leader>wa` | 普通模式 | 选择交换窗口     |
| `<leader>wd` | 普通模式 | 只留下当前窗口   |
| `<leader>wj` | 普通模式 | 移动到下面的窗口 |
| `<leader>wh` | 普通模式 | 移动到左面的窗口 |
| `<leader>wk` | 普通模式 | 移动到上面的窗口 |
| `<leader>wl` | 普通模式 | 移动到右面的窗口 |
| `<leader>ws` | 普通模式 | 窗口横向分割     |
| `<leader>wv` | 普通模式 | 窗口纵向分割     |

