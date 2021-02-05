#!/bin/zsh
() {
  emulate -L zsh
  typeset -gHa _edit_opts=( extendedglob NO_listbeep rcquotes warncreateglobal )
  setopt $_edit_opts

  local fdir=${${(%):-%x}:A:h}/functions
  typeset -gU FPATH fpath=( $fdir $fpath )
  autoload -Uz add-zsh-hook $fdir/_*~*.zwc

  add-zsh-hook chpwd _cdpath

  local widget
  for widget in {forward,backward,kill,backward-kill}-word; do
    zle -N $widget _edit_subword
  done
  for widget in yank yank-pop reverse-yank-pop; do
    zle -N $widget _visual_yank
  done

  bindkey -M emacs '^[Y' reverse-yank-pop

  zle -N _dirstack
  bindkey -M emacs '^[-' _dirstack
  bindkey -M emacs '^[=' _dirstack

  autoload -Uz $fdir/bindkey
}
