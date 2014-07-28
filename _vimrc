"------------------------------
" Name: vimrc by kily
" Date: 2010.9.29
" Mail: keeliizhou@gmail.com
"------------------------------

" -----  平台判断
function! MySys()
    if has("win32")
        return "windows"
    else
        return "linux"
    endif
endfunction

" ---------- Vundle ----------
set nocompatible
filetype off

if MySys() == "windows"
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/vundle/')
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'mattn/emmet-vim'
" Bundle 'tsaleh/vim-matchit'
Bundle 'msanders/snipmate.vim'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'jiangmiao/auto-pairs'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'
" Bundle 'mattn/calendar-vim'
Bundle 'pangloss/vim-javascript'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mklabs/grunt.vim'
Bundle 'Shougo/neocomplete.vim'
" Bundle 'marijnh/tern_for_vim'
Bundle 'plasticboy/vim-markdown'

" fixed conflict width neocomplete
Bundle 'kris89/vim-multiple-cursors'
" ----- https://github.com/vim-scripts -----
Bundle 'jsbeautify'
" Bundle 'velocity.vim'
Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'AutoComplPop'
" Bundle 'TabBar'
" Bundle 'minibufexplorerpp'
" ---------- Vundle ----------


if MySys() == "windows"
    " -----  应用英文菜单界面
    set langmenu=en_US
    let $LANG = 'en_US'
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "不显示工具栏
    set guioptions-=T
    set guioptions-=m
    " 窗口大小
    set lines=35 columns=148

    " Vim 的默认寄存器和系统剪贴板共享
    set clipboard+=unnamed
    " 设置 alt 键不映射到菜单栏
    set winaltkeys=no
    "设置字体、字号
    set guifont=Source_Code_Pro:h12
endif

" 设置帮助文档语言
set helplang=cn

"终端下也可以使用鼠标
set mouse=a

"更多主题：http://code.google.com/p/vimcolorschemetest/
colorscheme solarized
" colorscheme Tomorrow-Night
 set background=dark

"显示行号
set number
" set relativenumber

"当前行高亮
set cursorline

"不使用备份
set nobackup

"不使用swp文件：错误退出后无法恢复
set noswapfile

"自动缩进
set autoindent
set smartindent

"设置恢复步数
set history=200

"设置Tab缩进空格数
set shiftwidth=4

"Tab宽度为多少个空格
set tabstop=4
set expandtab
set softtabstop=4

"设置折叠
"set foldcolum=4

"设置折叠方式
set foldmethod=indent

"设置折叠级别：比如第3层缩进后的内容折叠
set foldlevel=0

"文件类型插件
filetype indent plugin on

"设置最多使用的标签页数
set tabpagemax=15

"设置自动切换目录为当前文件所在目录
set autochdir

"设置窗口透明度:需要在macvim-preference-Advanced:Use experimental render项目上钩选
"set transparency=5

"高亮搜索结果
set hlsearch

"设置始终显示标签页
"set showtabline=2

"下面那个状态条条
"set laststatus=2

"光标在行末按下方向右键时移动到下一行
set whichwrap=b,s,<,>,[,]

"设置文件编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,latin-1

"将连字符'-'设置成关键字，双击'img-slide'即选中
"set iskeyword+=-

" 自动语法高亮
syntax on

"不使用 Unicode 签名
set nobomb
set laststatus=2
set backspace=indent,eol,start whichwrap+=<,>,[,]
set list
set listchars=tab:▶\ ,eol:¬
" set nolist
"Invisible character colors
highlight NonText guifg=#003f4f
highlight SpecialKey guifg=#003f4f

" ----- key mapping -----
" 设置 leader key 为「,」
let mapleader=","

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>

" 移动分割窗口
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 插入模式移动光标 alt + 方向键
noremap! <M-j> <Down>
noremap! <M-k> <Up>
noremap! <M-h> <left>
noremap! <M-l> <Right>

" diff 快捷键
" 1. Ctrl-w K（把当前窗口移到最上边）
" 2. Ctrl-w H（把当前窗口移到最左边）
" 3. Ctrl-w J（把当前窗口移到最下边）
" 4. Ctrl-w L（把当前窗口移到最右边）
" 下一个差异点 ]c
" 下一个差异点 [c
" dp (diff 'put')
" do (diff 'get')
nmap <C-Down> ]c
nmap <C-Up> [c
nmap <F8> dp

if MySys() == "windows"
    imap <C-v> "+gP
    vmap <C-c> "+y
    " backspace in Visual mode deletes selection
    vnoremap <BS> d

    " CTRL-C and CTRL-Insert are Copy
    vnoremap <C-C> "+y
    vnoremap <C-Insert> "+y

    " CTRL-V and SHIFT-Insert are Paste
    imap <C-V>		"+gP
    map <S-Insert>		"+gP

    cmap <C-V>		<C-R>+
    cmap <S-Insert>		<C-R>+

    exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
    exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

    " 打开当前目录 windows
    map <leader>ex :!start explorer %:p:h<cr>

    " 打开当前目录CMD
    map <leader>cmd :!start<cr>
    " 打印当前时间
    map <F3> a<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>

    " 快捷键「,s」更新 vimrc 文件；「,e」打开 vimrc 文件
    nmap <leader>s :source $VIM/_vimrc<cr>
    nmap <leader>e :e $VIM/_vimrc<cr>
    let NERDTreeBookmarksFile = $VIM . '/NERDTreeBookmarks'

    " 复制当前文件/路径到剪贴板
    nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
    nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
    " This will copy the path in 8.3 short format, for DOS and Windows 9x
    nmap ,c8 :let @*=substitute(expand("%:p:8"), "/", "\\", "g")<CR>
else
    " 快捷键「,s」更新 vimrc 文件；「,e」打开 vimrc 文件
    nmap <leader>s :source ~/.vimrc<cr>
    nmap <leader>e :e ~/.vimrc<cr>

    " 复制当前文件/路径到剪贴板
    nmap ,fn :let @*=expand("%")<CR>
    nmap ,fp :let @*=expand("%:p")<CR>
endif

" ----- Plugin settings -----
let g:Powerline_dividers_override = [' >>', '>', '<< ', '<']
let g:Powerline_mode_n = 'N'
let g:Powerline_mode_i = 'I'
let g:Powerline_mode_v = 'V'

" - NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeDirArrows = 1
let NERDTreeShowBookmarks = 1
let NERDTreeIgnore=['build', 'build-html', 'node_modules']
let NERDTreeAutoDeleteBuffer=1
nmap <leader>n :NERDTreeToggle D:\Root <cr>

" NERDComment
map <leader>ci :<cr>

" tabular
" let g:tabular_loaded = 1
map <leader>= :Tab /=<cr>

" Calendar
let g:calendar_focus_today = 1
let g:calendar_wruler = '日 一 二 三 四 五 六'
let g:calendar_navi_label = '前页,今天,后页'
let g:calendar_mruler = '一月,二月,三月,四月,五月,六月,七月,八月,九月,十月,十一月,十二月'

" JsBeautify
map <leader>ff :call JsBeautify()<cr>

" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_javascript_checkers = ['jslint']

" emmet
let g:user_emmet_leader_key = '<c-y>'

let g:user_emmet_settings = {
\  'indentation' : '    '
\}
autocmd FileType html,css EmmetInstall

" Multiple-cursor

" FuzzyFinder
nnoremap <C-p> :FufFile<CR>

" snipmate
" ReloadAllSnippets
nmap <leader>snip :call ReloadAllSnippets()<CR>

" Neo
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#enable_auto_select = 1
" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
    "\ 'default' : '',
    "\ 'vimshell' : $HOME.'/.vimshell_hist',
    "\ 'scheme' : $HOME.'/.gosh_completions'
        "\ }

" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
    "let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  "" For no inserting <CR> key.
  ""return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplete#close_popup()
"inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
  "let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" ----- Functions or autocmd -----
" 默认加载折叠
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" au! BufRead,BufNewFile *.vm  setfiletype velocity

function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction
