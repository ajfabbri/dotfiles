setlocal ts=4 sw=4 expandtab sts=4
setlocal nospell

inoremap <buffer> ZL <Esc>:exec ("normal " . (80 - virtcol(".")) . "a#")<CR>a

" Indent Python in the Google way.

setlocal indentexpr=GetGooglePythonIndent(v:lnum)

let s:maxoff = 50 " maximum number of lines to look backwards.

let pyindent_nested_paren="&sw*2"
let pyindent_open_paren="&sw*2"
