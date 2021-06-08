#!/bin/zsh
setopt autopushd pushdminus
zmodload zsh/complist

() {
  emulate -L zsh
  typeset -gHa _edit_opts=( extendedglob NO_listbeep NO_shortloops warncreateglobal )
  setopt $_edit_opts

  local fdir=${${(%):-%x}:h}/functions
  unfunction bindkey 2>/dev/null
  autoload -Uz $fdir/bindkey $fdir/_*~*.zwc

  bindkey -M emacs '^U'  backward-kill-line
  bindkey -M emacs '^[e' redo

  .beginning-of-buffer() {
    CURSOR=0
  }
  .end-of-buffer() {
    CURSOR=$#BUFFER
  }
  zle -N beginning-of-buffer .beginning-of-buffer
  zle -N end-of-buffer       .end-of-buffer
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
    zle -N "$v" _edit_subword
    bindkey -M emacs      "$k" "$v"
    bindkey -M menuselect "$k" ".$v"
    ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=( "$v" )
  done
  for k v in \
      '^[^H' backward-kill-subword \
      '^W'   backward-kill-shell-word \
      '^[d'  kill-subword \
      '^[^D' kill-shell-word; do
    zle -N "$v" _edit_subword
    bindkey -M emacs "$k" "$v"
  done

  local w
  for w in yank yank-pop reverse-yank-pop vi-put-before vi-put-after; do
    zle -N $w _visual_yank
  done
  bindkey -M emacs '^[Y' reverse-yank-pop

  zle -N _dirstack
  bindkey -M emacs '^[`' _dirstack # Show dir stack.

  zle -N _pushd
  bindkey -M emacs -c '^[-' '-pushd -1'  # Go backward one dir.
  bindkey -M emacs -c '^[=' '-pushd +0'  # Go forward one dir.
  bindkey -M menuselect '^[-' menu-complete
  bindkey -M menuselect '^[=' reverse-menu-complete
}
