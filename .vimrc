
set vb
filetype on
filetype plugin on

if exists('g:vscode')
    " VSCode neovim extension

else
    " ordinary neovim
    syntax enable
    filetype indent on
    set hls

    " set modeline
    " set modelines=20
    set statusline=%F%m%r%h\ %=\ [L%l\ C%v][%p%%]
    set laststatus=2

    " syntax folding
    set foldmethod=syntax

    " basic defaults
    set expandtab
    set shiftwidth=4
    set softtabstop=4

    set ai
    set tw=80

    " shortcut moving up/down quickfix items
    map <C-j> :cn<CR>
    map <C-k> :cp<CR>

    colorscheme desert256
endif

" ============================
" vim-plug: 	see .vim/autoload/plug.vim
"
call plug#begin('~/.vim/plugged')

" Doesn't support neovim
"Plug 'yegappan/grep'

" Figlet please
Plug 'fadein/vim-FIGlet'

if exists('g:vscode')
    " VSCode neovim extension

else
    " ordinary neovim

    Plug 'dr-kino/cscope-maps'

    " on: lazy loaded
    Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

    " like fugitive, but for mercurial
    " Plug 'jlfwong/vim-mercenary'
    Plug 'tpope/vim-fugitive'

    " official rust vim plugin
    Plug 'rust-lang/rust.vim'

    " Tagbar is nice-to-have for ctags navigation
    Plug 'preservim/tagbar'

    " (Optional) Multi-entry selection UI.
    Plug 'junegunn/fzf'

    " Type \be to open list of buffers, sorted by MRU
    Plug 'jlanzarotta/bufexplorer'

    " Suggestions from coworkers, good for pairing
    Plug 'shrinidhisondur/qtest.vim'
    Plug 'vim-scripts/a.vim'

    " Plug 'neoclide/coc.nvim'
    Plug 'vim-scripts/AnsiEsc.vim'

    " Dream: use rust-analyzer. See :
    " https://rust-analyzer.github.io/manual.html#non-cargo-based-projects

    " Nope: needs cargo. Async Lint Engine
    " Plug 'dense-analysis/ale'

    " requires cargo, which doesn't play nice with other build systems
    "  :'-(
    " Plug 'autozimu/LanguageClient-neovim', {
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
endif

" Initialize plugin system
call plug#end()
" ============================

" ---------- Plugin config and shortcuts ----------

if exists('g:vscode')
    " VSCode neovim extension

else
    " plain neovim
    " open/close tagbar
    nmap :tt<CR> :Tagbar<CR>

    " Required for operations modifying multiple buffers like rename.
    set hidden

    let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'python': ['/usr/local/bin/pyls'],
        \ }


    " Custom startup macros
    " command! PwdStartup :so ~/.vim/pwd-startup.vim

    " Enable cindent with my prefs -AF
    function! Af_set_cindent()
            " echo Setting af cindent options
            redraw
            set cindent
            set cino=(1s
    endfunction

    au BufNewFile,BufRead *.gradle setf groovy

    if !exists("s:autocommands_loaded")
            let s:autocommands_loaded = 1
            au BufReadPre,FileReadPre	*.[ch] call Af_set_cindent()
    endif

    set path+=./**
    " q stuff
    set makeprg=build
    set smartcase
    set ff=unix
    set number
    " F7 to refresh cscope
    map <F7> :!cscope -R -b -q <CR>
       \:cscope reset<CR>

    " F8 for python refresh
    map <F8> :!find . -name \*.py \! -path \*qinternal\* > ~/tmp/pycscope_files <CR>
       \:!pycscope -R -f pycscope.out -i ~/tmp/pycscope_files <CR>
       \:cscope reset<CR>
endif

" highlight spurious whitespace before the linter does
highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/

" backups are a little silly when you're using patches constantly
set nobackup
set noswapfile

set ttimeoutlen=10

" --------------- more work-specific stuff ---------------


" Add any repo-specific settings like so
" source ~/src/.vimrc
