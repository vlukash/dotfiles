call plug#begin('~/.vim/plugged')


" Make sure you use single quotes

" let Vundle manage Vundle, required
Plug 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" colorschemes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'jlanzarotta/bufexplorer'

Plug 'tmhedberg/SimpylFold'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'

Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

Plug 'sjl/gundo.vim'

Plug 'mileszs/ack.vim'

Plug 'majutsushi/tagbar'

Plug 'kshenoy/vim-signature'

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'airblade/vim-gitgutter'

Plug 'nicolalamacchia/powerline-consolas'

" TypeScript 
Plug 'Shougo/vimproc'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' } " typescript support
Plug 'Quramy/tsuquyomi'

" C#
" Plug 'OmniSharp/omnisharp-vim'
Plug 'tpope/vim-dispatch'

" F#
" Plug 'fsharp/vim-fsharp', {'for': 'fsharp'}
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}
" Python
" Plug 'python-mode/python-mode'

" Snippets
Plug 'honza/vim-snippets'

" Games
Plug 'johngrib/vim-game-code-break'

" Add plugins to &runtimepath
call plug#end()


filetype plugin indent on    " required


" Section General {{{

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" }}}

" Section User Interface {{{
"
if &term =~ "xterm\\|rxvt"
  " use an orange cursor in insert mode
  let &t_SI = "\<Esc>]12;white\x7"
  " use a red cursor otherwise
  let &t_EI = "\<Esc>]12;white\x7"
  silent !echo -ne "\033]12;white\007"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
  " use \003]12;gray\007 for gnome-terminal
endif

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" enable 24 bit color support if supported
if (has('mac') && empty($TMUX) && has("termguicolors"))
    set termguicolors
endif

let g:onedark_termcolors=256
let g:onedark_terminal_italics=1


syntax on                   " switch syntax highlighting on
colorscheme onedark         " Set the colorscheme
set t_Co=
syntax enable
set background=dark

" make the highlighting of tabs and other non-text less annoying
highlight NonText ctermbg=none ctermfg=238
highlight SpecialKey ctermbg=none ctermfg=238
" hi SignColumn ctermbg=0
" make comments and HTML attributes italic
highlight Comment cterm=italic
" highlight htmlArg cterm=italic
" highlight xmlAttrib cterm=italic
" highlight Type cterm=italic
" highlight Normal ctermbg=none

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
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:·

" set listchars=tab:→\ ,eol:¬,trail:·,extends:>,precedes:<,space:·

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
set foldmethod=indent		" fold based on indent
set foldnestmax=10          " deepest fold is 10 levels
set foldlevelstart=10		" open most folds by default
"set nofoldenable            " don't fold by default
set foldlevel=1

" set clipboard=unnamed
set clipboard=unnamedplus,unnamed

set ttyfast                 " faster redrawing
set diffopt+=vertical
set laststatus=2            " show the satus line all the time
set so=7                    " set 7 lines to the cursors - when moving vertical
set wildmenu                " enhanced command line completion
set hidden                  " current buffer can be put into background
set showcmd                 " show incomplete commands
set noshowmode              " don't show which mode disabled for PowerLine
set wildmode=list:longest   " complete files like a shell
set scrolloff=3             " lines of text around cursor
set shell=$SHELL
set cmdheight=1             " command bar height
set title                   " set terminal title

" Searching
set ignorecase              " case insensitive searching
set smartcase               " case-sensitive if expresson contains a capital letter
set hlsearch                " highlight search results
set incsearch               " set incremental search, like modern browsers
set nolazyredraw            " don't redraw while executing macros

set magic                   " Set magic on, for regex

set showmatch               " show matching braces
set mat=2                   " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

if has('mouse')
	set mouse=a
endif

set pastetoggle=<F2> 		"F2 before pasting to preserve indentation

" move by words
set iskeyword=65-90,95,97-122,48-57 "the same: a-z,_,A-Z,0-9

" buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

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

" change the word with 0 reg
nmap <c-;> ciw<c-r>0jk

" add line and stay in normal mode
nmap <S-CR> O<Esc>j
nmap <CR> o<Esc>k

" edit ~/.vimrc
map <leader>ev :e! ~/.vimrc<cr>
map <leader>er :so ~/.vimrc<cr>

" clear highlighted search
noremap <leader>h :set hlsearch! hlsearch?<cr>

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
nnoremap <silent> <C-Right> :vertical resize +5<cr>
nnoremap <silent> <C-Left> :vertical resize -5<cr>
nnoremap <silent> <C-Up> :resize +5<cr>
nnoremap <silent> <C-Down> :resize -5<cr>

" }}}

" Section Plugins {{{

" airline options
"let g:Powerline_symbols = 'fancy'
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamecollapse = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#show_tabs = 0
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

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
nmap <silent> <leader>b :CtrlPBuffer<cr>
"let g:ctrlp_map='<leader>t'
"let g:ctrlp_dotfiles=1
"let g:ctrlp_working_path_mode = 'ra'
  
" NERD Tree mappings

nmap <silent> <leader>n :NERDTreeToggle<CR>
map <silent> <leader>nf :NERDTreeFind<cr>

" OmniSharp options

" let g:OmniSharp_server_type = 'v1'
" let g:OmniSharp_server_type = 'roslyn'

" OmniSharp won't work without this setting
filetype plugin on

"This is the default value, setting it isn't actually necessary
let g:OmniSharp_host = "http://localhost:2000"

"Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1

"Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 1

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings - uncomment the next 4 lines
"let g:SuperTabDefaultCompletionType = 'context'
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
"let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono)
" By default, only Type/Method signatures are fetched. Full documentation can still be fetched when
" you need it with the :OmniSharpDocumentation command.
" let g:omnicomplete_fetch_documentation=1

"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
"let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']
" If you are using the omnisharp-roslyn backend, use the following
let g:syntastic_cs_checkers = ['code_checker']
augroup omnisharp_commands
    autocmd!

    "Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Synchronous build (blocks Vim)
    "autocmd FileType cs nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
    " automatic syntax check on events (TextChanged requires Vim 7.4)
    "autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Automatically add new cs files to the nearest project on save
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    "show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    "The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    "finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    autocmd FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    "navigate up by method/property/field
    "autocmd FileType cs nnoremap <leader>k :OmniSharpNavigateUp<cr>
    "navigate down by method/property/field
    "autocmd FileType cs nnoremap <leader>j :OmniSharpNavigateDown<cr>	

augroup END

" this setting controls how long to wait (in ms) before fetching type / symbol information.
set updatetime=500
" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>

" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" Enable snippet completion, requires completeopt-=preview
let g:OmniSharp_want_snippet=1


" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

"let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['*.cs'],'passive_filetypes': [] }
"nnoremap <C-w>e :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>

"navigate down to the next error
autocmd FileType cs nnoremap <leader>e :SyntasticNext<cr>
"autocmd FileType cs nnoremap <leader> :SyntasticPrev<cr>


"Ctags settings
"nnoremap <leader>. :CtrlPTag<cr>

" bufftab
hi link BufTabLineFill Normal

" vim-commentary settings
autocmd FileType c,cpp,cs,java,js,ts setlocal commentstring=//\ %s

" Easymotion settings
 let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
" map <Leader>b <Plug>(easymotion-b)
map <Leader>f <Plug>(easymotion-f)

" gundo settings
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" ACK settings
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Ctags
"!ctags {.,**}/*.{cs,ts,tsx}
"ctags −−languages=c#,typescript,tsx .

" Tagbar
nnoremap <silent> <Leader>. :TagbarToggle<CR>

" tsuquyomi
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" }}}

" vim:foldmethod=marker:foldlevel=0
