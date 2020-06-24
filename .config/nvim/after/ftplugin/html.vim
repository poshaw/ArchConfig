" show existing tab with tn spaces width
let tn=3
let &tabstop=tn
" when indenting with '>', use 4 spaces width
let &shiftwidth=tn
set noexpandtab

" nnoremap <leader>r <Esc><Esc>:w<CR>:belowright split<CR>:set nonumber<CR>:resize 10<CR>:term python %<CR>:star<CR>
" nnoremap <leader>i <Esc><Esc>:w<CR>:set nonumber<CR>:belowright split term://python -i %<CR>
inoremap <code> <code></code><Esc>%i
inoremap <ol> <ol><cr><li></li><cr></ol><Esc>k$%i
inoremap <p> <p></p><Esc>%i
inoremap <table> <table><cr><tr><cr><td></td><cr></tr><cr></table><Esc>kkf>a
inoremap <tr> <tr><cr><td></td><cr></tr><Esc>k$%i
inoremap <td> <td></td><Esc>%i
inoremap <ul> <ul><cr><li></li><cr></ul><Esc>k$%i

" comment
let commentStart='<!--'
let commentEnd='-->'
nnoremap <C-_> :call Comment()<CR>

function! Comment()
	let l:part = getline('.')
	" check if line starts with comment space
	if (l:part =~ '^' . g:commentStart . ' ')
		execute "s@" . g:commentStart . " @@"
		execute "s@ " . g:commentEnd . "@@"
	else
		execute ":s@^@" . g:commentStart . " @"
		execute ":s@$@ " . g:commentEnd . "@"
	endif
endfunction
