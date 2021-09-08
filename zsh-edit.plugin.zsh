#!/bin/zsh
setopt autopushd pushdminus
zmodload zsh/complist

zsh-edit() {
  emulate -L zsh
  typeset -gHa _edit_opts=( extendedglob NO_listbeep NO_shortloops warncreateglobal )
  setopt $_edit_opts

  local dir=${${(%):-%x}:A:h}
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
  }

  bindkey  '^?' backward-delete-char  '^[[3~' delete-char

  .edit.bind backward-subword         '^[b'   '^[[1;5D'
  .edit.bind backward-shell-word      '^[^B'  '^[[1;3D' '^[^[[D'  '^[^[OD'
  .edit.bind forward-subword          '^[f'   '^[[1;5C'
  .edit.bind forward-shell-word       '^[^F'  '^[[1;3C' '^[^[[C'  '^[^[OC'
  .edit.bind backward-kill-subword    '^[^H'  '^H'      '^[[27;5;8~'
  .edit.bind backward-kill-shell-word '^W'    '^[^?'    '^[[27;3;8~'
  .edit.bind kill-subword             '^[d'   '^[[3;5~'
  .edit.bind kill-shell-word          '^[^D'  '^[[3;3~' '^[^[[3~'
  .edit.bind beginning-of-line        '^A'    '^[[H'    '^[OH'
  .edit.bind end-of-line              '^E'    '^[[F'    '^[OF'
  .edit.bind kill-line                '^K'    '^[[1;2F' '^[O2F'
  .edit.bind backward-kill-line       '^U'    '^[[1;2H' '^[O2H'
  .edit.bind end-of-buffer            '^[>'   '^[[1;5F' '^[O5F'
  .edit.bind beginning-of-buffer      '^[<'   '^[[1;5H' '^[O5H'

  unfunction .edit.bind

  bindkey -M emacs  '^[e' redo  '^[Y' reverse-yank-pop

  bind                  '^[-' 'pushd -1'      '^[=' 'pushd +0'
  bindkey -M menuselect '^[-' menu-complete   '^[=' reverse-menu-complete

  zle -N dirstack-minus .edit.dirstack
  zle -N dirstack-plus  .edit.dirstack
  bindkey                   '^[_' dirstack-minus  '^[+' dirstack-plus
  bindkey -M menuselect -s  '^[_' '^G^_^[_'       '^[+' '^G^_^[+'
}

{
  zsh-edit "$@"
} always {
  unfunction zsh-edit
}
