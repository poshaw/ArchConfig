set number
filetype plugin indent on	
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
hi NonText ctermfg=8

" Key (re)Mapping
	noremap <Leader>y "*y
	nnoremap <F9> :tabn<CR>
	nnoremap <F8> :tabp<CR>
	nnoremap <silent> <F7> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
	nnoremap <silent> <F10> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" 	nnoremap <leader>h :call ShowHiddenChar()<CR>
	nnoremap <leader>h :set list!<CR>
	nnoremap <leader>H :nohlsearch<CR>
	nnoremap <leader>ev :vsplit $MYVIMRC<CR>
	nnoremap <leader>sv :silent! bd ~/.config/nvim/init.vim<CR>:source $MYVIMRC<CR>
	nnoremap <leader>N :set relativenumber!<CR>
	nnoremap <leader>n :set number!<CR>
	nnoremap <F5> <Esc><Esc>:w<CR>:buffers<CR>:buffer<Space>
	nnoremap <F4> <Esc><Esc>:w<CR>:bp<CR>


autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Functions
	let g:showing_hiddens = 1
	function! ShowHiddenChar()
		if g:showing_hiddens
			set list
			let g:showing_hiddens = 0
		else
			set nolist
			let g:showing_hiddens = 1
		endif
	endfunction

