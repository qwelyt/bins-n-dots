""" Basic {{{
syntax enable
set mouse=a
set modelines=1
" }}}

""" Spaced and tabs {{{
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
" }}}

""" UI config {{{
set number " Show line numbers
set showcmd " Show last command in lower right
set cursorline " Hilight current line
set ruler
filetype indent plugin on " load filetype-specifig indent files
set wildmenu " visual autocomplete for command menu
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw during macros (faster!)
set showmatch " highlight matching {[()]}
set pastetoggle=<F11>
" }}}

""" Searching {{{
set incsearch " search as characters are entered, live search
set hlsearch " highlight matches
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set ignorecase " Ignore case
set smartcase " except when using capital letters
" }}}

""" Folding {{{
set foldenable
set foldlevelstart=10 " Open most but not all folds
set foldnestmax=10 " Never fold deeper than 10 levels

" Open folds with space
noremap <space> za

" Open ALL folds with shift space
noremap <C-@> &foldlevel ? zM : zR

set foldmethod=marker " How to figure out where to fold
" }}}

""" Movement {{{
let mapleader="\\"

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>
let g:gundo_prefer_python3 = 1

" Toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
" }}}

""" Backups {{{
set backup
set writebackup
" }}}

""" Functions {{{
" toggle between number and relativenumber
function! ToggleNumber()
	if(&relativenumber == 1)
		set norelativenumber
		set number
	else
		set relativenumber
	endif
endfunc

" Strip trailing whitespace in own buffer
function! StripTrailingWhitespace()
        " save last search & cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @\=_s
        call cursor(l,c)
endfunction
" }}}

""" vim-airline {{{
let g:airline_powerline_fonts = 1
"}}}

""" vim-plug {{{
call plug#begin()

Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'

call plug#end()
" }}}

" vim:foldmethod=marker:foldlevel=0
