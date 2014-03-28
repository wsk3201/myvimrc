if has('gui_running')
    if has("win32")
        au GUIEnter * simalt ~x
    elseif has("unix")
        au GUIEnter * winpos 0 0
        set lines=999 columns=999
    endif
endif

""""""""""""""""""""""""""""""""""""""""
" Vundle
"
" $ mkdir -p ~/.vim/bundle
" $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
"
" :BundelInstall
""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
    set nocompatible               " Be iMproved
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc'

" vim-scripts repos
NeoBundle 'molokai'
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
NeoBundle 'taglist.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'winmanager'
NeoBundle 'minibufexplorerpp'
NeoBundle 'Gundo'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'xolox/vim-misc'

" complete
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

"python plugins"
NeoBundle 'pydoc.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'pep8'
NeoBundle 'jmcantrell/vim-virtualenv'
"

"nodejs plugins"
NeoBundle 'git@github.com:jelera/vim-javascript-syntax.git'

NeoBundle 'git@github.com:moll/vim-node.git'

NeoBundle 'git@github.com:marijnh/tern_for_vim.git'

NeoBundle 'git@github.com:othree/javascript-libraries-syntax.vim.git'
"

"lua plugins"
NeoBundle 'xolox/vim-lua-ftplugin'

NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""
" Basic-settings
""""""""""""""""""""""""""""""""""""""""
filetype on
filetype plugin on
filetype indent on
syntax on

set shell=zsh
set t_Co=256
set autochdir
set noerrorbells
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set numberwidth=5
set history=1000
set nobackup
set noswapfile
set ignorecase
set hlsearch
set incsearch
set cursorline
set gdefault
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=2
set ruler
set showcmd
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set linespace=0
set wildmenu
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=5
set scrolloff=6
set autoindent
set smartindent
set foldmethod=syntax
set foldlevel=100
set completeopt=menuone,longest,preview

if has("gui_macvim")
    set transp=3
    set guifont=Source\ Code\ Pro\ for\ Powerline:h16
    set go=
    let macvim_skip_cmd_opt_movement = 1
    let macvim_hig_shift_movement = 1
    colorscheme molokai
endif

let mapleader=","
let g:mapleader=","

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
nnoremap <leader>j  :bn!<CR>
nnoremap <leader>k  :bp!<CR>
nnoremap <leader>c  :bd!<CR>


""""""""""""""""""""""""""""""""""""""""
" minibufexplorerpp
""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

""""""""""""""""""""""""""""""""""""""""
" Taglist
""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Sort_Type = 'name'
let Tlist_Show_One_File = 1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_OnSelect=1
let Tlist_Compact_Format=1
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
let Tlist_Inc_Winwidth = 0

""""""""""""""""""""""""""""""""""""""""
" vim-powerline
""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""
" netrw
""""""""""""""""""""""""""""""""""""""""
let g:netrw_winsize = 30
map <leader>n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" winManager
""""""""""""""""""""""""""""""
let g:NERDTree_title="[NERD Tree]"
let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWidth = 30
let g:defaultExplorer = 0

function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction
nmap <silent> <leader>wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

""""""""""""""""""""""""""""""""""""""""
" vim-markdown
""""""""""""""""""""""""""""""""""""""""
" let filetype_markdown='octopress'
autocmd BufNewFile,BufRead *.markdown,*.textile set filetype=octopress
autocmd BufNewFile,BufRead *.json set filetype=javascript

""""""""""""""""""""""""""""""""""""""""
" NeoComplCache
""""""""""""""""""""""""""""""""""""""""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
let g:neocomplcache_max_list = 30
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplcache#smart_close_popup() . "\<CR>"
    " For no inserting <CR> key.
    "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.python = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.python3 = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><Space> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? neocomplcache#close_popup() : "\<Space>"
smap <expr><Space> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: "\<Space>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

""""""""""""""""""""""""""""""""""""""""
" Gundo
""""""""""""""""""""""""""""""""""""""""
map <leader>g :GundoToggle<CR>

""""""""""""""""""""""""""""""""""""""""
" Python Mode
""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set foldmethod=indent

""""""""""""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list=1
let g:syntastic_python_checkers=['pyflakes']

""""""""""""""""""""""""""""""""""""""""
" PEP8
""""""""""""""""""""""""""""""""""""""""
let g:pep8_map='<leader>8'

""""""""""""""""""""""""""""""""""""""""
" RUN
""""""""""""""""""""""""""""""""""""""""
map <F1> <ESC>:w<CR>:call RunOneFile()<CR>
function! RunOneFile()
    if &filetype=='vim'
        source %
    elseif &filetype=='python'
        if expand('%:e')=='py3'
            !python3 %
        else
            !python %
        endif
    elseif &filetype=='c'
        if exists('g:ccprg')
            let b:ccprg = g:ccprg
        else
            let b:ccprg = 'gcc'
        endif
        exe '!' . b:ccprg . ' "' . expand('%:p') . '" -o "' . expand('%:p:r') . '"'
        exe '!' . expand('%:p:r')
    endif
endfunction

"nodejs"
autocmd FileType javascript call JavaScriptFold()

autocmd FileType javascript set runtimepath^=~/.vim/bundle/node

autocmd FileType javascript set tabstop=2
autocmd FileType javascript set softtabstop=2
autocmd FileType javascript set shiftwidth=2

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

"lua"
let g:lua_complete_omni = 1
let g:lua_define_completefunc = 0
let g:lua_define_omnifunc = 0
