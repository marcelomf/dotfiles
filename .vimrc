" Vundle required

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Plugin 'supertab'
Plugin 'vim-ruby/vim-jade'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'tomtom/tcomment_vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-fuzzyfinder'
Plugin 'junegunn/fzf'
"Plugin 'conque'
Plugin 'Shougo/vimshell.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-javascript'
Plugin 'skammer/vim-css-color'
Plugin 'majutsushi/tagbar'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'tpope/vim-markdown'
Plugin 'vim-scripts/SyntaxRange'

call vundle#end() " required

filetype plugin indent on
syntax on
set fileformat=unix
au BufNewFile * set fileformat=unix
set number
" IGNORE VIM unsaved buffer warning when switching files/buffers
set hidden
set autoindent
set smartindent

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=indent,eol,start
set encoding=utf-8

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\ " buffer number
set statusline+=%f\ " filename
set statusline+=%h%m%r%w " status flags
if isdirectory(expand("~/.vim/bundle/vim-fugitive", ":p"))
  set statusline+=%{fugitive#statusline()} " git status
endif
if isdirectory(expand("~/.vim/bundle/syntastic", ":p"))
  set statusline+=%{SyntasticStatuslineFlag()} " syntastic status - makes sense with :Errors
endif
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%= " right align remainder
set statusline+=0x%-8B " character value
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P " file position

" Show line number, cursor position.
set ruler
" Display incomplete commands.
set showcmd
" Search as you type.
set incsearch
" Ignore case while searching
"set ignorecase
" Make /g flag default when doing :s
set gdefault
" Show autocomplete menus
set wildmenu
" Show editing mode
set showmode
" Ignore certain filetypes when doing filename completion
set wildignore=*.sw*,*.pyc,*.bak
" Show matching brackets
set showmatch
" Bracket blinking
set matchtime=2
" Split new window below current one
set splitbelow
" Error bells are displayed visually.
set visualbell
" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread
" Disable highlighting after search. Too distracting.
set nohlsearch
" To save, ctrl-s.
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a
" Reformatting options. See `:help fo-table`
set formatoptions+=lnor1
" Disable spellcheck by default
"set nospell
"autocmd BufRead,BufNewFile * setlocal nospell
set spell spelllang=pt
" To enable again, use:
" setlocal spell spelllang=en_us

" Assume Bash is my shell (:help sh.vim)
let g:is_bash = 1

" Default color scheme
"set background=dark
"colorscheme desert
"colorscheme molokai
"colorscheme Benokai
colorscheme monokai

autocmd FileType xml call TagExpander()
"autocmd FileType html call TagExpander()
autocmd FileType eruby call TagExpander()
autocmd FileType htmljinja call TagExpander()
autocmd FileType htmldjango call TagExpander()
" Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,config.ru} setlocal ft=ruby
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
" YAML
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2
" Web
autocmd FileType jade setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2
autocmd FileType css setlocal tabstop=2 shiftwidth=2
" Docker
autocmd BufRead,BufNewFile {Dockerfile.*} setlocal ft=dockerfile

" set the runtime path to include Vundle and initialize
nmap <c-o> :TagbarOpenAutoClose<CR>
" nmap <c-f> :FufCoverageFile<CR> vim-fuzzyfinder
nmap <c-e> :VimShell<CR>
nmap <c-f> :FZF<CR>
nmap <F2> :NERDTreeToggle<CR>
nmap <c-r> :undo<CR>
nmap <c-y> :redo<CR>
set tags=./tags;
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nmap <silent> <S-Left> :bprev<CR>
nmap <silent> <S-Right> :bnext<CR>
