" ------------------------------------------------------------------------------
" Filename:      ~/.vim/plugin/figlet.vim
" Version:       1.2
" Maintainer:    Neal Fachan
" Install:       Put this file in the vim plugins directory to load it
"                automatically, or load it with :so figlet.vim
" Description:   This script creates a command for printing comments with
"                figlet.
" History:       1.0 - Initial version
"                1.1 - Added filetype support
"                1.2 - ZACK: Python end_comment should not include extra space
" ------------------------------------------------------------------------------

function! Figlet(...)
  if &filetype == 'c'
    let beg_comment = "/* "
    let mid_comment = " * "
    let end_comment = " */"
    let width = "77"
  elseif &filetype == 'cpp'
    let beg_comment = "/* "
    let mid_comment = " * "
    let end_comment = " */"
    let width = "77"
  elseif &filetype == 'rust'
    let beg_comment = "/* "
    let mid_comment = " * "
    let end_comment = " */"
    let width = "97"
  elseif &filetype == 'tex'
    let beg_comment = "% "
    let mid_comment = "% "
    let end_comment = "% "
    let width = "77"
  elseif &filetype == 'python'
    let beg_comment = "# "
    let mid_comment = "# "
    let end_comment = "#"
    let width = "77"
  else
    let beg_comment = ""
    let mid_comment = ""
    let end_comment = ""
    let width = "77"
  endif

  let args = join(a:000, ' ')
  let text = system("figlet -w ".width." -- ".shellescape(args))
  let lineno = line(".")
  let first = 1
  while text =~ "\n"
    let i = stridx(text, "\n")
    let line = substitute(strpart(text, 0, i), " *$", "", "")
    let text = strpart(text, i+1)
    if line =~ "[^ ]"
      if first
        let prefix = beg_comment
        let first = 0
      else
        let prefix = mid_comment
      endif
      let result = append(lineno, prefix.line)
      let lineno = lineno + 1
    endif
  endwhile

  let line = substitute(text, " *$", "", "")
  if line =~ "[^ ]"
    let result = append(lineno, mid_comment.line)
    let lineno = lineno + 1
  endif

  let result = append(lineno, mid_comment." FIGLET: ".args)
  let lineno = lineno + 1

  let result = append(lineno, end_comment)
  let lineno = lineno + 1
  let result = append(lineno, "")
  let result = cursor(lineno+1, 1)
endfunction

command! -nargs=+ Figlet call Figlet(<f-args>)
