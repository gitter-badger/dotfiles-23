set nocompatible
filetype off

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set visualbell
set autoread
set clipboard=unnamed
set hidden
set autoread

set noswapfile
set nobackup
set nowb

if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set nowrap 
set linebreak 

set omnifunc=syntaxcomplete#Complete

set wildmode=list:longest
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

set guioptions-=r 
set guioptions-=l

set listchars=tab:▸\ ,eol:¬

syntax on

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/path/to/jsx.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'sickill/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'
Plugin 'SirVer/ultisnips'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Chiel92/vim-autoformat'
Plugin 'airblade/vim-gitgutter'
Plugin 'docunext/closetag.vim'
Plugin 'yueyoum/vim-linemovement'
Plugin 'jordwalke/JSXVimHint'

call vundle#end()            " required
filetype plugin indent on    " required

" tmux --->
if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" colors -->
syntax enable
set background=dark
colorscheme monokai

" nerdtree -->
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" code completion
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" lint -->
let g:syntastic_check_on_open=1

" snips -->

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:jsCommand='node'
let g:syntastic_javascript_checkers=['jsxhint']

" maps -->
nnoremap ; :
nnoremap \ ,


map <C-right> $
map <C-left> ^
map <C-up> gg
map <C-down> GG

map <I> NERDTreeShowHidden=1

let g:linemovement_up="<C-S-Up>"
let g:linemovement_down="<C-S-Down>"

map <C-c> <plug>NERDCommenterComment
map <C-f> <plug>NERDCommenterUncomment

noremap <C-l> :Autoformat<CR><CR>

nmap <leader>l :set list!<CR>
