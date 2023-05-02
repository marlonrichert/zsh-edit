#!/bin/zsh
() {
  typeset -gHa _edit_opts=( extendedglob NO_listbeep NO_shortloops warncreateglobal )
  emulate -L zsh; setopt $_edit_opts

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
