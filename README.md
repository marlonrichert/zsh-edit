# zsh-edit
`zsh-edit` is a small, but handy set of editing tools for the Zsh command line.

* [Better Word Matching](#better-word-matching)
* [Clipboard Viewer](#clipboard-viewer)
* [Reverse Yank-Pop](#reverse-yank-pop)
* [Note About Key Bindings](#note-about-key-bindings)
* [Author](#author)
* [License](#license)

## Better Word Matching
`zsh-edit` augments
* <kbd>forward-word</kbd>,
* <kbd>backward-word</kbd>,
* <kbd>kill-word</kbd> and
* <kbd>backward-kill-word</kbd>

to behave as follows (assuming, for this example, that you have `WORDCHARS='*?\'` in your
`~/.zshrc` file), with `⇥` and `⇤` marking forward and backward stops, respectively:
```
      ⇥  ⇥  ⇥         ⇥  ⇥ ⇥          ⇥  ⇥ ⇥   ⇥ ⇥   ⇥     ⇥   ⇥   ⇥  ⇥      ⇥      ⇥
compadd -M 'r:[^[:upper:]0-9]||[[:upper:]0-9]=** r:|=*' LikeTHIS FooHoo foo123 bar234
⇤        ⇤  ⇤     ⇤      ⇤ ⇤      ⇤      ⇤ ⇤  ⇤  ⇤   ⇤  ⇤   ⇤    ⇤  ⇤   ⇤      ⇤
```

Thus, when your cursor is inside a word, you can press <kbd>forward-word</kbd> or
<kbd>backward-word</kbd> to reach either end of the word. Likewise, when you have your cursor at
the either end of a word, pressing <kbd>kill-word</kbd> or <kbd>backward-kill-word</kbd> in the
direction of the word will always kill the whole word and nothing but the whole word.

Also note that subwords are now treated as separate words, too: `LikeTHIS` is parsed as two words,
`Like` and `THIS`.

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
