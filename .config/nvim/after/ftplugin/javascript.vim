" show existing tab with tn spaces width
let tn=3
let &tabstop=tn
" when indenting with '>', use 4 spaces width
let &shiftwidth=tn
set noexpandtab


" comment
let comment='//'
" nnoremap <leader>G :call Comment(comment)<CR>
nnoremap <C-_> :call Comment(comment)<CR>
nnoremap <C-x> <Esc><Esc>:s!^!g:Comment!
nnoremap <leader>c <Esc><Esc>:s!^!# !<CR>:nohlsearch<CR>

function! Comment(comment)
	let l:part = getline('.')
	" check if line starts with comment space
	if (l:part =~ '^' . a:comment . ' ')
		execute "s!" . a:comment . " !!"
	else
		execute ":s!^!" . a:comment . " !"
	endif
endfunction
