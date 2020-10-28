" Environment {
    " Basic {
        set nocompatible
    " }
    
    " Windows Compatible {
        " set termencoding=cp850
        set termencoding=utf-8
        set encoding=utf-8
        setglobal fileencoding=utf-8
        set fileencodings=ucs-bom,utf-8,utf-16le,cp1252,iso-8859-15
        
    " }
    
    " Setup Vundle Support {
        filetype off
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    " }
    
    " {
        set shortmess=a
        set cmdheight=2
    " }
" }

" Vundles {
    
    " Deps {
        Plugin 'VundleVim/Vundle.vim'
    " }

    " General {
        
        Plugin 'scrooloose/nerdtree'
        Plugin 'jistr/vim-nerdtree-tabs'
        Plugin 'flazz/vim-colorschemes'
        Plugin 'altercation/vim-colors-solarized'
        Plugin 'tpope/vim-surround'
        Plugin 'kien/ctrlp.vim'
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'easymotion/vim-easymotion'
        Plugin 'terryma/vim-multiple-cursors'
        Plugin 'jiangmiao/auto-pairs'
        Plugin 'hynek/vim-python-pep8-indent'
        Plugin 'nvie/vim-flake8'
        Plugin 'fatih/vim-go'

        Plugin 'EasyGrep'
    " }

    " General Programming {
        Plugin 'scrooloose/syntastic'
        Plugin 'scrooloose/nerdcommenter'
        if executable('ctags')
            Plugin 'majutsushi/tagbar'
        endif

        " format javascript
        Plugin 'pangloss/vim-javascript'
    " }

    " Snippets & Autocomplete {
        "Plugin 'Valloric/YouCompleteMe'
        Plugin 'SirVer/ultisnips'
        
    " }
" }

call vundle#end()
filetype plugin indent on

" General {
    set background=dark

    syntax on
	"set mouse=a
    set mousehide

	set history=1000
	set backup

    set t_Co=256
" }

" Vim UI {
    if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        color solarized             " Load a colorscheme
    endif 

	set tabpagemax=15
	set showmode
	set cursorline
	set backspace=indent,eol,start
	set linespace=0
	set nu
	set showmatch
	set incsearch
	set hlsearch
	set ignorecase
	set smartcase
	set wildmenu
	set whichwrap=b,s,h,l,<,>,[,]
	set scrolljump=5
	set scrolloff=3
	set foldenable

" }

" Formatting {
	set nowrap
	set autoindent
	set tabstop=4
	set expandtab
    set smarttab
	set shiftwidth=4
	set softtabstop=4
	set nojoinspaces
	set splitright
	set splitbelow

    autocmd FileType javascript,python,yml,go autocmd BufWritePre <buffer> call StripTrailingWhitespace()

" }

" Key (re)Mappings {
	let mapleader = ','	
	let maplocalleader = '_'

	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>j<C-W>_
	map <C-H> <C-W>j<C-W>_

    noremap j gj
    noremap k gk


" Plugins {
    
    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " } 
    
    " NerdTree {
        if isdirectory(expand("~/.vim/bundle/nerdtree"))
            map <C-e> <plug>NERDTreeTabsToggle<CR>
            map <leader>e :NERDTreeFind<CR>
            nmap <leader>nt :NERDTreeFind<CR>

            let NERDTreeShowBookmarks=1
            let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$', '\.gitignore$', '__pycache__']
            let NERDTreeChDirMode=0
            " let NERDTreeQuitOnOpen=1
            let NERDTreeMouseMode=2
            let NERDTreeShowHidden=1
            let NERDTreeKeepTreeInNewTab=1
            let g:nerdtree_tabs_open_on_gui_startup=0
            let g:nerdtree_tabs_open_on_console_startup=1
            let g:nerdtree_tabs_focus_on_files = 1
        endif
    " }    
    
    " easymotion {
        if isdirectory(expand("~/.vim/bundle/vim-easymotion")) 
            let g:EasyMotion_smartcase = 1
            map <Leader><leader>h <Plug>(easymotion-linebackward)
            map <Leader><Leader>j <Plug>(easymotion-j)
            map <Leader><Leader>k <Plug>(easymotion-k)
            map <Leader><leader>l <Plug>(easymotion-lineforward)
            " 重复上一次操作, 类似repeat插件, 很强大
            map <Leader><leader>. <Plug>(easymotion-repeat)
        endif 
    " }

    " ctrlp {
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
            let g:ctrlp_working_path_mode = 'ra'
            nnoremap <silent> <D-t> :CtrlP<CR>
            nnoremap <silent> <D-r> :CtrlPMRU<CR>
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif
            if exists("g:ctrlp_user_command")
                unlet g:ctrlp_user_command
            endif
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }
        endif 
    " }

    " TagBar {
        if isdirectory(expand("~/.vim/bundle/tagbar/"))
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
        endif
    "}


    " YouCompleteMe {
        if isdirectory(expand("~/.vim/bundle/YouCompleteMe/"))
            nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
            nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
            nnoremap <leader>gt :YcmCompleter GoTo<CR>

            let g:acp_enableAtStartup = 0

            " enable completion from tags
            let g:ycm_collect_identifiers_from_tags_files = 1

            " remap Ultisnips for compatibility for YCM
            let g:UltiSnipsExpandTrigger = '<C-j>'
            let g:UltiSnipsJumpForwardTrigger = '<C-j>'
            let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
            let g:UltiSnipsEditSplit="vertical"

            " Enable omni completion.
            autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
            autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
            autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
            autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
            autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
            autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
            autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

            " Haskell post write lint and check with ghcmod
            " $ `cabal install ghcmod` if missing and ensure
            " ~/.cabal/bin is in your $PATH.
            if !executable("ghcmod")
                autocmd BufWritePost *.hs GhcModCheckAndLintAsync
            endif

            " For snippet_complete marker.
            if !exists("g:spf13_no_conceal")
                if has('conceal')
                    set conceallevel=2 concealcursor=i
                endif
            endif

            " Disable the neosnippet preview candidate window
            " When enabled, there can be too much visual noise
            " especially when splits are used.
            set completeopt-=preview
        endif
    " }

    " vim-flake8 {
    " }
    "
    
    " vim-airline {
        " Set configuration options for the statusline plugin vim-airline.
        " Use the powerline theme and optionally enable powerline symbols.
        " To use the symbols , , , , , , and .in the statusline
        " segments add the following to your .vimrc.before.local file:
        "   let g:airline_powerline_fonts=1
        " If the previous symbols do not render for you then install a
        " powerline enabled font.

        " See `:echo g:airline_theme_map` for some more choices
        " Default in terminal vim is 'dark'
        if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
            if !exists('g:airline_theme')
                let g:airline_theme = 'solarized'
            endif
            if !exists('g:airline_powerline_fonts')
                " Use the default set of separators with a few customizations
                let g:airline_left_sep='›'  " Slightly fancier than '>'
                let g:airline_right_sep='‹' " Slightly fancier than '<'
            endif
        endif
    " }

" }

" Functions {
    
    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        let common_dir = parent . '/.' . prefix


        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if !isdirectory(directory)
                call mkdir(directory)
            endif
            if isdirectory(directory)
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

" }

" }
