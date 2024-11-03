" PLUGINS -----------------------------

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Move lines up or down 
Plugin 'matze/vim-move'

" Nerdtree плагин для открытия дерева каталогов
Plugin 'scrooloose/nerdtree'

" php
Plugin 'stanangeloff/php.vim'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'arnaud-lb/vim-php-namespace'

" javascript
Plugin 'pangloss/vim-javascript'

" html
Plugin 'othree/html5.vim'

" css
Plugin 'mtscout6/vim-tagbar-css'

" Поддержка снипетов
" Plugin 'sirver/ultisnips' " Track the engine.
Plugin 'honza/vim-snippets' " Snippets are separated from the engine

" colors
Plugin 'damage220/solas.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'mhartington/oceanic-next'

" CtrlP Fuzzy find plugin
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'

" Плагин для удобной работы с тегами
Plugin 'majutsushi/tagbar'

" Плагин для моментального перемещения по коду
Plugin 'easymotion/vim-easymotion'

" Emmet plugin
Plugin 'mattn/emmet-vim'

" Плагин для комментариев
Plugin 'scrooloose/nerdcommenter'

" Airline plugin
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Auto completion for quotes, parens, brackets, etc.
Plugin 'raimondi/delimitmate'

" Плагин для работы с неколькими курсорами
Plugin 'terryma/vim-multiple-cursors'

" Surround plugin для wrapping тегом или ковычками
Plugin 'tpope/vim-surround'

" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'

" Автоматическая индексация тегов. Один раз для проекта :UpdateTags -R
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

" PhpCs
" Plugin 'joonty/vim-phpqa.git'

call vundle#end()



" PLUGINS SETTINGS ---------------------------

" vim-move <C-j> down, <C-k> up
let g:move_key_modifier = 'C'

" Toggle Open NERD Tree
map <C-n> :NERDTreeToggle<CR>

" html
au BufNewFile,BufRead *.tpl set filetype=html syntax=php

" Snippets Plugin
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" CtrlP plugin settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'wr'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" убираем переменные из списка тегов
let g:ctrlp_buftag_types = {
            \'php': '--php-kinds=icdf'
            \}
" поиск функции или тега в текущем файле (аналог Ctrl + R в sublime)
nnoremap <c-r> :CtrlPBufTag<cr>

" CtrlFunky mapping
"поиск функции или тега по всем файлам 
nnoremap <C-R> :CtrlPFunky<Cr> 
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_funky_use_cache = 1

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_sort = 0
let g:tagbar_width = 35
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_map_close = '<C-m>'
let g:tagbar_type_php = {
    \'ctagstype': 'php',
    \'kinds': [
        \'i:interfaces',
        \'c:classes',
        \'d:constants',
        \'f:functions'
    \]
    \}
let g:tagbar_type_javascript = {
            \'ctagstype':'JavaScript',
    \'kinds' : [
        \'f:functions',
        \'c:classes',
        \'m:methods',
        \'p:properties'
    \]
    \}


" Airline
" имя файла + расширение :tab help filename-modifiers
let g:airline#extensions#tabline#fnamemod = ':t'
" убираем раздражающие ненужные красные панели с предупреждениями или
" ошибками.
let g:airline_section_warning = ''
let g:airline_section_error = ''
" убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 0
" убираем разделитель для вкладок
let g:airline#extensions#tabline#left_alt_sep = ''
" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0
" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1
" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1
" solarized не входит в стандартную поставку, необходимо загрузить набор тем
let g:airline_theme='cool' " hybridline, papercolor, molokai
" использовать пропатченные шрифты
let g:airline_powerline_fonts = 1
" включить управление табами
let g:airline#extensions#tabline#enabled = 1
" всегда показывать tabline
let g:airline#extensions#tabline#tab_min_count = 0
" такое же поведение, как и в sublime
let g:airline#extensions#tabline#formatter = 'unique_tail'
" скрыть буферы
let g:airline#extensions#tabline#show_buffers = 0

" easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 0
hi link EasyMotionTarget Search
hi EasyMotionTarget2First ctermfg=202 ctermbg=None cterm=None
hi EasyMotionTarget2Second ctermfg=202 ctermbg=None cterm=None
nmap fs <Plug>(easymotion-s)
nmap fl <Plug>(easymotion-sl)

" Emmet разворачивать аббревиатуру по нажатию на <C-e>
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_leader_key='<C-e>'
" let g:user_emmet_expandabbr_key = '<C-e>'

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 2
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
map <C-_> <plug>NERDCommenterToggle

" Multicursor mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-D>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_start_word_key='g<C-d>'

" php-namespace 
autocmd FileType php noremap <C-u> :call PhpInsertUse()<CR>

" phpDocumenter
nnoremap <c-s-d> :call PhpDoc()<CR>

" EasyTags 
" записываем теги локально для каждого проекта, вместо ~/.vimtags
let g:easytags_file = './tags'
" отключаем подсветку тегов
let g:easytags_auto_highlight = 0
" события (:tab help autocmd-events), которые слушает easytags
let g:easytags_events = ['BufWritePost']
" не блокировать vim во время обновления тег-файла
let g:easytags_async = 1

" Set the codesniffer args
let g:phpqa_codesniffer_args = "--standard=PSR2"

" GLOBAL MAPPINGS ----------------------------

" Открытие файла .vimrc в новой вкладке в активной панели
nmap <F4> :tabedit $MYVIMRC<cr>:tabm 0<cr>

" Reload vimrc
nnoremap <F5> :w<CR>:so $MYVIMRC<CR>

" Space to toggle folds
nnoremap <space> za
vnoremap <space> za

" Открытие новой вкладки
nnoremap <c-t> :tabnew<cr>

" AUTO COMMMANDS ----------------------------

" Auto source .vimrc after save
autocmd BufWritePost .vimrc source %


" GLOBAL SETTINGS ----------------------------

" Fix backspace problem
set backspace=2

" Show numbers
set number

" Mouse support for vim 
set ttyfast
set mouse=a
set ttymouse=xterm2

" Tab sizes
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Always uses spaces instead of tab characters
set expandtab
set smarttab

" Indents
set autoread
set autoindent
set smartindent

" Save timeouts to swap
set laststatus=2
set timeoutlen=500
set ttimeoutlen=0
set updatetime=500
set noswapfile

" Show pressed keys in normal mode 
set showcmd

" Allow yank text to global clipboard
set clipboard=unnamed

" Paste mode toggle
set pastetoggle=<F2>

" Splits 
set splitright
set splitbelow

" Encodings 
set encoding=utf-8
set termencoding=utf-8

" Set highlight search
set hlsearch
set incsearch

" Common 
set nocompatible
set tags=./tags;
set ignorecase
set hidden
set cursorline
set pumheight=10
set fillchars+=vert:\ 
let mapleader=","
filetype off
filetype plugin on
filetype plugin indent on
" autocmd CompleteDone * pclose

" abbreviations
abbr help tab help
abbr pi PluginInstall
abbr snippet :UltiSnipsEdit<cr>

" color
syntax enable
set background=dark
colorscheme solas

" Put at the very end of your .vimrc file.

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
  hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

" Show/hide hidden characters
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
"Invisible character colors 
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

