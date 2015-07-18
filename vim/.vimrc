"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

"---------------------------------------------------------------------------
" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=4
" タブをスペースに展開しない (expandtab:展開する)
set expandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" オートインデント時にインデントする文字数
set shiftwidth=4
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
"スペルチェックを有効にする(ただし日本語は除外する)
"set spelllang+=cjk
"set spell 
"
" 80行で自動折り返し
set textwidth=80


" コピーした文字列を自動的にクリップボードに入れる
set clipboard=unnamed
set clipboard=unnamed,autoselect
"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
" 長い行を折り返して表示 (nowrap:折り返さない)
set nowrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 画面を黒地に白にする (次行の先頭の " を削除すれば有効になる)
"colorscheme evening " (Windows用gvim使用時はgvimrcを編集すること)

" 構文ごとに色分け表示する
" 逆は [ syntax off ]
syntax on

" コメントの色を緑色にする
hi Comment ctermfg=2

" ステータス行に、文字コードと改行コードを表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"---------------------------------------------------------------------------
" ファイル操作に関する設定:
"
" バックアップファイルを作成しない (次行の先頭の " を削除すれば有効になる)
set nobackup
" undo ファイルを一箇所に纏める
set undodir=~/.vim/undo


" -----------------------------------------------------------------------------
"   neobundle
" -----------------------------------------------------------------------------
set nocompatible               " Be iMproved

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
set runtimepath+=~/.vim/bundle/vimproc/
if has('mac')
  " let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/proc.so'
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
endif


call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'shougo/vimproc', {
\ 'build' : {
\ 'windows' : 'make -f make_mingw32.mak',
\ 'cygwin' : 'make -f make_cygwin.mak',
\ 'mac' : 'make -f make_mac.mak',
\ 'unix' : 'make -f make_unix.mak',
\   },
\ }


filetype plugin indent on     " Required!

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" GitHubリポジトリにあるプラグインを利用する
" " --> NeoBundle 'USER/REPOSITORY-NAME'
" NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'thinca/vim-quickrun'
NeoBundle 'davidoc/taskpaper.vim'
" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'othree/html5.vim'
NeoBundle 'Rykka/clickable.vim'

NeoBundle 'scrooloose/syntastic.git'
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" "GitHub以外のGitリポジトリにあるプラグインを利用する
" NeoBundle 'git://git.wincent.com/command-t.git'
"
" " vim-scripts リポジトリにあるプラグインを利用する
" NeoBundle 'surround.vim'
NeoBundle 'Shougo/neobundle-vim-scripts'
NeoBundle 'riv.vim'
NeoBundle 'vim-scripts/Align'


" "Git以外のリポジトリにあるプラグインを利用する
" NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
" NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'

" markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'


call neobundle#end()
" -----------------------------------------------------------------------------
" Align
" -----------------------------------------------------------------------------
" Alignを日本語環境で使用するための設定
:let g:Align_xstrlen = 3

