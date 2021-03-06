" Vundle
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'  " required

    " UI extensions
    Plugin 'w0rp/ale'
    if has('nvim') && has('python3')
        " Deoplete requires Python 3.
        Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    endif
    Plugin 'scrooloose/nerdtree'
    Plugin 'itchyny/lightline.vim'
    Plugin 'mgee/lightline-bufferline'
    Plugin 'tpope/vim-fugitive'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'christoomey/vim-tmux-navigator'

    Plugin 'sarahlim/wild-cherry-vim'
    Plugin 'ayu-theme/ayu-vim'
    Plugin 'sarahlim/vim'

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
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'octol/vim-cpp-enhanced-highlight'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'neovimhaskell/haskell-vim'
    Plugin 'itchyny/vim-haskell-indent'
    Plugin 'parsonsmatt/intero-neovim'
    Plugin 'pangloss/vim-javascript'
    Plugin 'elzr/vim-json'
    Plugin 'neoclide/vim-jsx-improve'
    Plugin 'Chandlercjy/vim-markdown-edit-code-block', {'for':'markdown'}
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'
    Plugin 'prettier/vim-prettier', { 'do': 'npm install' }
    Plugin 'digitaltoad/vim-pug'
    Plugin 'wlangstroth/vim-racket'
    Plugin 'reasonml-editor/vim-reason-plus'
    Plugin 'rust-lang/rust.vim'
    Plugin 'leafgarland/typescript-vim'
    Plugin 'lervag/vimtex'
    Plugin 'rhysd/vim-wasm'

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
    set autoindent      " Auto indent
    set expandtab       " Use spaces instead of tabs
    set smarttab        " Be smart when using tabs
    set shiftwidth=4    " 1 tab == 4 spaces
    set softtabstop=4
    set tabstop=4
    set linebreak       " Linebreak on 500 chars
    set textwidth=500

    " Auto detect filetypes
    filetype plugin indent on

    augroup SyntaxSettings
        autocmd!
        autocmd BufNewFile,BufRead *.coffee set filetype=coffee
        autocmd BufNewFile,BufRead *.yml,*.yaml set filetype=yaml
        autocmd BufNewFile,BufRead *.eslintrc,*.babelrc set filetype=json
        autocmd BufNewFile,BufRead *.tsx set filetype=typescript
        autocmd BufNewFile,BufRead *.mdown,*.md set syntax=pandoc
    augroup END

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

    " Stop automatically inserting new comment leaders.
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

    " List syntax highlight groups under cursor
    nnoremap <leader>sp :call <SID>SynStack()<CR>
    function! <SID>SynStack()
      if !exists("*synstack")
        return
      endif
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc

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

    " Remove | char from vertical splits
    set fillchars+=vert:\ 

    " Color schemes
    augroup RainbowColors
        autocmd!
        autocmd ColorScheme * highlight GitGutterAddDefault    guifg=#a7da1e guibg=#0a0b0c
        autocmd ColorScheme * highlight GitGutterChangeDefault guifg=#f7b83d guibg=#0a0b0c
        autocmd ColorScheme * highlight GitGutterDeleteDefault guifg=#e61f44 guibg=#0a0b0c
        autocmd ColorScheme * highlight SignColumn             guibg=#0a0b0c
    augroup END
    colorscheme rainbow-contrast

    " if isdirectory(expand('~/.vim/bundle/ayu-vim'))
    "     let ayucolor="mirage"
    "     augroup AyuColors
    "         autocmd!
    "         autocmd ColorScheme * highlight LineNr                  guibg=#272d38
    "         autocmd ColorScheme * highlight VertSplit               guibg=#272d38
    "         autocmd ColorScheme * highlight SignColumn              guibg=#272d38
    "         autocmd ColorScheme * highlight GitGutterAddDefault     guibg=#272d38
    "         autocmd ColorScheme * highlight GitGutterChangeDefault  guibg=#272d38
    "         autocmd ColorScheme * highlight GitGutterDeleteDefault  guibg=#272d38
    "         autocmd ColorScheme * highlight NERDTreeDir ctermfg=11 guifg=#FFCC66 guibg=#242B38
    "     augroup END
    " endif
    " colorscheme ayu

    " Make matched parens visually distinct from cursor
    highlight MatchParen gui=underline guifg=NONE guibg=NONE

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

" Mapping

    let mapleader=" "   " Leader key to space

    " Less lag on waiting for key delays
    set timeoutlen=500 ttimeoutlen=0

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

    " Toggle search highlighting on/off quickly
    noremap <silent> <leader>/ :set invhlsearch<CR>

    " Find merge conflict markers
    noremap <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

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
    nmap <leader>T :enew<CR>

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

    " Copy to system clipboard
    vnoremap <C-c> "*y

    " Very magic regexes
    nnoremap / /\v
    vnoremap / /\v
    cnoremap %s/ %smagic/
    cnoremap \>s/ \>smagic/
    nnoremap :g/ :g/\v
    nnoremap :g// :g//

    " Navigate splits
    nnoremap <c-j> :TmuxNavigateDown<cr>
    nnoremap <c-k> :TmuxNavigateUp<cr>
    nnoremap <c-h> :TmuxNavigateLeft<cr>
    nnoremap <c-l> :TmuxNavigateRight<cr>

    " Pull path into system clipboard
    command! Path let @* = expand("%")

" Plugins

    if isdirectory(expand('~/.vim/bundle/ale'))
        let g:ale_fix_on_save = 1
        let g:ale_fixers = {
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'haskell': ['brittany'],
            \ }

        let g:ale_completion_enabled = 1

        nmap <silent> [e   <Plug>(ale_previous_wrap)
        nmap <silent> ]e   <Plug>(ale_next_wrap)

        " These get remapped for FileTypes that don't have good ALE support.
        map <Leader>] <Plug>(ale_go_to_definition)
        map <Leader>[ <Plug>(ale_hover)

        augroup ALEHaskell
            autocmd!
            " Include src directory to avoid ghc "Ambiguous module" error.
            autocmd FileType haskell let b:ale_haskell_stack_ghc_options = ' -fno-code -v0'
                \ . '-i' . getcwd() . '/src'
        augroup END
    endif

    if isdirectory(expand('~/.vim/bundle/auto-pairs'))
        augroup AutoPairs
            autocmd!
            autocmd FileType latex,pandoc let b:AutoPairs = extend(g:AutoPairs, {'$': '$'})
            " Don't pair single quotes.
            autocmd FileType rust,racket,scheme let b:AutoPairs = {
                \ '(':')', 
                \ '[':']',
                \ '{':'}',
                \ '"':'"',
                \ '`':'`',
                \ }
        augroup END
    endif

    if isdirectory(expand('~/.vim/bundle/vim-commentary'))
        augroup CommentStrings
            autocmd!
            autocmd FileType ocaml setlocal commentstring=#\ %s
            autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
        augroup END
    endif

    if isdirectory(expand('~/.vim/bundle/cosco.vim'))
        augroup AppendSemicolon
            autocmd!
            autocmd FileType rust,c,cpp,ch,json,java,sass,javascript,css nmap <silent> <Leader>; <Plug>(cosco-commaOrSemiColon)
            autocmd FileType rust,c,cpp,ch,json,java,sass,javascript,css imap <silent> <Leader>; <c-o><Plug>(cosco-commaOrSemiColon)
        augroup END
    endif

    if isdirectory(expand('~/.vim/bundle/deoplete.nvim'))
        let g:deoplete#enable_at_startup = 1
        set completeopt-=noinsert

        " Navigate suggestion list with Tab and Shift-Tab.
        inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
        inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    endif

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

    if isdirectory(expand('~/.vim/bundle/fzf.vim'))
        " Apply defaults to fzf#vim#grep. 
        command! -bang -nargs=* Rg
          \ call fzf#vim#grep(
          \   'rg --column --vimgrep --color=always '.shellescape(<q-args>), 1,
          \   fzf#vim#with_preview('right:40%'),
          \   <bang>0)
        " command! -bang -nargs=* Rg
        "   \ call fzf#vim#grep(
        "   \   'rg --column --vimgrep --color=always '.shellescape(<q-args>), 1,
        "   \   <bang>0 ? fzf#vim#with_preview('up:60%')
        "   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        "   \   <bang>0)
        " Search files in current git repo
        nnoremap <leader>p :GFiles<cr>
        " Search files in cwd
        nnoremap <leader>o :Files<cr>
        " Search within files
        nnoremap <leader>f :Rg<cr>
        " Search commands
        nnoremap <leader>c :Commands<cr>
    endif

    if isdirectory(expand('~/.vim/bundle/vim-gitgutter'))
        let g:gitgutter_override_sign_column_highlight = 0
    endif

    if isdirectory(expand('~/.vim/bundle/haskell-vim'))
      let g:haskell_indent_where = 2
      let g:haskell_indent_guard = 2
    endif

    if isdirectory(expand('~/.vim/bundle/indentLine'))
        let g:indentLine_char = '┆'
        let g:indentLine_first_char = '┆'
        let g:indentLine_showFirstIndentLevel = 0
        let g:indentLine_color_term = 59
        let g:indentLine_color_gui = '#403545'
        let g:indentLine_conceallevel = 0
    endif

    if isdirectory(expand('~/.vim/bundle/intero-neovim'))
        let g:intero_window_size = 2  " Open a very small window

        " Toggle the Intero window open or closed, depending on whether it is
        " currently visible.
        " If the window needs to be opened, set its buffer to unlisted.
        function! <SID>InteroToggle()
            if intero#util#get_intero_window() == -1
                InteroOpen
                " Navigate to the new window.
                let l:window_id = intero#util#get_intero_window()
                execute l:window_id . "winc w"
                " Set the buffer to unlisted so it doesn't show up in the buflist.
                setlocal nobuflisted
                " Go back to split above.
                " NOTE: This is pretty brittle and specific to my configuration.
                " It depends on setting the Intero window to open vertically.
                execute "normal \<C-w>k"
                return
            else
                InteroHide
                return
            endif
        endfunc

        augroup InteroConfig
            autocmd!
            autocmd BufWritePost *.hs InteroReload
            autocmd FileType haskell map <buffer> <Leader>\ :call <SID>InteroToggle()<CR>
            autocmd FileType haskell map <buffer> <Leader>[ <Plug>InteroGenericType
            autocmd FileType haskell map <buffer> <Leader>] :InteroGoToDef<CR>
        augroup END
    endif

    if isdirectory(expand('~/.vim/bundle/vim-json'))
        let g:vim_json_syntax_conceal = 0
    endif

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

    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        let g:NERDTreeIgnore=[
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
        let g:NERDTreeShowHidden=1
        let g:NERDTreeMouseMode=2  " Single click to open directories
        let g:NERDTreeChDirMode=2  " cwd when NERDTree root changes
        nnoremap <leader>e :NERDTreeToggle<CR>
    endif

    if isdirectory(expand('~/.vim/bundle/vim-prettier'))
        " Format all files on save without requiring @format pragma.
        " let g:prettier#autoformat = 0
        " augroup Prettier
        "     autocmd!
        "     autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less,*.graphql PrettierAsync
        " augroup END

        let g:prettier#config#print_width = 100
        let g:prettier#config#tab_width = 4
        let g:prettier#config#semi = 'false'
        let g:prettier#config#single_quote = 'false'
        let g:prettier#config#bracket_spacing = 'true'
        let g:prettier#config#arrow_parens = 'avoid'
        let g:prettier#config#trailing_comma = 'all'
    endif

    if isdirectory(expand('~/.vim/bundle/vim-pandoc'))
        let g:pandoc#completion#bib#mode = 'citeproc'
        let g:pandoc#syntax#conceal#use = 0
        let g:pandoc#syntax#codeblocks#embeds#langs = [
            \ 'python',
            \ 'py=python',
            \ 'javascript',
            \ 'js=javascript',
            \ 'html',
            \ 'css',
            \ 'rkt=scheme',
            \ 'bash=sh'
            \ ]
    endif

    if isdirectory(expand('~/.vim/bundle/rust.vim'))
        let g:rustfmt_autosave = 1
    endif

    if isdirectory(expand('~/.vim/bundle/vim-surround'))
        let g:surround_33 = "```\r```"
    endif

    if isdirectory(expand('~/.vim/bundle/vimtex'))
        let g:tex_flavor = 'latex'
        let g:vimtex_complete_close_braces = 1
    endif

    if isdirectory(expand('~/.vim/bundle/vim-javascript'))
        let g:jsx_ext_required = 0
    endif
