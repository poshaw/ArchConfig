" show existing tab with tn spaces width
let tn=3
let &tabstop=tn
" when indenting with '>', use 3 spaces width
let &shiftwidth=tn
set noexpandtab

nnoremap <leader>r <Esc><Esc>:w<CR>:call ShowMD()<CR>

" autocmd VimLeavePre,BufLeave * silent execute "call CloseViewer()"

function ShowMD()
	silent execute '! vmd ' . expand('%:p')
endfunction

function CloseViewer()
	silent execute '! echo "$(date +%Y%m%d_%H%M%S)" >> ~/vim.log'
endfunction

