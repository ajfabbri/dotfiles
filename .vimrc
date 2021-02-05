set vb
syntax enable
filetype plugin indent on
set hls

set modeline
set modelines=20

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

noremap <C-j> :cn<CR>
noremap <C-k> :cp<CR>

colorscheme desert256

" ============================
" vim-plug: 	see .vim/autoload/plug.vim
"
call plug#begin('~/.vim/plugged')

Plug 'dr-kino/cscope-maps'

" Doesn't support neovim
"Plug 'yegappan/grep'

" on: lazy loaded
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" like fugitive, but for mercurial
Plug 'jlfwong/vim-mercenary'

"" RUST hopes and dreams

" official rust vim plugin
Plug 'rust-lang/rust.vim'

" Tagbar is nice-to-have for ctags navigation
Plug 'preservim/tagbar'

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

" Type \be to open list of buffers, sorted by MRU
Plug 'jlanzarotta/bufexplorer'

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


" Initialize plugin system
call plug#end()
" ============================

" Plugin config

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

" TODO lang client bindings

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

" highlight spurious whitespace before the linter does
highlight ExtraWhitespace ctermbg=lightgreen guibg=lightgreen 
match ExtraWhitespace /\s\+$/

" backups are a little silly when you're using patches constantly
set nobackup
set noswapfile

" q support for python.vim
function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction

" F7 to refresh cscope
map <F7> :!cscope -R -b -q <CR>
   \:cscope reset<CR>

" F8 for python refresh
map <F8> :!find . -name \*.py \! -path \*qinternal\* > ~/tmp/pycscope_files <CR>
   \:!pycscope -R -f pycscope.out -i ~/tmp/pycscope_files <CR>
   \:cscope reset<CR>

set number
set ttimeoutlen=10

" Specific work stuff
source ~/src/.vimrc
