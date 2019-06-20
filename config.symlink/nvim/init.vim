" Vundle
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'  " required

    " General syntax and inference tooling
    if !exists('g:actualvim')
        Plugin 'w0rp/ale'
        Plugin 'prettier/vim-prettier', { 'do': 'npm install' }

        " Deoplete requires Python 3.
        if has('nvim') && has('python3')
            Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        endif
    endif

    " UI extensions
    if !exists('g:actualvim')
        " Plugin 'sarahlim/wild-cherry-vim'
        " Plugin 'ayu-theme/ayu-vim'
        Plugin 'sarahlim/vim'
        Plugin 'scrooloose/nerdtree'
        Plugin 'itchyny/lightline.vim'
        Plugin 'mgee/lightline-bufferline'
        Plugin 'tpope/vim-fugitive'
        Plugin 'airblade/vim-gitgutter'
        Plugin 'christoomey/vim-tmux-navigator'
    endif

    " Editing
    Plugin 'lfilho/cosco.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-repeat'
    Plugin 'junegunn/fzf'
    Plugin 'junegunn/fzf.vim'
    Plugin 'tpope/vim-dispatch'

    " Language specific support
    " Plugin 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
    Plugin 'elzr/vim-json'
    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'pangloss/vim-javascript'
    Plugin 'neoclide/vim-jsx-improve'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'digitaltoad/vim-pug'
    Plugin 'rust-lang/rust.vim'
    Plugin 'wlangstroth/vim-racket'
    Plugin 'rhysd/vim-wasm'
    Plugin 'neovimhaskell/haskell-vim'
    Plugin 'itchyny/vim-haskell-indent'
    Plugin 'reasonml-editor/vim-reason-plus'
    Plugin 'leafgarland/typescript-vim'

    " Markdown and writing
    Plugin 'godlygeek/tabular'
    Plugin 'JamshedVesuna/vim-markdown-preview'
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
    autocmd FileType html,javascript,haskell,yaml,json,css,scss,pug setlocal shiftwidth=4 softtabstop=4 tabstop=4

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufRead *.yml,*.yaml set filetype=yaml
    autocmd BufNewFile,BufRead *.eslintrc,*.babelrc set filetype=json
    autocmd BufNewFile,BufRead *.tsx set filetype=typescript

    " au BufNewFile,BufRead *.mdown,*.mkd,*.md set filetype=tex
    " au BufNewFile,BufRead *.mdown,*.md set syntax=pandoc
augroup END

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

    if !exists('g:actualvim')
        syntax enable       " Enable syntax highlighting
    "     set cursorline      " Highlight current line
    endif

    set lazyredraw      " Make rendering performance better
    set conceallevel=0  " Stop concealing Markdown
    set nospell         " Disable spellcheck
    set incsearch       " Find as you type search
    set hlsearch        " Highlight found search results
    set ignorecase      " Case insensitive search
    set smartcase       " Case sensitive when uc present
    set wildmenu        " Show list instead of just completing

    set mouse=a         " Automatically enable mouse usage
    set mousehide       " Hide the mouse cursor while typing

    set vb t_vb=        " Set visual bell and clear visual bell


    " MacVim gui font
    set guifont=Operator\ Mono\ for\ Powerline:h13
    set linespace=2

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

    " Tab bar
    set showtabline=2

    " Status bar
    set laststatus=2    " Always show the status line
    set showcmd         " Partial commands in status line
    set showmode        " Show current mode

    set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

    nmap <leader>sp :call <SID>SynStack()<CR>
    function! <SID>SynStack()
      if !exists("*synstack")
        return
      endif
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc

    " Lightweight status line to replace Airline {
    " https://gabri.me/blog/diy-vim-statusline

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
    if has('termguicolors')
        " Force true colour on, since Vim can’t detect it within tmux.
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum""]"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum""]"
    endif

    set t_Co=256

    set t_ut=
    if has('termguicolors')
        set background=dark
        " Will result in no colours inside tmux.
        set termguicolors
    endif

    " Neovim: use straight cursor for insert mode
    set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20

    colorscheme rainbow-contrast
    hi  GitGutterAddDefault    guifg=#a7da1e guibg=#0a0b0c
    hi  GitGutterChangeDefault guifg=#f7b83d guibg=#0a0b0c
    hi  GitGutterDeleteDefault guifg=#e61f44 guibg=#0a0b0c
    hi  SignColumn             guibg=#0a0b0c

    " Ayu theme settings {
    if !exists('g:actualvim')
      if isdirectory(expand('~/.vim/bundle/ayu-vim'))
        let ayucolor="mirage"
        " colorscheme ayu

        " Change gutter and vsplit color
        " hi  LineNr                  guibg=#272d38
        " hi  VertSplit               guibg=#272d38
        " hi  SignColumn              guibg=#272d38
        " hi  GitGutterAddDefault     guibg=#272d38
        " hi  GitGutterChangeDefault  guibg=#272d38
        " hi  GitGutterDeleteDefault  guibg=#272d38

        " Highlight directories in yellow
        " hi  NERDTreeDir ctermfg=11 guifg=#FFCC66 guibg=#242B38
      endif
    endif

    " Make matched parens visually distinct from cursor
    hi MatchParen gui=underline guifg=NONE guibg=NONE

    " Remove | char from vertical splits
    set fillchars+=vert:\ 

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

    " Folding
    augroup FoldLevel
        autocmd!
        autocmd FileType javascript set foldmethod=syntax
        autocmd FileType javascript set foldlevel=0
        autocmd FileType javascript set foldnestmax=1

        autocmd BufNewFile,BufRead *.jsx set foldnestmax=2
    augroup END

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

" Mapping

    let mapleader=" "   " Leader key to space

    set timeoutlen=500 ttimeoutlen=0  " Less lag on waiting for key delays

    " Avoid unnecessary hit-enter prompts.
    set shortmess+=atI

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Move lines around easily
    nnoremap <leader>k :m-2<cr>==
    nnoremap <leader>j :m+<cr>==
    xnoremap <leader>k :m-2<cr>gv=gv
    xnoremap <leader>j :m'>+<cr>gv=gv

    " Code folding options
    set foldlevel=2

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

    " Toggle search highlighting on/off quickly
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Find merge conflict markers
    map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

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
    nmap <leader>W :bdelete!<CR>

    " Show all open buffers and their status
    nmap <leader>bl :Buffers<CR>

    " Copy to system keyboard
    vnoremap <C-c> "*y

    " Very magic regexes
    nnoremap / /\v
    vnoremap / /\v
    cnoremap %s/ %smagic/
    cnoremap \>s/ \>smagic/
    nnoremap :g/ :g/\v
    nnoremap :g// :g//

    " Treat $ as text objects
    " onoremap <silent> i$ :<c-u>normal! T$vt$<cr>
    " vnoremap i$ T$ot$

    " Navigate splits
    nnoremap <c-j> :TmuxNavigateDown<cr>
    nnoremap <c-k> :TmuxNavigateUp<cr>
    nnoremap <c-h> :TmuxNavigateLeft<cr>
    nnoremap <c-l> :TmuxNavigateRight<cr>

" Plugins

    " Pandoc
    if isdirectory(expand('~/.vim/bundle/vim-pandoc'))
        let g:pandoc#completion#bib#mode = 'citeproc'
        let g:pandoc#syntax#conceal#use = 0
        let g:pandoc#syntax#codeblocks#embeds#langs = [
            \ 'python',
            \ 'javascript',
            \ 'html',
            \ 'css',
            \ 'rkt=scheme',
            \ 'bash=sh'
            \ ]
    endif

    " GitGutter
    if isdirectory(expand('~/.vim/bundle/vim-gitgutter'))
        " let g:gitgutter_override_sign_column_highlight = 0
    endif

    " vimtex
    if isdirectory(expand('~/.vim/bundle/vimtex'))
        let g:tex_flavor = 'latex'
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
            autocmd FileType rust,c,cpp,ch,json,java,sass,javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
            autocmd FileType rust,c,cpp,ch,json,java,sass,javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
        augroup END
    endif

    " VimTmuxRunner
    let g:VtrGitCdUpOnOpen = 1
    let g:VtrOrientation = 'h'

    " indent line
    if isdirectory(expand('~/.vim/bundle/indentLine'))
        let g:indentLine_char = '┆'
        let g:indentLine_first_char = '┆'
        let g:indentLine_showFirstIndentLevel = 0
        let g:indentLine_color_term = 59
        let g:indentLine_color_gui = '#403545'
        let g:indentLine_conceallevel = 0
    endif

    let g:python3_host_prog = '/usr/local/bin/python3'

    if isdirectory(expand('~/.vim/bundle/YouCompleteMe'))
        " augroup YCMGoTo
        "     autocmd!
        "     autocmd FileType rust,c,cpp,ch,sass,css,json,java,python nnoremap <Leader>] :YcmCompleter GoTo<CR>
        " augroup END
        set completeopt-=preview
    endif

    " Deoplete
    if isdirectory(expand('~/.vim/bundle/deoplete.nvim'))
        let g:deoplete#enable_at_startup = 1
        set completeopt+=noinsert

        " Navigate suggestion list with Tab and Shift-Tab.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    endif

    " Flow syntax highlighting
    let g:javascript_plugin_flow = 1

    " Add JSX syntax highlighting to .js files
    let g:jsx_ext_required = 0

    " Rust language
    let g:rustfmt_autosave = 1
    let g:ycm_rust_src_path = '/Users/sarah/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'

    " Dispatch
    if isdirectory(expand("~/.vim/bundle/vim-dispatch"))
        augroup Dispatch
            autocmd!
            autocmd FileType java let b:dispatch = 'javac %'
            autocmd FileType rust let b:dispatch = 'cargo run'
            autocmd FileType python let b:dispatch = 'python %'
            autocmd FileType racket,scheme let b:dispatch = 'racket %'
            autocmd FileType javascript let b:dispatch = 'yarn build'
        augroup END

        " Map :Dispatch
        nnoremap <leader>b :Dispatch!<CR>
    endif

    " AutoPairs
    if isdirectory(expand('~/.vim/bundle/auto-pairs'))
        let g:AutoPairs = { '(':')', '[':']', '{':'}', "'":"'",'"':'"', '`':'`',
            \ } " '$': '$' }

        augroup AutoPairs
            autocmd!
            autocmd FileType rust,racket,scheme let b:AutoPairs = { '(':')', '[':']', '{':'}', '"':'"', '`':'`', }
        augroup END
    endif

    " vim-surround
    if isdirectory(expand('~/.vim/bundle/vim-surround'))
        let g:surround_33 = "```\r```"
    endif

    " NERDTree
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        let NERDTreeShowHidden=1
        let NERDTreeIgnore=[
            \ '\.DS_Store',
            \ '\.py[cd]$',
            \ '\~$', '\.swo$',
            \ '\.swp$',
            \ '^\.git$',
            \ '^\.hg$',
            \ '^\.svn$',
            \ '\.bzr$',
            \ 'node_modules',
            \ 'perseus\/\.\+\.css$'
            \ ]
        let NERDTreeMouseMode=2  " Single click to open directories
        let NERDTreeChDirMode=2  " cwd when NERDTree root changes
        nmap <leader>e :NERDTreeToggle<CR>
    endif

    " Tabularize
    vmap <Leader>aa :!column -t<CR>
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

    " ALE
    if isdirectory(expand('~/.vim/bundle/ale'))
        " let g:ale_lint_on_text_changed = 'never'
        " let g:ale_linters = {
        " \   'javascript': ['eslint'],
        " \}

        nmap <silent> [e <Plug>(ale_previous_wrap)
        nmap <silent> ]e <Plug>(ale_next_wrap)
        nnoremap <Leader>] :ALEGoToDefinition<CR>
        nnoremap <Leader>[ :ALEHover<CR>

        let g:ale_completion_enabled = 1
        set completeopt-=noinsert

        let g:ale_fix_on_save = 1
        let g:ale_fixers = {
            \ 'javascript': ['prettier', 'eslint', 'tslint'],
            \ 'typescript': ['prettier', 'eslint', 'tslint']
            \ }
    endif

"     " Syntastic
    if isdirectory(expand('~/.vim/bundle/syntastic'))
        " set statusline+=%#warningmsg#
        " set statusline+=%{SyntasticStatuslineFlag()}
        " set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    endif

    " Lightline
    if isdirectory(expand('~/.vim/bundle/lightline.vim'))
        let g:lightline#bufferline#show_number = 1
        let g:lightline#bufferline#shorten_path = 1
        let g:lightline#bufferline#unnamed = '[No Name]'
        let g:lightline = {
                    \ 'colorscheme': 'powerline',
                    \ 'tabline': { 'left': [['buffers']], 'right': [['close']] },
                    \ 'component_expand': {'buffers': 'lightline#bufferline#buffers'},
                    \ 'component_type': {'buffers': 'tabsel'},
                    \ 'separator': { 'left': '', 'right': '' },
                    \ 'subseparator': { 'left': '', 'right': '' }
                    \ }
    endif

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
        let g:airline_extensions = []
        " let g:airline_extensions = ['tabline']
    endif

    " fzf
    if isdirectory(expand('~/.vim/bundle/fzf.vim'))
        " Similarly, we can apply it to fzf#vim#grep. 
        command! -bang -nargs=* Rg
                    \ call fzf#vim#grep(
          \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
          \   <bang>0 ? fzf#vim#with_preview('up:60%')
          \           : fzf#vim#with_preview('right:50%:hidden', '?'),
          \   <bang>0)

        " Open files in current git repo
        nnoremap <leader>p :GFiles<cr>

        " Open files in cwd
        nnoremap <leader>o :Files<cr>
    endif

    " Language client
    if isdirectory(expand('~/.vim/bundle/LanguageClient-neovim'))
        " Required for operations modifying multiple buffers like rename.
        set hidden

        let g:LanguageClient_serverCommands = {
                    \ 'reason': ['ocaml-language-server', '--stdio'],
                    \ 'ocaml': ['ocaml-language-server', '--stdio'],
                    \ }

        nnoremap <F5> :call LanguageClient_contextMenu()<CR>
        " Or map each action separately
        nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
        nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    endif

    " Commentary
    if isdirectory(expand('~/.vim/bundle/vim-commentary'))
        augroup CommentStrings
            autocmd!
            autocmd FileType ocaml setlocal commentstring=#\ %s
            autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
        augroup END
    endif

    " Prettier
    if isdirectory(expand('~/.vim/bundle/vim-prettier'))
        " Personal config
        " let g:prettier#config#bracket_spacing = 'true'
        " let g:prettier#config#jsx_bracket_same_line = 'false'

        " Format all files on save.
        let g:prettier#autoformat = 0
        augroup Prettier
            autocmd!
            autocmd BufWritePre *.js,*.css,*.scss,*.less,*.graphql PrettierAsync
        augroup END

        " Use Prettier (not vim-prettier) defaults, except for KA specific ones.
        " https://github.com/prettier/vim-prettier#overwrite-default-prettier-configuration
        let g:prettier#config#tab_width = 4
        let g:prettier#config#bracket_spacing = 'false'
        let g:prettier#config#jsx_bracket_same_line = 'false'
        let g:prettier#config#trailing_comma = 'all'
        let g:prettier#config#single_quote = 'false'
        let g:prettier#config#config_precedence = 'file-override'
    endif


    if isdirectory(expand('~/.vim/bundle/haskell-vim'))
      let g:haskell_indent_where = 4
      let g:haskell_indent_guard = 2
    endif

    " JSON
    set conceallevel=0
    let g:vim_json_syntax_conceal = 0

    " vim-markdown-preview
    if isdirectory(expand('~/.vim/bundle/vim-markdown-preview'))
      " let vim_markdown_preview_github=1
      let vim_markdown_preview_pandoc=1

      " Disregard images and preview on :w
      " let vim_markdown_preview_toggle=3

      " Render images automatically on buffer write
      let vim_markdown_preview_toggle=2
    endif