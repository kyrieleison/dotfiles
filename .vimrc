" --------------------------------
" NeoBundle 設定
" --------------------------------
if 0 | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:

" 統合ユーザインタフェース
" NeoBundle 'Shougo/unite.vim'

" 入力補完機能
" NeoBundle 'Shougo/neocomplete'

" neocomplete {{{
" let g:neocomplete#enable_at_startup = 1
" }}}

" 非同期処理の高速化
" NeoBundle 'Shougo/vimproc', {
"   \ 'build' : {
"   \     'windows' : 'make -f make_mingw32.mak',
"   \     'cygwin' : 'make -f make_cygwin.mak',
"   \     'mac' : 'make -f make_mac.mak',
"   \     'unix' : 'make -f make_unix.mak',
"   \    },
"   \ }

" バッファ拡張
"
" <Leader>be or :BufExplorer で開く
" その他の使い方は :help BufExplorer を参照する
NeoBundle 'jlanzarotta/bufexplorer'

" bufexplorer {{{
let g:bufExplorerShowRelativePath = 1  " 相対パスを開く
" }}}

" マークダウンプレビュー
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" vim-markdown {{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
" }}}

" シンタックス
" html5
NeoBundle 'othree/html5.vim'
" css3
NeoBundle 'hail2u/vim-css3-syntax'
" javascript
NeoBundle 'othree/es.next.syntax.vim'
NeoBundle 'othree/yajs.vim'
NeoBundle 'isRuslan/vim-es6'
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'einars/js-beautify'
" nodejs
NeoBundle 'moll/vim-node'
" jsx
NeoBundle 'mxw/vim-jsx'
" solidity
NeoBundle 'tomlion/vim-solidity'
" vue
NeoBundle 'posva/vim-vue'
NeoBundle 'leafOfTree/vim-vue-plugin'

" vim-jsx {{{
let g:jsx_ext_required = 0
" }}}

" カラースキーマ
NeoBundle 'w0ng/vim-hybrid'

" ステータスライン拡張
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'cocopon/lightline-hybrid.vim'

" lightline {{{
let g:lightline = {}
let g:lightline.colorscheme = 'hybrid'
" }}}

" コメントアウトON/OFF
NeoBundle 'tomtom/tcomment_vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" --------------------------------
" 基本設定
" --------------------------------

syntax on

set number
set ruler
set list
set incsearch
set hlsearch
set wrap
set showmatch
set showmode
set wildmenu
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=50
set helplang=en
set mouse=a
set backspace=indent,eol,start
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp,latin1
set fileformats=unix,dos,mac
set formatoptions+=mM
set ambiwidth=double
set display+=lastline
set clipboard=unnamed,autoselect
set nobackup
set noswapfile
set t_Co=256

" ステータスライン設定
set laststatus=2

" カラースキーマ設定
set background=dark
au ColorScheme * highlight LineNr ctermfg=241
colorscheme hybrid

" シンタックスハイライト設定
au BufRead,BufNewFile *.md\|txt    set filetype=markdown
au BufRead,BufNewFile *.erb        set filetype=eruby.html
au BufRead,BufNewFile *.sass\|scss set filetype=sass
au BufRead,BufNewFile *.ts         set filetype=typescript
au BufRead,BufNewFile *.sol        set filetype=solidity
au BufRead,BufNewFile *.vue        set filetype=html.css

" インデント設定
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

au FileType vue        syntax sync fromstart
au FileType html       setlocal sw=2 ts=2 sts=2 et
au FileType css        setlocal sw=2 ts=2 sts=2 et
au FileType javascript setlocal sw=2 ts=2 sts=2 et
au FileType typescript setlocal sw=2 ts=2 sts=2 et
au FileType markdown   setlocal sw=2 ts=2 sts=2 et
au FileType ruby       setlocal sw=2 ts=2 sts=2 et
au FileType less,sass  setlocal sw=2 ts=2 sts=2 et
au FileType solidity   setlocal sw=4 ts=4 sts=4 et

" キーマップ設定

" Leaderを\から,に置き換え
let mapleader = ","
noremap \ ,

" 表示行移動入れ替え
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" コマンドラインウインドウ表示入れ替え
nnoremap qq: <CR>q:
nnoremap qq/ <CR>q/
nnoremap q: <NOP>
nnoremap q/ <NOP>
nnoremap q? <NOP>

" 画面分割操作

" sを無効化
nnoremap s <Nop>

" カレントウインドウの水平分割(:split)
nnoremap ss :<C-u>sp<CR>
" カレントウインドウの垂直分割(:vsplit)
nnoremap sv :<C-u>vs<CR>

" 分割ウインドウ間の移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w

" 分割ウインドウの位置移動
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sr <C-w>r

" カレントウインドウのサイズ変更
nnoremap s= <C-w>=
nnoremap so <C-w>_<C-w>|

" ファイル移動
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>

" 新規タブ作成
nnoremap st :<C-u>tabnew<CR>
" 次のタブに切り替え
nnoremap sn gt
" 前のタブに切り替え
nnoremap sp gT

" カレントウインドウを閉じる(:close)
nnoremap sq :<C-u>q<CR>
" バッファを閉じる
" nnoremap sQ :<C-u>bd<CR>

" タブ一覧
" nnoremap sT :<C-u>Unite tab<CR>
" 現在のタブで開いたバッファ一覧
" nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
" バッファ一覧
" nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>

" alias :e %:h -> :e %%
cnoremap <expr> %% getcmdtype() == ':' ? expand('%: h').'/' : '%%'

" alias :Explore -> :E
command! E Explore
