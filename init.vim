call plug#begin('~/.config/nvim/plugged/')

" 树形目录
Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'


" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'



" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
map <F10> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusShowIgnored = 1
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
" 代码，引号，路径补全
Plug 'Valloric/YouCompleteMe'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}


" YouCompleteMe 语句补全插件
set runtimepath+='~/.config/nvim/plugged/YouCompleteMe'
let g:ycm_server_python_interpreter='/usr/bin/python3'    "python版本在3以上
let g:ycm_global_ycm_extra_conf='~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py' "加载文件路径
" let g:ycm_clangd_binary_path = "~/ycm_temp/llvm_root_dir/bin/clangd"
" let g:clang_library_path='/usr/lib/llvm-10/lib/libclang.so'  "libclang路径

autocmd InsertLeave * if pumvisible() == 0|pclose|endif     " 离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_strings = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_key_invoke_completion = '<C-a>'  
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
let g:ycm_semantic_triggers = {		
					\'c,cpp,python,java,go,perl':['re!\w{2}'],
					\'cs,lua,javascript':['re!\w{2}'],
					\}  " 语义触发


inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>   
let g:ycm_min_num_of_chars_for_completion = 2                 " 从第2个键入字符就开始罗列匹配项
let g:ycm_max_num_candidates = 15							  " 候选数量设置
let g:ycm_auto_trigger = 1




" 语法高亮，检查

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

" Markdown
Plug 'suan/vim-instant-markdown'

let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" python 
" Plug 'numirias/semshgi',{'do': ':UpdateRemotePlugins','for' : ['python','vim-plug']}
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Python
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim'
Plug 'vim-scripts/indentpython.vim' " python缩进脚本

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


 " vim-autoformat                                                                                                                  
Plug 'Chiel92/vim-autoformat'
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Plugin 'https://github.com/bling/vim-airline'


call plug#end()



" 取消备份
"set nobackup
"set noswapfile

" 文件编码
set encoding=utf-8

" 显示行号
set relativenumber
"set number
set autoindent
" 取消换行
"setnowrap

" 查找
set ic
set hls
set is

" 突出显示当前行
set cursorline

" 显示光标当前位置
set ruler

" 设置缩进
set cindent
set tabstop=4
set shiftwidth=2

" 左下角显示当前vim模式
set showmode

" 代码折叠
" 启动 vim 时关闭折叠代码
set nofoldenable



" 当新建 .h .c .hpp .cpp .mk .sh等文件时自动调用SetTitleMy 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitleMy()"
" 加入注释
func SetCommentMy()
	call setline(1,"/*================================================================")
	call append(line("."),   "*   Copyright (C) ".strftime("%Y")." L  Ltd. All rights reserved.")
	call append(line(".")+1, "*   ")
	call append(line(".")+2, "*   文件名称：".expand("%:t"))
	call append(line(".")+3, "*   创 建 者：L ")
	call append(line(".")+4, "*   创建日期：".strftime("%Y年%m月%d日"))
	call append(line(".")+5, "*   描    述：")
	call append(line(".")+6, "*")
	call append(line(".")+7, "================================================================*/")
	call append(line(".")+8, "")
	call append(line(".")+9, "")

endfunc

" 加入shell,Makefile注释
func SetCommentMy_sh()
	call setline(1, "#================================================================")
	call setline(2, "#   Copyright (C) ".strftime("%Y")." L  Ltd. All rights reserved.")
	call setline(3, "#   ")
	call setline(4, "#   文件名称：".expand("%:t"))
	call setline(5, "#   创 建 者：L ")
	call setline(6, "#   创建日期：".strftime("%Y年%m月%d日"))
	call setline(7, "#   描    述：")
	call setline(8, "#")
	call setline(9, "#================================================================")
	call setline(10, "")
	call setline(11, "")
endfunc

" 定义函数SetTitleMy，自动插入文件头
func SetTitleMy()
	if &filetype == 'make'
		call setline(1,"")
		call setline(2,"")
		call SetCommentMy_sh()
	elseif &filetype == 'sh'
		call setline(1,"#!/bin/sh")
		call setline(2,"")
		call SetCommentMy_sh()

	else
	     call SetCommentMy()
	     if expand("%:e") == 'hpp'
		  call append(line(".")+10, "#ifndef ".toupper(expand("%:t:r"))."_H__")
		  call append(line(".")+11, "#define ".toupper(expand("%:t:r"))."_H__")
		  call append(line(".")+12, "#ifdef __cplusplus")
		  call append(line(".")+13, "extern \"C\"")
		  call append(line(".")+14, "{")
		  call append(line(".")+15, "#endif")
		  call append(line(".")+16, "")
		  call append(line(".")+17, "#ifdef __cplusplus")
		  call append(line(".")+18, "}")
		  call append(line(".")+19, "#endif")
		  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H__")

	elseif expand("%:e") == 'h'
          call append(line(".")+10, "#ifndef ".toupper(expand("%:t:r"))."_H__")
          call append(line(".")+11, "#define ".toupper(expand("%:t:r"))."_H__")
          call append(line(".")+12, "")
          call append(line(".")+13, "")
          call append(line(".")+14, "")
          call append(line(".")+15, "#endif //".toupper(expand("%:t:r"))."_H__")
	elseif &filetype == 'c'
		call append(line(".")+10,"#include <stdio.h>")
		call append(line(".")+11,"")
		call append(line(".")+12,"")
		call append(line(".")+13,"int main(int argc, char *argv[])")
		call append(line(".")+14,"{")
		call append(line(".")+15,"	")
		call append(line(".")+16,"	")
		call append(line(".")+17,"	return 0;")
		call append(line(".")+18,"}")
		call append(line(".")+19,"")

	elseif &filetype == 'cpp'
	  	call append(line(".")+10, "#include <cstdio>")
	  	call append(line(".")+11, "#include <iostream>")
		call append(line(".")+12,"")
		call append(line(".")+13,"")
	  	call append(line(".")+14, "using namespace std;")
		call append(line(".")+15,"")
		call append(line(".")+16,"")
 		call append(line(".")+17,"int main(int argc, char *argv[])")
		call append(line(".")+18,"{")
		call append(line(".")+19,"	")
		call append(line(".")+20,"	")
		call append(line(".")+21,"	return 0;")
		call append(line(".")+22,"}")
		call append(line(".")+23,"")
	endif
	endif
autocmd BufNewFile * normal G
endfunc 



