" 
" Set path and tags path based on current directoy.
"
let _path = expand('%') .'/home/fabbri/Code/linux-stable-rt/**'
execute "set path=" . _path
let _tpath = './tags,tags,' . expand('%') . '/tags'
execute "set tags=" . _tpath
ed .
