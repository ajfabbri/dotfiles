set vb
syntax enable
set hls

set modeline
set modelines=20

set statusline=%F%m%r%h\ %=\ [L%l\ C%v][%p%%]

set laststatus=2

" syntax folding
set foldmethod=syntax

set ai
set tw=80

noremap <C-j> :cn<CR>
noremap <C-k> :cp<CR>

colo desert

" Custom startup macros
command! PwdStartup :so ~/.vim/pwd-startup.vim

command! LatestLinuxStartup :so ~/.vim/latest-linux-startup.vim
command! WrlGaStartup :so ~/.vim/wrga-linux-startup.vim
command! RT310Startup :so ~/.vim/rt310-linux-startup.vim
command! Yocto310Startup :so ~/.vim/yocto310-linux-startup.vim
command! RT32Startup :so ~/.vim/rt32-linux-startup.vim
command! NumactlStartup :so ~/.vim/numactl-startup.vim
command! LatTestStartup :so ~/.vim/lattest-startup.vim
command! RubiconLatencyStartup :so ~/.vim/rubicon-latency-startup.vim
command! QemuUpsreamStartup :so ~/.vim/qemu-upstream-startup.vim

" Enable cindent with my prefs -AF
function! Af_set_cindent()
	" echo Setting af cindent options
	redraw
	set cindent
	set cino=(1s
endfunction

if !exists("s:autocommands_loaded")
	let s:autocommands_loaded = 1
	au BufReadPre,FileReadPre	*.[ch] call Af_set_cindent()
endif
