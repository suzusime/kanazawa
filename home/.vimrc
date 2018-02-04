"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = $HOME . '/.vim/bundles'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Required:
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('nanotech/jellybeans.vim')
  call dein#add('lervag/vimtex')
  call dein#add('thinca/vim-quickrun')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


"最下行にルーラー
set ruler
"エンコードはutf-8
set encoding=utf-8
"行番号を表示
set number
"検索語を強調表示
set hlsearch
"デフォルトでC風のインデント
set cindent
"入力中のコマンドを表示
set showcmd
"バックスペースを良い感じにする
set backspace=indent,eol,start
"色の設定
set background=dark
colorscheme jellybeans
"<C-L>で検索後の強調表示を解除する
nnoremap <C-L> :nohlo<CR><C-L>
"ステータスラインを常に表示する
set laststatus=2
"移動コマンドで行頭に移動しない
set nostartofline
"コマンドライン補完を便利に
set wildmenu
"タブ文字を4文字分の幅で表示する。
set shiftwidth=4
set tabstop=4
"ステータスラインに表示する情報
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" TeXの形式をデフォルトでLaTeXと認識する
let g:tex_flavor='latex'
" Leaderキーをスペースにする
let mapleader = "\<Space>"
" vim-quickrun の初期設定
let g:quickrun_config = {}
" vim-tex の設定
let g:vimtex_view_general_viewer = 'open'
let g:vimtex_compiler_latexmk = {'callback' : 0}

"挿入モード時、ステータスラインの色を変更する。
"https://sites.google.com/site/fudist/Home/vim-nihongo-ban/vim-color
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=lightmagenta cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction
function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction
"ここまで

