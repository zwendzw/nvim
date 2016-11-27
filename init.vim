set shell=/bin/bash
" tip : change case of charts= gu
" in .erb file, type % or = and S-tab, can get <% %> or <%= %>
" c-o can return the cursors where it started.
" F1 : bp!, F2 : bn!, F3 : tagbar, F4 : pastetoggle, F5 : save tags
" GoldenView can auto resize split window, hotkey can use F1, F2 change buffer
" or use C-w hjkl,

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
"set nocompatible	" Use Vim defaults instead of 100% vi compatibility, not
"in  neoVim
"Autoinstall vim-plug {{{
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.vim/plugged')

" Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'zhaocai/GoldenView.Vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ap/vim-css-color'
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'junegunn/vim-easy-align'
"c9s大大的註解: normal_mode ",_c"=>註解, ",_C"=>取消註解, ",,"=>line comment"
Plug 'c9s/simple-commenter.vim'
"html emmet 自動補全包含html.erb, insert_mode <c-e> 啟用, insert_mode
"<c-n>跳至下一個empty_tag
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
"搜尋檔案
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
"自動補全...
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'

call plug#end()

"--------------------------------------
syntax on
filetype plugin indent on
set rtp+=~/.fzf
set directory=$HOME/.config/nvim/swp/swapfiles//
set ttimeout
set ttimeoutlen=100
set pastetoggle=<F4>
set backspace=2		" more powerful backspacing
set shiftwidth=2	" 縮排寬度=2"
set ts=2            " tab佔2個空白鍵"
set sts=2           " tab改為2個空白鍵,刪除時同樣刪除四個空白鍵"
set expandtab       " tab改為space"
set incsearch       " 搜尋時提示目前輸入的字"
set hlsearch        " 提示搜尋結果"
set cursorline      " 底線標註"
set scrolljump=5
set scrolloff=3
" set cursorcolumn    " 垂直標註
set smartindent     " Enter下一行和原先所在相同縮排,但#和某些符號例外"
set textwidth=78    " 78個字
set ignorecase      " 忽略大小寫
set clipboard+=unnamed "使用系統剪貼簿"
set number " 顯示數字
" set relativenumber " 相對數字
" Set mouse available in normal_mode and virtual
set mouse=nv
"Seting split window
set splitbelow
" set splitright
" 開啟tab
" nmap <Leader>tn :tabnew<return>
" Setting color
" set t_Co=256
set termguicolors
set background=dark
" bug?,防止iterm split window時, airline未自動回復用, 關閉時可直接輸入mode刷新
set lazyredraw
" set theme
color gruvbox
" color dracula
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
set encoding=utf-8

"set status line
set laststatus=2

set modelines=0		" CVE-2007-2438
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
"align
vmap <C-a> <Plug>(EasyAlign)
nmap <C-a> <Plug>(EasyAlign)
"最後輸入
nnoremap gV `[v`]
" keymap start
" 複製貼上功能
vnoremap yy "+y
nnoremap YY "+yg_
nnoremap yy "+y
nnoremap yy "+yy
nnoremap pp "+p
nnoremap pP "+P
vnoremap pp "+p
vnoremap PP "+P
" 快速跳到第N行, ex: 12<enter>, enter跳至最後一行, <c_o>返回
nnoremap <CR> G
" insert_mode C-l將游標移至最後"
inoremap <c-l> <Esc> A
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR>

" move up/down quickly by using leader-j, leader-k
nnoremap <silent> <Leader>j }
nnoremap <silent> <Leader>k {
" silent! map <C-\> <plug>NERDTreeTabsToggle<CR>
nnoremap <silent> <F1> :bp!<CR>
nnoremap <silent> <F2> :bn!<CR>
nnoremap <silent> <C-\> :NERDTreeFind<CR>:vertical<CR>
" which will move us around by functions
autocmd BufNewFile,BufRead *.js.erb set ft=javascript.eruby
autocmd BufNewFile,BufRead *.html.erb set ft=html.eruby
" 轉換縮排, tab,
autocmd FileType ruby,haml,scss,coffee,eruby,yaml,cucumber set ai sw=2 sts=2 et
autocmd FileType css,html,javascript,sass,python set ai sw=2 sts=2 et
"打開摺疊
autocmd FileType ruby,haml,scss,coffee,eruby,yaml,cucumber normal zR

autocmd FileType ruby map <buffer> <Leader>j ]m
autocmd FileType ruby map <buffer> <Leader>k [m
autocmd FileType rspec map <buffer> <Leader>j }
autocmd FileType rspec map <buffer> <Leader>k {
autocmd FileType javascript map <buffer> <Leader>k }

" enable powerline-fonts
let g:airline_theme='murmur'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format='%s: '

" set delimitMate setting
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" set nerdtree
let g:NERDTreeWinSize = 30

" 開啟ag
" let g:ackprg = 'ag --nogroup --nocolor'
" C_f 開啟搜尋
" -------------
nnoremap <C-f> :Files<CR>
" 進階功能
" ag進階搜尋內文
let g:ackprg = 'ag --vimgrep'
nnoremap <C-f>f :Agu<CR>
command! -bang -nargs=* Agu call fzf#vim#ag(<q-args>, '--skip-vcs-ignores', {'down': '~40%'})
let g:ag_working_path_mode="r"
" -------------
" \q to toggle quickfix window (where you have stuff like Ag)" ultisnips
" \oq to open it back up (rare)
nmap <silent> <Leader>qo :copen<CR>
nmap <silent> <Leader>qc :cclose<CR>

let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"simple commenter"
let g:scomment_default_mapping = 1

"deoplete
let g:deoplete#enable_at_startup = 1

" deoplete 使用tab選擇
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"move line use vim-move, C-k ↑, C-j ↓
let g:move_key_modifier = 'C'

" \# Surround a word with #{ruby interpolation}
map \# ysiw#
vmap \# c#{<C-R>"}<ESC>"}

" \" Surround a word with "quotes
map \" ysiw"
vmap \" c"<C-R>""<ESC>

" \' Surround a word with 'single quotes'
map \' ysiw'
vmap \' c'<C-R>"'<ESC>

" \) or \( Surround a word with (parens)
" The difference is in whether a space is put in
map \( ysiw(
map \) ysiw)
vmap \( c( <C-R>" )<ESC>
vmap \) c(<C-R>")<ESC>

" \[ Surround a word with [brackets]
map \] ysiw]
map \[ ysiw[
vmap \[ c[ <C-R>" ]<ESC>
vmap \] c[<C-R>"]<ESC>

" \{ Surround a word with {braces}
map \} ysiw}
map \{ ysiw{
vmap \} c{ <C-R>" }<ESC>
vmap \{ c{<C-R>"}<ESC>

map \> ysiw>
map \< ysiw<
vmap \> c< <C-R>" ><ESC>
vmap \< c<<C-R>" ><ESC>

map \` ysiw`

"F5紀錄tag
nnoremap <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"F3開啟tagbar
nnoremap <silent> <F3> :TagbarToggle<CR>


"開啟時回復上次關閉的位置
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal! g'\"" |
        \ endif
endif

let g:goldenview__enable_default_mapping = 0

" 1. split to tiled windows
nmap <silent> <F7>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <F8><F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
nmap <silent> <F9>  <Plug>GoldenViewNext
nmap <silent> <F10>  <Plug>GoldenViewPrevious
