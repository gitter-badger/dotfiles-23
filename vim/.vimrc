" ------ PLUGINS --------
" -----------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/path/to/jsx.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"style
Plugin 'sickill/vim-monokai'

"files
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" search
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'majutsushi/tagbar'

"syntax
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'yueyoum/vim-linemovement'
Plugin 'docunext/closetag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'stephpy/vim-yaml'

"helpers
Plugin 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'airblade/vim-gitgutter'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'jlanzarotta/bufexplorer'

"js & front end stack
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'

Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'wookiehangover/jshint.vim'
Plugin 'burnettk/vim-angular'

Plugin 'groenewege/vim-less'

" required
call vundle#end()
" required
filetype plugin indent on

" ------ SETTINGS --------
" -----------------------
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
set cursorline

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position

" save file when leaving a buffer
set autowrite

set ruler
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
set wildignore+=node_modules*
set wildignore+=bower_components*


set scrolloff=8 "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set guioptions-=r
set guioptions-=l
set listchars=tab:▸\ ,eol:¬

syntax on



" ------ PLUGIN SETTINGS  --------
" --------------------------------

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


" spell check
set spell spelllang=en_gb

" tern -->
let g:tern_map_keys=1

" code completion -->
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
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng:"]
let g:jsCommand='node'
let g:syntastic_javascript_checkers=['jshint']

let g:nerdtree_tabs_open_on_console_startup=1

let g:ctrlp_working_path_mode = 'c'

" highlights -->
hi clear SpellBad
hi SpellBad cterm=underline

hi SyntasticError   cterm=underline ctermfg=Red ctermbg=Red
hi SyntasticWarning cterm=underline ctermfg=Red ctermbg=Red

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

map <C-c>   <plug>NERDCommenterComment
map <C-S-c> <plug>NERDCommenterUncomment

noremap <C-l> :Autoformat<CR><CR>

nmap <leader>l :set list!<CR>


" Removes trailing spaces -->
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

map ^[OA <up>
map ^[OB <down>
map ^[OC <right>
map ^[OD <left>

map <ALT-right> :tabn
map <ALT-left> :tabp

" tabs -->
nnoremap <C-S-LEFT>   :tabprevious<CR>
nnoremap <C-S-RIGHT>  :tabnext<CR>
nnoremap <C-t>        :tabnew<CR>

inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

noremap <C-f> :Ag<SPACE>
noremap <C-b> :BufExplorer<CR>
noremap <C-t> :TagbarToggle<CR>

noremap <C-s> :UltiSnipsEdit<CR>

noremap <C-o> :copen 20<CR>

au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn

