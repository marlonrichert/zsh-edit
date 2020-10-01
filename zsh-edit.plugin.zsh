#!/bin/zsh
() {
  emulate -L zsh

  typeset -gHa _edit_opts=( localoptions extendedglob rcquotes warncreateglobal )
  setopt $_edit_opts

  local fdir=${${(%):-%x}:A:h}/functions
  typeset -gU FPATH fpath=( $fdir $fpath )
  autoload -Uz $fdir/*

  local widget

  for widget in {forward,backward,kill,backward-kill}-word; do
    zle -N $widget edit-subword
  done

  for widget in yank yank-pop reverse-yank-pop; do
    zle -N $widget visual-yank
  done
  bindkey '^[Y' reverse-yank-pop
}
