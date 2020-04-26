set nocompatible             " 关闭兼容模式

"--------------------------general setting------------------------------------
"
colorscheme desert       "desert elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

set background=dark

set t_Co=8                   "设置颜色显示

set t_Sf=^[[3%p1%dm
set t_Sb=^[[4%p1%dm
set ignorecase               " 搜索模式里忽略大小写
"set smartcase               " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
set autowrite                " 自动把内容写回文件: 如果文件被修改过，在每个
                             " :next :rewind :last :first :previous :stop :suspend :tag :!、:make、CTRL-] 和
                             " CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-"9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
set smarttab
set expandtab                " 将Tab自动转化成空格 [需要输入真正的Tab键时，使用Ctrl+V Tab]
set tabstop=4                " 设置制表符(tab键)的宽度
set softtabstop=4            " 设置软制表符的宽度
set shiftwidth=4             " (自动) 缩进使用的4个空格
set cindent                  " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
set showmatch                " 设置匹配模式，显示匹配的括号
set linebreak                " 整词换行
set whichwrap=b,s,<,>,[,]    " 光标从行首和行末时可以跳到另一行去
"set previewwindow           " 标识预览窗口
set history=50               " set command history to 50    "历史记录50条
set cursorline
set laststatus=2             " 开启状态栏信息
set ruler                    " 右下角显示光标位置的状态行
set statusline=%-10.3n       "buffer number，与ruler不可同时显示
set backspace=2              " 设置退格键可用
set autoindent               " 自动对齐，每行的缩进值与上一行相等；使用 noautoindent 取消设置
set ai!                      " 设置自动缩进
set smartindent              " 智能自动缩进
"set relativenumber          " 开启相对行号
set nu!                      " 显示行号
"set mouse=a                 " 启用鼠标
set incsearch                " 开启实时搜索功能
set hlsearch                 " 开启高亮显示结果
set hls                      " 开启高亮显示
"set nowrapscan               " 搜索到文件两端时不重新搜索
"set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set foldmethod=indent        " 选择代码折叠类型
set foldlevel=100            " 禁止自动折叠
set cmdheight=2              " 命令行的高度，默认为1，这里设为2
set autoread                 " 当文件在外部被修改时自动更新该文件
set nobackup                 " 不生成备份文件
set noswapfile               " 不生成交换文件
"set list
"set listchars=trail:.
"set listchars=tab:\~\ ,trail:. " 显示特殊字符，其中Tab使用高亮~代替，尾部空白使用高亮点号代替
set showmatch                " 显示括号配对情况
"set nowrap                  " 设置不自动换行
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
filetype on
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
filetype plugin on           " 针对不同的文件类型加载对应的插件
filetype plugin indent on    " 启用自动补全
set showcmd                  " 命令行显示输入的命令
set showmode                 " 命令行显示vim当前模式
"highlight SpecialKey ctermbg=Red guibg=Red

"--------------------------file-encodings-------------------------------------
set encoding=utf-8
"set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
"set fileencodings=utf-8,chinese
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1


" -------------------------- Plugins -------------------------------
"
" WinManager related
let g:winManagerWindowLayout = "FileExplorer"
map <C-W><C-F> :FirstExplorerWindow<CR>
map <C-W><C-B> :BottomExplorerWindow<CR>

" gdbvim related
set noshowcmd

" Tlist
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1

"showmarks related
let showmarks_enable=1
" Show which marks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" Hilight lower & upper marks
"let showmarks_hlline_lower = 1
"let showmarks_hlline_upper = 1

" ------------------------- Modes ------------------------------
"
function EnglishMode()
    set imactivatekey=
    set noimcmdline
    set iminsert=0
    set imsearch=0
    setlocal spell
endfunction
command -nargs=0 EnglishMode call EnglishMode()

function ChineseMode()
    set imactivatekey=C-space
    set noimcmdline
    set iminsert=2
    set imsearch=2
    setlocal nospell
endfunction
command -nargs=0 ChineseMode call ChineseMode()

function CodeMode()
    setlocal cin
    setlocal sm
    setlocal ai
    setlocal tw=78
    setlocal nospell
endfunction
command -nargs=0 CodeMode call CodeMode()

function CodeLayout()
    call CodeMode()
    Tlist
    WManager
endfunction
command -nargs=0 CodeLayout call CodeLayout()

function CodeLayoutClose()
    call CodeMode()
    TlistClose
    WMClose
endfunction
command -nargs=0 CodeLayoutClose call CodeLayoutClose()

" ======================= set short-key ==========================
"tag list
map tl :TlistToggle<CR>

"switch .h .cxx
nnoremap ,a :A<CR>
"edit included files
nnoremap ,h :IH<CR>
"show file info
nnoremap ,f :file<CR>
"edit the input file
nnoremap ,e :e
"show files buf list
nmap ,l :ls<CR>
nmap ,lp :bp<CR>
nmap ,ln :bn<CR>
"edit specified buffer content
"like :bn :bp :b1
nnoremap ,b :b



"jump to target buffer
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

"set the key wm for WMToggle
nmap wm :WMToggle<CR>

"--------------setting for diff---------------------
if &diff
    colors evening
    map ,k [c
    map ,j ]c
    map ,g do
    map ,p dp
endif
"----------------------- 设置 vimdiff  vimmerge do dp 快捷键-----------------
map <silent> ,1 :diffget 1<CR> :diffupdate<CR>
map <silent> ,2 :diffget 2<CR> :diffupdate<CR>
map <silent> ,3 :diffget 3<CR> :diffupdate<CR>
map <silent> ,4 :diffget 4<CR> :diffupdate<CR>


"----------------------- 设置 code format 快捷键-----------------
map <C-m> :pyf ~/dev_tools/clang-format.py<cr>
imap <C-K> <c-o>:pyf ~/dev_tools/clang-format.py<cr>

map ,b :%!xxd<CR>
map ,t :%!xxd -r<CR>

set noro
