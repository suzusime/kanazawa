#自動補完
autoload -U compinit
compinit

#言語設定
export LANG=ja_JP.UTF-8

#エディタ
export EDITOR=vim

###プロンプトの設定
# %Dは日付
local p_status="(%{%B%F{white}%(?.%K{green}.%K{red})%}%?%{%k%f%b%})"
local p_info=$'\n'"+--%B%F{yellow}%n@%m%f%b(%y)-$p_status %D{%m/%d %H:%M:%S}--+"$'\n'
local p_cdir="[%~]"$'\n'
local p_hist="%h%(1j,(%j),)"
local p_mark="%B%(!,#,$)%b"
PROMPT="$p_info$p_cdir$p_hist $p_mark "
RPROMPT="$p_info$p_cdir$p_hist $p_mark "

#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # 複製コマンドを無視
setopt share_history        # コマンド履歴を共有

#フォルダ履歴（cd のあとにTabで表示）
setopt autopushd

## 全てのユーザのログイン・ログアウトを監視する。
#watch="all"
## ログイン時にはすぐに表示する。
#log

## ^Dでログアウトしないようにする。
setopt ignore_eof

##ターミナルでは日本語にしない
case "${TERM}" in
linux)
    export LANG=C
    ;;
xterm)
    export LANG=ja_JP.UTF-8
    ;;
esac

##色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

### 命令自動変換（エイリアス）
alias ls="ls -F --color=auto" #lsでディレクトリを区別する。あと色をつける。
alias less="less -R" #色付きの文字をきちんと扱う
alias g="git"

#consolemd
alias md="consolemd -s monokai"
function mdl(){
	consolemd $1 | less -R
}

### パスの設定
# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

### ローカル設定ファイルの読み込み
if [ -f ~/.zshlocal ]; then
    source ~/.zshlocal
fi
