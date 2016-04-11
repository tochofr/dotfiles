" ************* VIM CONFIG FILE *************
set nocompatible


" ############# BUNDLE SECTION ############# 
filetype off 
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'    " let Vundle manage Vundle, required
" ----- Start plugin install
Plugin 'scrooloose/nerdtree.git' " NERDTree
Plugin 'flazz/vim-colorschemes'  " Colorschemes for vim
Plugin 'SirVer/ultisnips'        " Ultinsips plugin
Plugin 'honza/vim-snippets'      " Snippets (used by Ultisnips)
Plugin 'Lokaltog/vim-powerline'      " Snippets (used by Ultisnips)
Plugin 'puppetlabs/puppet-syntax-vim'      " Snippets (used by Ultisnips)
Plugin 'zainin/vim-mikrotik'      
" ----- End plugin install
call vundle#end()            
filetype plugin indent on    
" ############# END BUNDLE SECTION #############

" ############# BASIC SETTINGS ############# 
set number
set ruler
set nowrap
set background=dark
set t_Co=256 "Move pending
set encoding=utf-8
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
syntax on
set autoindent
set showcmd		
set nobackup
set laststatus=2

"Hightlight current cursor line
set cul
hi CursorLine term=none cterm=none ctermbg=8

" Highlight brackets
set showmatch		

" Ignore case in searchs
set ignorecase		
set smartcase		

" Muestra resultados de la búsqueda según se escribe
set incsearch		

" Resalta todas las coincidencias de las búsquedas
set hlsearch 
"
set autowrite		
set hidden	

" Hightlight column 80
set colorcolumn=80

" Use space instead tabs
set expandtab
set smarttab

" Tab as 4 spaces
set shiftwidth=4
set softtabstop=4

" Activa la barra inferior
set wildmenu
set wildmode=list:longest,full

" No sounds
set noerrorbells
set visualbell
set t_vb=

" File formats
set fileformats=unix,dos,mac
set ff=unix

" No swap file
set noswapfile

" Pulsando jj sale del modo edición
inoremap jj <ESC>
nnoremap JJJJ <Nop>

" Corrección de <typos> al teclear
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Mapeo de teclas (buffer adelante/atrás)
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>

" Tuneo de la barra inferior
if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

if has("gui_running")
    "En caso de estar ejecutando un vim grafico
    if has("gui_macvim")
        "set guifont=Source\ Code\ Pro:h15
        set guifont=Source\ Code\ Pro\ for\ Powerline:h15
    endif
endif
colorscheme Tomorrow-Night-Bright

" ULTISNIPS SETTINGS 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

