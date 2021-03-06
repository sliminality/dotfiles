" Vundle
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'  " required

    " Syntax and inference tooling
    " Plugin 'scrooloose/syntastic'
    Plugin 'flowtype/vim-flow'
    Plugin 'Valloric/YouCompleteMe'

    " UI extensions
    Plugin 'ayu-theme/ayu-vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline'
    " Plugin 'tpope/vim-fugitive'
    Plugin 'Yggdroot/indentLine'

    " Editing
    Plugin 'lfilho/cosco.vim'
    Plugin 'tpope/vim-surround'
    " Plugin 'jpalardy/vim-slime'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-repeat'
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    Plugin 'mattn/emmet-vim'
    Plugin 'HTML-AutoCloseTag'
    Plugin 'tpope/vim-dispatch'
    Plugin 'terryma/vim-multiple-cursors'

    " Language specific support
    Plugin 'elzr/vim-json'
    Plugin 'pangloss/vim-javascript'
    Plugin 'mxw/vim-jsx'
    " Plugin 'kchmck/vim-coffee-script'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'rust-lang/rust.vim'
    " Plugin 'wlangstroth/vim-racket'

    " Markdown and writing
    Plugin 'godlygeek/tabular'
    " Plugin 'plasticboy/vim-markdown'
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'lervag/vimtex'

    " plugin from http://vim-scripts.org/vim/scripts.html
    " Plugin 'L9'

    " Git plugin not hosted on GitHub
    " Plugin 'git://git.wincent.com/command-t.git'

    " git repos on your local machine (i.e. when working on your own plugin)
    " Plugin 'file:///home/gmarik/path/to/plugin'

    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

    call vundle#end()
    filetype plugin indent on

    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" Formatting

    set number          " Enable line numbers
    set wrap            " Wrap lines

    set nojoinspaces    " No double spaces after punctuation on join

    set expandtab       " Use spaces instead of tabs
    set smarttab        " Be smart when using tabs
    set shiftwidth=4    " 1 tab == 4 spaces
    set tabstop=4

    augroup SyntaxSettings
        autocmd!
        autocmd FileType html,javascript,haskell,yaml,json,css setlocal shiftwidth=2 softtabstop=2 tabstop=2
        autocmd BufNewFile,BufRead *.coffee set filetype=coffee
        autocmd BufNewFile,BufRead *.yml,*.yaml set filetype=yaml
        autocmd BufNewFile,BufRead *.eslintrc,*.babelrc set filetype=json

        " Use Prettier to format JavaScript
        autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --parser\ flow\ --print-width\ 80\ --trailing-comma\ es5\ --single-quote\ true
        autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"

        au BufNewFile,BufRead *.mdown,*.mkd,*.md set filetype=tex
        au BufNewFile,BufRead *.mdown,*.md set syntax=pandoc
    augroup END

    let g:tex_flavor = 'latex'

    set lbr             " Linebreak on 500 chars
    set tw=500
    set autoindent      " Auto indent
    set si              " Smart indent

    let g:NERDSpaceDelims = 1   " Space after comment delim

    " Auto detect filetypes
    filetype plugin indent on

    " Delete trailing whitespace on save
    func! DeleteTrailingWS()
      exe "normal mz"
      %s/\s\+$//ge
      exe "normal `z"
    endfunc
    augroup DeleteWhitespace
        autocmd!
        autocmd BufWrite *.py :call DeleteTrailingWS()
        autocmd BufWrite *.js :call DeleteTrailingWS()
    augroup END

" UI

    syntax enable       " Enable syntax highlighting
"     set cursorline      " Highlight current line

    set nospell         " Disable spellcheck
    set incsearch       " Find as you type search
    set hlsearch        " Highlight found search results
    set ignorecase      " Case insensitive search
    set smartcase       " Case sensitive when uc present
    set wildmenu        " Show list instead of just completing

    set mouse=a         " Automatically enable mouse usage
    set mousehide       " Hide the mouse cursor while typing

    set laststatus=2    " Always show the status line
    set showcmd         " Partial commands in status line
    set showmode        " Show current mode

    set vb t_vb=        " Set visual bell and clear visual bell

    " Stop automatically inserting new comment leaders,
    " unless we hit 'o' or 'O' in normal mode.
    augroup commentgroup
        autocmd!
        autocmd FileType * set fo-=r fo-=c fo-=o
    augroup END

    " Disable scrollbars
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L

    " Open new splits to the right and bottom
    set splitbelow
    set splitright

	set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

    " Allow to trigger background
    function! ToggleBG()
        let s:tbg = &background
        " Inversion
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <leader>bg :call ToggleBG()<CR>

    " set Vim-specific sequences for RGB colors
    " necessary for tmux + vim to work
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum""]"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]"

    set background=light  " Otherwise bright colors are lurid
    set t_Co=256
    if has('termguicolors')
        set background=dark
        set termguicolors
    endif

    let ayucolor="mirage"   " for dark version of theme
    colorscheme ayu
    " color ron

    hi VertSplit guibg=#272D38

    " Make concealed operators readable in LaTeX
    hi! link Conceal Operator

    " Make matched parens visually distinct from cursor
    hi MatchParen term=underline cterm=underline gui=underline guifg=NONE guibg=NONE

    " Change gutter color
    hi LineNr guibg=#272d38

    " make Esc happen without waiting for timeoutlen
    " fixes Powerline delay
    augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
    augroup END

" Editing

    set pastetoggle=<F12>            " Toggle auto-indentation
    set backspace=indent,eol,start   " Backspace for dummies
    set scrolljump=5                 " Lines to scroll when cursor leaves screen
    set scrolloff=10                 " Minimum lines to keep above and below cursor

    set iskeyword-=.                 " '.' delimits words
    set iskeyword-=#                 " '#' delimits words
    set iskeyword-=-                 " '-' delimits words

    " Command <Tab> completion, list matches, then longest common part, then all.
    set wildmode=list:longest,full

" Filesystem

    set autoread        " Autoread when a file is changed externally
    set hidden          " Hide buffers instead of closing

    " Enable persistent undo across buffers and sessions
    try
        set undodir=~/.vim_runtime/temp_dirs/undodir
        set undofile
        set undolevels=1000
        set undoreload=10000
    catch
    endtry

    " Return to last edit position when opening files
    augroup SaveEditPosition
        autocmd!
        autocmd BufReadPost *
             \ if line("'\"") > 0 && line("'\"") <= line("$") |
             \   exe "normal! g`\"" |
             \ endif
    augroup END

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.before.local file:
    " let g:no_autochdir = 1
    " if !exists('g:no_autochdir')
    "     augroup AutoChDir
    "         autocmd!
    "         autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    "     augroup END
    " endif

" Mapping

    let mapleader=" "   " Leader key to space

    " Exit insert mode with kj
    inoremap jk <esc>
    inoremap kj <esc>

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Move lines around easily
    nnoremap <leader>k :m-2<cr>==
    nnoremap <leader>j :m+<cr>==
    xnoremap <leader>k :m-2<cr>gv=gv
    xnoremap <leader>j :m'>+<cr>gv=gv

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Toggle search highlighting instead of clearing
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Allow using the repeat operator with a visual selection (!)
    " http://stackoverflow.com/a/8064607/127816
    vnoremap . :normal .<CR>

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " To open a new empty buffer
    nmap <leader>T :enew<cr>

    " Move to the next buffer
    nmap <leader>l :bnext<CR>

    " Move to the previous buffer
    nmap <leader>h :bprevious<CR>

    " Close the current buffer and move to the previous one
    " This replicates the idea of closing a tab
    nmap <leader>w :bp <BAR> bd #<CR>

    " Show all open buffers and their status
    nmap <leader>bl :ls<CR>

    " Copy to system keyboard
    vnoremap <C-c> "*y

    " Very magic regexes
    nnoremap / /\v
    vnoremap / /\v
    cnoremap %s/ %smagic/
    cnoremap \>s/ \>smagic/
    nnoremap :g/ :g/\v
    nnoremap :g// :g//

    " Pad new lines without entering insert mode
    nnoremap <leader>O O<Esc>j
    " nnoremap <leader>o o<Esc>k

    " Treat $ as text objects
    " onoremap <silent> i$ :<c-u>normal! T$vt$<cr>
    " vnoremap i$ T$ot$

    " Navigate splits
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l

" Plugins

    " Pandoc
    if isdirectory(expand('~/.vim/bundle/vim-pandoc'))
        let g:pandoc#syntax#codeblocks#embeds#langs = [
            \ 'python',
            \ 'javascript',
            \ 'css',
            \ 'rkt=scheme',
            \ 'bash=sh'
            \ ]
    endif

    " vimtex
    if isdirectory(expand('~/.vim/bundle/vimtex'))
        let g:vimtex_complete_close_braces = 1
    endif

    if !exists('g:ycm_semantic_triggers')
      let g:ycm_semantic_triggers = {}
    endif
    let g:ycm_semantic_triggers.tex = [
              \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
              \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
              \ 're!\\hyperref\[[^]]*',
              \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
              \ 're!\\(include(only)?|input){[^}]*',
              \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
              \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
              \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
              \ 're!\\usepackage(\s*\[[^]]*\])?\s*\{[^}]*',
              \ 're!\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
              \ ]

    " Cosco
    if isdirectory(expand('~/.vim/bundle/cosco.vim'))
        augroup AppendSemicolon
            autocmd!
            autocmd FileType rust,c,ch,json,java,sass,javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
            autocmd FileType rust,c,ch,json,java,sass,javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
        augroup END
    endif

    " YouCompleteMe
    if isdirectory(expand('~/.vim/bundle/YouCompleteMe'))
        augroup YCMGoTo
            autocmd!
            autocmd FileType rust,c,ch,sass,css,json,java nnoremap <Leader>] :YcmCompleter GoTo<CR>
        augroup END
    endif

    " vim-flow
    if isdirectory(expand('~/.vim/bundle/vim-flow'))
        let g:flow#enable = 0
        augroup FlowGoTo
            autocmd!
            autocmd FileType javascript nnoremap <Leader>] :FlowJumpToDef<CR>
        augroup END
    endif

    " Flow syntax highlighting
    let g:javascript_plugin_flow = 1

    " Add JSX syntax highlighting to .js files
    let g:jx_ext_required = 0

    " Rust language
    let g:rustfmt_autosave = 1
    let g:ycm_rust_src_path = '/Users/sarah/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

    " Dispatch
    if isdirectory(expand("~/.vim/bundle/vim-dispatch"))
        augroup Dispatch
            autocmd!
            autocmd FileType java let b:dispatch = 'javac %'
            autocmd FileType python let b:dispatch = 'python %'
            autocmd FileType racket,scheme let b:dispatch = 'racket %'
            autocmd FileType javascript let b:dispatch = 'node %'
        augroup END

        " Map :Dispatch
        nnoremap <leader>b :Dispatch<CR>
    endif

    " AutoPairs
    if isdirectory(expand('~/.vim/bundle/auto-pairs'))
        let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`',
            \ } " '$': '$' }
    endif

    " vim-surround
    if isdirectory(expand('~/.vim/bundle/vim-surround'))
        let g:surround_33 = "```\r```"
        let g:surround_96 = "`\r`"
    endif

    " NERDTree
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        let NERDTreeShowHidden=1
        let NERDTreeIgnore=['\.DS_Store', '\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', 'node_modules']
        let NERDTreeMouseMode=2  " Single click to open directories
        let NERDTreeChDirMode=2  " cwd when NERDTree root changes
        nmap <leader>e :NERDTreeToggle<CR>

        " Highlight directories in yellow
        hi NERDTreeDir ctermfg=11 guifg=#FFCC66 guibg=#242B38
    endif

    " Tabularize
    if isdirectory(expand("~/.vim/bundle/tabular"))
        nmap <Leader>a& :Tabularize /&<CR>
        vmap <Leader>a& :Tabularize /&<CR>
        nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
        vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
        nmap <Leader>a=> :Tabularize /=><CR>
        vmap <Leader>a=> :Tabularize /=><CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a,, :Tabularize /,\zs<CR>
        vmap <Leader>a,, :Tabularize /,\zs<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif

"     " Syntastic
"     if isdirectory(expand('~/.vim/bundle/syntastic'))
"         " set statusline+=%#warningmsg#
"         " set statusline+=%{SyntasticStatuslineFlag()}
"         " set statusline+=%*

"         let g:syntastic_always_populate_loc_list = 1
"         let g:syntastic_auto_loc_list = 1
"         let g:syntastic_check_on_open = 1
"         let g:syntastic_check_on_wq = 0
"     endif

    " Airline
    if isdirectory(expand('~/.vim/bundle/vim-airline'))
        let g:airline_powerline_fonts = 1  " Auto populate g:airline_symbols dictionary
        let g:airline_theme = 'dark'
        let g:airline_right_alt_sep = ''
        let g:airline_right_sep = ''
        let g:airline_left_alt_sep= ''
        let g:airline_left_sep = ''
        let g:airline#extensions#tabline#enabled = 1      " Enable the list of buffers
        let g:airline#extensions#tabline#fnamemod = ':t'  " Show just the filename
        let g:airline_extensions = ['tabline']
    endif

    " fzf
    if isdirectory(expand('~/.vim/bundle/fzf.vim'))
        nnoremap <leader>p :GFiles<cr>
        nnoremap <leader>o :Files<cr>
        " let g:fzf_action = {
        "     \ 'ctrl-t': 'tab split',
        "     \ 'ctrl-x': 'split',
        "     \ 'ctrl-v': 'vsplit' }
    endif

    " JSON
    set conceallevel=0
    let g:vim_json_syntax_conceal = 0

