#!/bin/zsh
setopt autopushd pushdminus
zmodload zsh/complist

zsh-edit() {
  emulate -L zsh
  typeset -gHa _edit_opts=( extendedglob NO_listbeep NO_shortloops warncreateglobal )
  setopt $_edit_opts

  local dir=${${(%):-%x}:P:h}
  local fdir=$dir/functions
  typeset -gU FPATH fpath=( $dir $fpath )
  autoload -Uz $fdir/bind $fdir/[._]edit.*~*.zwc(DN)

  .beginning-of-buffer() {
    CURSOR=0
  }
  .end-of-buffer() {
    CURSOR=$#BUFFER
  }
  zle -N {,.}beginning-of-buffer
  zle -N {,.}end-of-buffer

  local widget
  for widget in yank yank-pop reverse-yank-pop vi-put-before vi-put-after; do
    zle -N $widget .edit.visual-yank
  done
  for widget in {{back,for}ward,{backward-,}kill}-{sub,shell-}word; do
    zle -N "$widget" .edit.subword
  done

  [[ -v ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS ]] ||
    typeset -gHa ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=()
  ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(
      backward-subword backward-shell-word forward-subword forward-shell-word
  )

  .edit.bind() {
    local widget=$1 emacs=$2
    shift 2
    bindkey -M emacs "$emacs" "$widget"
    bindkey "${@:^^widget}"
    widget=.$widget
    bindkey -M menuselect "${@:^^widget}"
  }

  .edit.bind backward-subword         '^[b'   '^[^['{\[,O}D   '^['{'[1;',\[,O}{3,5}D
  .edit.bind backward-shell-word      '^[^B'  '^[^['{\[,O}A   '^['{'[1;',\[,O}{3,5}A
  .edit.bind forward-subword          '^[f'   '^[^['{\[,O}C   '^['{'[1;',\[,O}{3,5}C
  .edit.bind forward-shell-word       '^[^F'  '^[^['{\[,O}B   '^['{'[1;',\[,O}{3,5}B
  .edit.bind backward-kill-subword    '^[^?'  '^[^?'  '^H'  '^[[27;'{3,5}';8~'
  .edit.bind backward-kill-shell-word '^W'    '^[^H'        '^[[27;'{6,7}';8~'
  bindkey '^[[3~' delete-char
  .edit.bind kill-subword             '^[d'   '^[(' '^[^[[3~'   '^[[3;'{3,5}\~
  .edit.bind kill-shell-word          '^[^D'        '^[^[[3;5~' '^[[3;'{6,7}\~
  .edit.bind beginning-of-line        '^A'    '^['{\[,O}H
  .edit.bind end-of-line              '^E'    '^['{\[,O}F
  .edit.bind beginning-of-buffer      '^[<'   '^['{'[1;',\[,O}5H  '^[[5~'
  .edit.bind end-of-buffer            '^[>'   '^['{'[1;',\[,O}5F  '^[[6~'
  .edit.bind backward-kill-line       '^U'    '^['{'[1;',\[,O}2H  '^['{'[1;',\[,O}2D
  .edit.bind kill-line                '^K'    '^['{'[1;',\[,O}2F  '^['{'[1;',\[,O}2C

  unfunction .edit.bind

  bindkey -M emacs  '^[/' redo  '^[Y' reverse-yank-pop

  bind    -M emacs      '^[:' 'cd ..'
  bind    -M emacs      '^[-' 'pushd -1'      '^[=' 'pushd +0'
  bindkey -M menuselect '^[-' menu-complete   '^[=' reverse-menu-complete

  zle -N dirstack-minus .edit.dirstack
  zle -N dirstack-plus  .edit.dirstack
  bindkey -M emacs          '^[_' dirstack-minus  '^[+' dirstack-plus
  bindkey -M menuselect -s  '^[_' '^G^_^[_'       '^[+' '^G^_^[+'
}

{
  zsh-edit "$@"
} always {
  unfunction zsh-edit
}
