# zsh-edit
`zsh-edit` is a small, but handy set of editing tools for the Zsh command line.

* [Clipboard Viewer](#clipboard-viewer)
* [Reverse Yank-Pop](#reverse-yank-pop)
* [Subword Editing](#subword-editing)
* [Note About Key Bindings](#note-about-key-bindings)
* [Author](#author)
* [License](#license)

## Clipboard Viewer
Whenever you <kbd>yank</kbd>, `zsh-edit` will list the contents of your kill ring (including the
cut buffer) below your command line. Moreover, when you use <kbd>yank-pop</kbd>, `zsh-edit` will
show you which kill is currently selected, making it easier to cycle to the right one.

To view your clipboard at any time, without modifying your command line, just press
<kbd>yank-pop</kbd>.

In addition, whenever you perform a <kbd>yank</kbd>, `zsh-edit` eliminates all duplicates kills
from your kill ring. Thus, each entry listed is guaranteed to be unique.

## Reverse Yank-Pop
`zsh-edit` adds a new widget <kbd>reverse-yank-pop</kbd> and binds it to
<kbd>Alt</kbd><kbd>Shift</kbd><kbd>Y</kbd>. It functions just like <kbd>yank-pop</kbd>, but lets
you cycle in the opposite direction.

## Subword Editing
`zsh-edit` augments
* <kbd>forward-word</kbd>,
* <kbd>backward-word</kbd>,
* <kbd>kill-word</kbd> and
* <kbd>backward-kill-word</kbd>

to operate on subwords, meaning (by default) any substring of zero or more uppercase letters
followed by zero or more lowercase letters, digits, or wildcards (`*` and `?`). In addition, by
default these widgets will always move or delete by at least 3 characters.

These examples show where each forward <kbd>⇥</kbd> and backward <kbd>⇤</kbd> stop would be for the
given line (assuming default settings):
```
   ⇥   ⇥   ⇥  ⇥      ⇥      ⇥    ⇥       ⇥    ⇥    ⇥       ⇥    ⇥
LikeTHIS FooHoo foo123 bar234 comp.sources.unix comp.sources.misc
⇤   ⇤    ⇤  ⇤   ⇤      ⇤      ⇤    ⇤       ⇤    ⇤    ⇤       ⇤

      ⇥  ⇥  ⇥  ⇥   ⇥    ⇥    ⇥    ⇥    ⇥      ⇥    ⇥         ⇥        ⇥⇥
compadd -M 'L:|[nN][oO]= M:_= M:{[:upper:]}={[:lower:]}' - ${(k)options}
⇤      ⇤  ⇤  ⇤    ⇤   ⇤   ⇤    ⇤   ⇤    ⇤      ⇤    ⇤           ⇤
```

These widgets can work as a drop-in replacements for the suite of [`match`
functions](http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#index-forward_002dword_002dmatch),
included in most Zsh distributions, and support most of the same `zstyle` preferences, but with
more sensible defaults and a bit smarter behavior.

More generally, the behavior of each widget is as follows:
 1. If `${skip-whitespace-first}`, skip all adjacent whitespace.
 1. Skip the next `${skip-chars}` characters.
 1. Set `$WORDCHARS` locally to `${word-chars}`.
 1. Skip to the next subword boundary, where a subword is defined as
    * 1 or more characters _not_ in `[${word-class}]` **OR**
    * any number of characters in `[${subword-range}]`, followed left-to-right by any number of
      characters that are in `[${word-class}]` but _not_ in `[${subword-range}]`.
 1. Finally, if this is a <kbd>kill</kbd> widget, then kill all skipped text.

The default values are set as follows:
```zsh
zstyle ':zle:*' skip-whitespace-first no
zstyle ':zle:*' skip-chars 2
zstyle ':zle:*' subword-range '[:upper:]'
zstyle ':zle:*' word-chars '*?'
zstyle ':zle:*' word-class '[:WORD:]'
```

To change a setting for a specific widget only, substitute `*` with the name of the widget.

## Note About Key Bindings
Except for the addtion of [<kbd>reverse-yank-pop</kbd>](#reverse-yank-pop), `zsh-edit` does not
change your key bindings. To use the keyboard commands (a.k.a "widgets") that `zsh-edit` enhances,
you will need to know to which key strokes they are bound.
* Type `bindkey` to see your current key bindings.
* To add a new new keybinding or override an existing one, add lines like in this example to your
  `~/.zshrc` file:
  ```zsh
  # Ctrl-Y
  bindkey '^Y' yank

  # Alt-Y
  bindkey '^[y' yank-pop

  # Alt-Shift-Y
  bindkey '^[Y' reverse-yank-pop
  ```
* See the [Zsh Line Editor
  documentation](http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html) for more info.

## Author
© 2020 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
