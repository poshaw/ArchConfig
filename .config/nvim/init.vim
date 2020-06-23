call plug#begin('~/.local/share/nvim/plugged')

"Plug 'davidhalter/jedi-vim'
"let g:jedi#completions_enabled = 0
"let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = ""
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = ""
"let g:jedi#usages_command = ""
"let g:jedi#completions_command = ""
"let g:jedi#rename_command = ""
"Plug 'zchee/deoplete-jedi'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"let g:deoplete#enable_at_startup = 1
"set completeopt-=preview
Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'scrooloose/nerdcommenter'
"Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
noremap	<C-o> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#end()

set termguicolors
lua require 'colorizer'.setup({ "*"; }, { rgb_fn = true; } )

set number
filetype plugin indent on	
" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
hi NonText ctermfg=8
set splitright
set splitbelow
set scrolloff=4  " Keep the last 4 lines visible when scrolling

" Key (re)Mapping
	noremap <Leader>y "*y
	nnoremap <F9> :tabn<CR>
	nnoremap <F8> :tabp<CR>
	nnoremap <silent> <F7> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
	nnoremap <silent> <F10> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
" 	nnoremap <leader>h :call ShowHiddenChar()<CR>
	nnoremap <leader>h :set list!<CR>
	nnoremap <leader>H :nohlsearch<CR>
	nnoremap <leader>ev :e $MYVIMRC<CR>
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
