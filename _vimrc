
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'powerline/powerline'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim' " fuzzy file finder and so much more

Plugin 'nicolalamacchia/powerline-consolas'

" TypeScript 
Plugin 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support

" C#
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'tpope/vim-dispatch'


" Plug 'clausreinke/typescript-tools.vim', { 'for': 'typescript' } " typescript tools
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Section General {{{

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" }}}




" Section User Interface {{{

syntax on                   " switch syntax highlighting on

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc
set termencoding=utf8
set term=xterm
set mouse=a
set ttymouse=xterm2
set t_Co=256                " Explicitly tell vim that the terminal supports 256 colors"
"colorscheme dracula         " Set the colorscheme
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" make the highlighting of tabs and other non-text less annoying
highlight NonText ctermbg=none ctermfg=239
highlight SpecialKey ctermbg=none ctermfg=239

set number                  " show line numbers
set relativenumber          " show relative line numbers

set wrap                    " turn on line wrapping
set wrapmargin=8            " wrap lines when coming within n characters from side
set linebreak               " set soft wrapping
set showbreak=…             " show ellipsis at breaking

set autoindent              " automatically set indent of new line
set smartindent

" toggle invisible characters
set list
set listchars=tab:→\ ,eol:¬,trail:·,extends:>,precedes:<,space:·

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" make backspace behave in a sane manner
set backspace=indent,eol,start

" Tab control
set noexpandtab             " insert tabs rather than spaces for <Tab>
set smarttab                " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4               " the visible width of tabs
set softtabstop=4           " edit as if the tabs are 4 characters wide
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

" code folding settings
set foldmethod=syntax       " fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set nofoldenable            " don't fold by default
set foldlevel=1

set clipboard=unnamed

"set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set cmdheight=1             " command bar height
"set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

set timeoutlen=1000 
set ttimeoutlen=0

set pastetoggle=<F2> 		"F2 before pasting to preserve indentation

" }}}


set splitbelow
set splitright


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>


" Section Mappings {{{

" set a map leader for more key combos
let mapleader = "\<Space>"

" remap esc
inoremap jk <esc>

" edit ~/_vimrc
map <leader>ev :e! ~/_vimrc<cr>

" clear highlighted search
" noremap <space> :set hlsearch! hlsearch?<cr>

" activate spell-checking alternatives
nmap ;s :set invspell spelllang=en<cr>

nmap <leader>l :set list!<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" search for word under the cursor
nnoremap <leader>/ "fyiw :/<c-r>f<cr>

" Navigate properly when lines are wrapped
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" }}}

" Section Plugins {{{

" airline options
let g:Powerline_symbols = 'fancy'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
:
" CtrlP options
let g:ctrlp_max_files=0
let g:ctrlp_clear_cache_on_exit = 0

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pdb,*.dll,*.mdf,*.png,*.gif   " Windows

let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pdb|mdf|pack|zip|png|gif)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" search the nearest ancestor that contains .git, .hg, .svn
"let g:ctrlp_working_path_mode = 2
 
nmap <silent> <leader>t :CtrlP<cr>
"nmap <silent> <leader>r :CtrlPBuffer<cr>
"let g:ctrlp_map='<leader>t'
"let g:ctrlp_dotfiles=1
"let g:ctrlp_working_path_mode = 'ra'
  
" NERD Tree mappings

nmap <silent> <leader>n :NERDTreeToggle<CR>
map <silent> <leader>nf :NERDTreeFind<cr>

"OmniSharp options

let g:OmniSharp_server_type = 'v1'
let g:OmniSharp_server_type = 'roslyn'

" }}}



"verbose map <A-h>

