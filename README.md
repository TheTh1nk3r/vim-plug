## vim-plug

[TOC]

> 对 `vim` 命令的学习及` vim-plug`配置做个记录



### 0x01 vim基础命令

#### 1. 光标移动

```
# hjkl
# 2w 向前移动两个单词
# 3e 向前移动到第 3 个单词的末尾
# 0 移动到行首
# $ 当前行的末尾
# gg 文件第一行
# G 文件最后一行
# 行号+G 指定行
# <ctrl>+o 跳转回之前的位置
# <ctrl>+i 返回跳转之前的位置
```



#### 2. 删除

```
# x 删除当前字符
# dw 删除至当前单词末尾
# de 删除至当前单词末尾，包括当前字符
# d$ 删除至当前行尾
# dd 删除整行
# ndd 删除n行
```



#### 3. 撤销

```
# u 撤销
# <ctrl>+r 取消撤销
复制粘贴剪切
# v 进入可视模式
# y 复制
# p 粘贴
# yy 复制当前行
# dd 剪切当前行
```



#### 4. 状态

```
#<ctrl>+g 显示当前行以及文件信息
查找
# / 正向查找（n：继续查找，N：相反方向继续查找）
# ？ 逆向查找
# % 查找配对的 {，[，(
# :set ic 忽略大小写
# :set noic 取消忽略大小写
# :set hls 匹配项高亮显示
# :set is 显示部分匹配
```



#### 5. 替换

```
# :s/old/new 替换该行第一个匹配串
# :s/old/new/g 替换全行的匹配串
# :%s/old/new/g 替换整个文件的匹配串
```



#### 6. 折叠

```
# zc 折叠
# zC 折叠所有嵌套
# zo 展开折叠
# zO 展开所有折叠嵌套
```



#### 7. 执行外部命令

```
# :!shell 执行外部命令
```



### 0x02 .vimrc配置

> `.vimrc` 是 Vim 的配置文件，需要自己创建



```

# 取消备份
set nobackup
set noswapfile

# 文件编码
set encoding=utf-8

# 显示行号
set number

# 取消换行
set nowrap

# 查找
set ic
set hls
set is

# 突出显示当前行
set cursorline

# 显示光标当前位置
set ruler

# 设置缩进
set cindent
set tabstop=2
set shiftwidth=2

# 左下角显示当前vim模式
set showmode

# 代码折叠
# 启动 vim 时关闭折叠代码
set nofoldenable

# 主题
syntax enable
set background=dark
colorscheme solarized

```



### 0x03 插件配置

#### 1. 树形目录

```
"Plug 'scrooloose/nerdtree'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeShowIgnoredStatus = 1
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }



# ctrl + w + h    光标 focus 左侧树形目录
# ctrl + w + l    光标 focus 右侧文件显示窗口
# ctrl + w + w    光标自动在左右侧窗口切换
# ctrl + w + r    移动当前窗口的布局位置
# o       在已有窗口中打开文件、目录或书签，并跳到该窗口
# go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
# t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
# T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
# i       split 一个新窗口打开选中文件，并跳到该窗口
# gi      split 一个新窗口打开选中文件，但不跳到该窗口
# s       vsplit 一个新窗口打开选中文件，并跳到该窗口
# gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
# !       执行当前文件
# O       递归打开选中 结点下的所有目录
# x       合拢选中结点的父目录
# X       递归 合拢选中结点下的所有目录
# e       Edit the current dif
# 双击    相当于 NERDTree-o
# 中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e
# D       删除当前书签
# P       跳到根结点
# p       跳到父结点
# K       跳到当前目录下同级的第一个结点
# J       跳到当前目录下同级的最后一个结点
# k       跳到当前目录下同级的前一个结点
# j       跳到当前目录下同级的后一个结点
# C       将选中目录或选中文件的父目录设为根结点
# u       将当前根结点的父目录设为根目录，并变成合拢原根结点
# U       将当前根结点的父目录设为根目录，但保持展开原根结点
# r       递归刷新选中目录
# R       递归刷新根结点
# m       显示文件系统菜单
# cd      将 CWD 设为选中目录
# I       切换是否显示隐藏文件
# f       切换是否使用文件过滤器
# F       切换是否显示文件
# B       切换是否显示书签
# q       关闭 NerdTree 窗口
# ?       切换是否显示 Quick Help

:tabnew [++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab
:tabc   关闭当前的 tab
:tabo   关闭所有其他的 tab
:tabs   查看所有打开的 tab
:tabp   前一个 tab
:tabn   后一个 tab
```



#### 2. 代码，引号，路径补全

```
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
```



#### 3. 语法高亮，检查

```
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'

let g:ale_linters = {
\    'javascript': ['eslint'],
\    'css': ['stylelint'],
\}
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'css': ['stylelint'],
\}
let g:ale_fix_on_save = 1

let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '▶'

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
```



#### 4. 文件，代码搜索

```
Plug 'rking/ag.vim'
Plug 'kien/ctrlp.vim'
```



#### 5. 加强版状态栏

```
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='papercolor'
```



#### 6. Markdown

```
Plug 'suan/vim-instant-markdown'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
# :InstantMarkdownPreview
```



#### 7. python 

```
Plug 'numirias/semshgi',{'do': ':UpdateRemotePlugins','for' : ['python','vim-plug']}
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

let python_highlight_all=1
au Filetype python set tabstop=4
au Filetype python set softtabstop=4
au Filetype python set shiftwidth=4
au Filetype python set textwidth=79
au Filetype python set expandtab
au Filetype python set autoindent
au Filetype python set fileformat=unix
autocmd Filetype python set foldmethod=indent
autocmd Filetype python set foldlevel=99


" 自动执行：按一下F5，自动执行代码：
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python3 %"
        elseif &filetype == 'html'
                exec "!firefox % &"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
        endif
endfunc

Plug 'Chiel92/vim-autoformat'
" f6 格式化代码 
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

Plug 'https://github.com/bling/vim-airline'
```

