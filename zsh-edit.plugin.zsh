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

  bindkey -M emacs '^U'  backward-kill-line
  bindkey -M emacs '^[e' redo

  .beginning-of-buffer() {
    CURSOR=0
  }
  .end-of-buffer() {
    CURSOR=$#BUFFER
  }
  zle -N {,.}beginning-of-buffer
  zle -N {,.}end-of-buffer
  bindkey -M emacs '^[<' beginning-of-buffer
  bindkey -M emacs '^[>' end-of-buffer
  bindkey -M menuselect '^[<' beginning-of-history
  bindkey -M menuselect '^[>' end-of-history

  [[ -v ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS ]] ||
      typeset -gHa ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS=()
  local k v
  for k v in \
      '^[b'  backward-subword \
      '^[^B' backward-shell-word \
      '^[f'  forward-subword \
      '^[^F' forward-shell-word; do
    zle -N "$v" .edit.subword
    bindkey -M emacs "$k" "$v"
    ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=( "$v" )
  done
  for k v in \
      '^[^H' backward-kill-subword \
      '^[^?' backward-kill-subword \
      '^W'   backward-kill-shell-word \
      '^[d'  kill-subword \
      '^[^D' kill-shell-word; do
    zle -N "$v" .edit.subword
    bindkey -M emacs "$k" "$v"
  done

  local w
  for w in yank yank-pop reverse-yank-pop vi-put-before vi-put-after; do
    zle -N $w .edit.visual-yank
  done
  bindkey -M emacs '^[Y' reverse-yank-pop

  zle -N dirstack-minus .edit.dirstack
  zle -N dirstack-plus  .edit.dirstack
  bindkey -M emacs '^[_' dirstack-minus
  bindkey -M emacs '^[+' dirstack-plus
  bindkey -M menuselect -s '^[_' '^G^_^[_'
  bindkey -M menuselect -s '^[+' '^G^_^[+'

  bind -M emacs '^[-' 'pushd -1'  # Go backward one dir.
  bind -M emacs '^[=' 'pushd +0'  # Go forward one dir.
  bindkey -M menuselect '^[-' menu-complete
  bindkey -M menuselect '^[=' reverse-menu-complete
}

{
  zsh-edit "$@"
} always {
  unfunction zsh-edit
}
