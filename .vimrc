"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows环境编码设置   解决中文乱码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
    let &termencoding=&encoding
    set fileencodings=utf-8,gbk,ucs-bom,cp936
    set encoding=utf-8
else
    set fileencoding=utf-8
    set encoding=utf-8
endif
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle插件管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"source $VIM/bundles.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 自动补全
Plugin 'Shougo/neocomplete.vim'
" 代码片段补全
Plugin 'vim-scripts/UltiSnips'
" 代码补全模板
Plugin 'honza/vim-snippets'
" python语法检查
Plugin 'vim-scripts/pyflakes.vim'
" 文件定位
Plugin 'vim-scripts/ctrlp.vim'
" 缩进虚线
Plugin 'vim-scripts/indentLine.vim'
" 对象标签栏
Plugin 'vim-scripts/Tagbar'
" 对象标签支持
Plugin 'vim-scripts/ctags.vim'
" vimwiki
Plugin 'vim-scripts/vimwiki'
" 快速注释
Plugin 'vim-scripts/The-NERD-Commenter'
" 简单对齐
Plugin 'vim-scripts/vim-easy-align'
" 符号补全
Plugin 'vim-scripts/surround.vim'
" 状态栏增强
Plugin 'vim-scripts/vim-airline'
" molokai配色
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/Solarized'
" 文件树
Plugin 'vim-scripts/The-NERD-tree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 一般设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible

" history文件中需要记录的行数
set history=100

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 与windows共享剪贴板
set clipboard+=unnamed

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 保存全局变量
set viminfo+=!

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 打开色彩
syntax enable

" 语法高亮
syntax on

" 高亮字符，让其不受100列限制
:highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
:match OverLength '\%101v.*'

" 状态行颜色
highlight StatusLine guifg=Black guibg=Yellow
highlight StatusLineNC guifg=Black guibg=White

" 在状态行上显示光标所在位置的行号和列号
set ruler
"set rulerformat=%50(%2*%<%f%=\ %m%r\ ASCII:%03.3b\ HEX:0x%02.2B\ %3l\,%c%V\ %L\ %P%)
set rulerformat=%50(%2*%<%f%=\ %m%r\ %{&ff}\ %{(&fenc\ ==\ \"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}\ %Y\ ASCII:%03.3b\ HEX:0x%02.2B\ %3l\,%c%V\ %L\ %P%)

" 显示行号
set number

" 设置帮助文件为中文，前提是已经装过了中文帮助文件
set helplang=cn

" 配色方案
colorscheme molokai
"colorscheme solarized
"set background=light

" 所在行高亮
set cursorline

" 所在列高亮
"set cursorcolumn

" 选择文本时光标所在文字也被选中
set selection=inclusive

" 窗口启动自动最大化(仅适用于Win32系统)
"autocmd GUIEnter * simalt ~x

" 隐藏菜单栏
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 不要备份文件（根据自己需要取舍）
set nobackup

" 不要生成swap文件，当buffer被丢弃的时候隐藏它
setlocal noswapfile
set bufhidden=hide

" 字符间插入的像素行数目
set linespace=0

" 增强模式中的命令行自动完成操作
set wildmenu

" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2

" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l

" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key

" 启动的时候不显示那个援助索马里儿童的提示
"set shortmess=atI

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

" 不让vim发出讨厌的滴滴声
set noerrorbells

" 在被分割的窗口间显示空白，便于阅读
"set fillchars=vert:\ ,stl:\ ,stlnc:\

" 粘贴后自动取消插入模式（我们每次粘贴后一般都需要esc退出模式）
ino <C-v> <esc>:set paste<cr>mua<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示匹配的括号
set showmatch

" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 在搜索的时候忽略大小写
set ignorecase

" 搜索结果及时匹配并高亮显示
set hlsearch is

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 输入:set list命令是应该显示些啥？
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 不要闪烁
set novisualbell

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 文本格式和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动格式化
set formatoptions=tcrqn

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 为C程序提供自动缩进
set smartindent

" 使用C样式的缩进
set cindent
"set cindent shiftwidth=4

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 不要用空格代替制表符
set noexpandtab

" 不自动折行
"set nowrap

" 在行和段开始处使用制表符
set smarttab

" 设置tab缩进4格
set sts=4
set expandtab tabstop=4 shiftwidth=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTags的设定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按照名称排序
let Tlist_Sort_Type = "name"

" 在右侧显示窗口
let Tlist_Use_Right_Window = 1

" 压缩方式
let Tlist_Compart_Format = 1

" 如果只有一个buffer，kill窗口也kill掉buffer
let Tlist_Exist_OnlyWindow = 1

" 不要关闭其他文件的tags
let Tlist_File_Fold_Auto_Close = 0

" 不要显示折叠树
let Tlist_Enable_Fold_Column = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./这两个字符

" C的编译和运行
"map <F5> :call CompileRunGcc()<CR>
"func! CompileRunGcc()
"exec "w"
"exec "!gcc % -o %<"
"exec "! ./%<"
"endfunc

" C++的编译和运行
"map <F6> :call CompileRunGpp()<CR>
"func! CompileRunGpp()
"exec "w"
"exec "!g++ -Wall % -o %<"
"exec "! ./%<"
"endfunc

" python的编译和运行
map <F5> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!python2 %"
endfunc

" 能够漂亮地显示.NFO文件
function! SetFileEncodings(encodings)
    let b:myfileencodingsbak=&fileencodings
    let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
    let &fileencodings=b:myfileencodingsbak
    unlet b:myfileencodingsbak
endfunction

au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

" 用空格键来开关折叠
set foldenable
set foldmethod=manual
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 自动完成括号
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap ' ''<ESC>i
:inoremap " ""<ESC>i

function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endf

" tab自动区分补全和缩进 
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

"通过WinManager插件来将TagList窗口和netrw窗口整合起来
"let g:winManagerWindowLayout='FileExplorer|TagList'
"nmap wm :WMToggle<cr>
"map <F8> :WMToggle<cr>

"设置Taglist
let Tlist_Show_One_File=1   "taglist插件只显示当前文件的tag
let Tlist_Exit_OnlyWindow=1 "退出vim时候退出taglist

"设置tags文件路径
"set tags=./tags

"Calendar插件 日记存储路径
let g:calendar_diary = "~/diary"

"设置VimIM中文输入法 禁用中文标点
let g:vimim_chinese_punctuation = -1

" NERDTree
map <F8> :NERDTreeToggle<cr>
imap <F8> <ESC>:NERDTreeToggle<cr>

" vimwiki
let g:vimwiki_list = [{'path': '$HOME/vimwiki/',
      \ 'path_html': '$HOME/Documents/vimwiki/vimwiki_html',
      \ 'template_path': '$HOME/vimwiki/templates/',
      \ 'template_default': 'def_template',
      \ 'template_ext': '.html',
      \ 'syntax': 'markdown',
      \ 'ext': '.md'}]
"let g:vimwiki_ext2syntax = {'.md': 'markdown',
              "\ '.mkd': 'markdown',
              "\ '.wiki': 'markdown'}
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
" 是否开启按语法折叠  会让文件比较慢
let g:vimwiki_folding = 0
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
map <S-F9> :VimwikiAll2HTML<cr>
map <F9> :Vimwiki2HTML<cr> 

"airline状态栏设置
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" UltiSnips设置
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"
"" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim-easy-align简单对齐设置
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" neocomplete设置
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置字体
if has("win32")
    set guifont=Monaco:h10:w6:b,\ Consolas:h10.5:w6:b
else
    set guifont=Monaco\ Bold\ 10.5
endif

" 2=始终显示状态栏
set laststatus=2   " Always show the statusline

"let g:molokai_original = 1
"let g:rehash256 = 1

"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
    let s:input_status = system("fcitx-remote")
    if s:input_status == 2
        let g:input_toggle = 1
        let l:a = system("fcitx-remote -c")
    endif
endfunction

function! Fcitx2zh()
    let s:input_status = system("fcitx-remote")
    if s:input_status != 2 && g:input_toggle == 1
        let l:a = system("fcitx-remote -o")
        let g:input_toggle = 0
    endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
