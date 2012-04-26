filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" プラグインのインストール"
"コードやテキストを保管できるプラグイン
Bundle 'Shougo/neocomplcache'
""何らかの情報ソースを入力し、それを元にインクリメンタルに候補を絞って実行させる事の出来るプラグイン。
Bundle 'Shougo/unite.vim'
"rubyのリファレンスを引っ張れる（Shift-k）で呼び出せる
Bundle 'thinca/vim-ref'
"編集中のファイルを開いたまま実行できるプラグイン
Bundle 'thinca/vim-quickrun'
"vimのbundleメモ
Bundle 'unite.vim'
""vim上でshellを実行できるプラグイン
Bundle 'Shougo/vimshell.git'
" vimproc : vimから非同期実行。vimshelleで必要
 Bundle 'Shougo/vimproc.git'
" NERDTree : ツリー型エクスプローラ
"編集中のファイルを開いたまま実行できるプラグイン
Bundle 'The-NERD-tree'
" " 自動閉じタグ
"rubyのリファレンスを引っ張れる（Shift-k）で呼び出せる
Bundle 'thinca/vim-ref'
"カッコやシングル、ダブルクォートの左側を入力すると自動的にもう片方を補ってくれる
 Bundle 'AutoClose'
"Bundle 'Townk/vim-autoclose.vim'
"ファイラー
Bundle 'Shougo/vimfiler'
"ビジュアルモードで選択した範囲をコメント化してくれる
Bundle 'EnhCommentify.vim'
"ステータスラインをかっこ良くする
Bundle 'Lokaltog/vim-powerline'
"選択した単語をハイライトしてくれるプラグイン。vimrcに設定が必要
Bundle 'quickhl.vim'
"vimでrubyを扱う際の最も基本的な拡張機能
Bundle 'vim-ruby/vim-ruby'
":Rcontroller コントローラ名とかするだけでコントローラのソースを表示してくれたり、vim上からrailsコマンドを実行できたりする
Bundle 'rails.vim'
" filetype plugin indent on     " required!

"ビープ音を消す
set vb t_vb=
"新しい行のインデントを現在行と同じにする
set autoindent
"Vi互換をオフ
set nocompatible
"タブの代わりに空白文字を挿入する
set expandtab
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
set list
"listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
 "新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の  が対応する空白の数
set tabstop=4
"カーソル行をハイライト
set cursorline
"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END
"日本語入力をリセット
au BufNewFile,BufRead * set iminsert=0
"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

"powerline用設定
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\

"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/ /ge

"neocomplcache用の設定
function InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
   elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
   else
    return "\<c-x>\<c-o>"
   endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
