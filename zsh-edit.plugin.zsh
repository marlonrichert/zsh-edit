#!/bin/zsh
setopt autopushd pushdminus

() {
  local dir=${${(%):-%x}:P:h}
  local fdir=$dir/functions
  typeset -gU FPATH fpath=( $dir $fpath )
  autoload -Uz $fdir/{bind,zsh-edit} $fdir/[._]edit.*~*.zwc(DN)

  {
    zsh-edit "$@"
  } always {
    unfunction zsh-edit
  }
} "$@"
