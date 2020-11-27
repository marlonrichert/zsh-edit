# zsh-edit
`zsh-edit` enhances Zsh's command line tools to be more powerful & user-friendly.

* [Clipboard Viewer](#clipboard-viewer)
* [`reverse-yank-pop`](#reverse-yank-pop)
* [`cd` to Ancestors and Siblings](#cd-to-ancestors-and-siblings)
* [Better `backward/forward-(kill-)word` Widgets with Subword
  Matching](#better-backwardforward-kill-word-widgets-with-subword-matching)
* [Note About Key Bindings](#note-about-key-bindings)
* [Author](#author)
* [License](#license)

## Clipboard Viewer
Whenever you <kbd>yank</kbd>, `zsh-edit` will list the contents of your kill ring (including the
cut buffer) below your command line. In addition, `zsh-edit` also eliminates all duplicate kills
from your kill ring. Thus, each entry listed is guaranteed to be unique.

Furthermore, when you use <kbd>yank-pop</kbd>, `zsh-edit` will show you which kill is currently
selected, making it easier to cycle to the right one. Finally, to view your clipboard at any time,
without modifying your command line, just press <kbd>yank-pop</kbd> by itself.

## `reverse-yank-pop`
`zsh-edit` adds a new widget <kbd>reverse-yank-pop</kbd> and binds it to
<kbd>Alt</kbd><kbd>Shift</kbd><kbd>Y</kbd>. It functions just like <kbd>yank-pop</kbd>, but lets
you cycle in the opposite direction.

## `cd` to Ancestors and Siblings
Everyone knows that `..` takes you to the parent of the present working dir, but if you want to go
up more than one level, typing it multiple times can get a bit tedious.

`zsh-edit` makes that easier. From now on, when you use `cd`, you can type the name of any ancestor
dir and it will take you straight to it. What's more, this also works for sibling dirs,
too—including siblings of ancestors! To top it off, Zsh will now also complete these dirs for you.

For example, if you're in `/Users/marlon/.zsh/prezto/modules/history-substring-search/external`,
then
* `cd prezto` takes you straight to `/Users/marlon/.zsh/prezto`.
* `cd fasd` takes you straight to `/Users/marlon/.zsh/prezto/modules/fasd`

To make sure this always saves you from typing at least 2 characters, and to reduce the number of
false positives, if you're in a descendant of a named dir, such as `~`, then this dir and its
children are not included. Likewise, `/` and its children are never included either. So, for the
example above, if you want to go to `/Users/marlon/.zsh`, you'll have to type `cd ~/.zsh`.
Likewise, if you want to go to `/Users`, you'll have to type `cd /Users`.

## Better `backward/forward-(kill-)word` Widgets with Subword Matching
By default, Zsh's widgets
* <kbd>forward-word</kbd>,
* <kbd>backward-word</kbd>,
* <kbd>kill-word</kbd> and
* <kbd>backward-kill-word</kbd>

always move to the beginning of the next word and do not recognize subwords (for example, `dev` and
`Build` in `devBuild`). This often causes them to move or delete too much, especially in the
`forward` direction.

`zsh-edit` upgrades these widgets to add subword parsing and makes it so that movement in either
direction stops at the next word boundary, regardless whether that's the beginning or end of a
word. Assuming otherwise default settings, you will now get this behavior:

```zsh
       >  > >      >   >    >        >  >
shutdown.sh; gradlew devBuild; startup.sh
<       <  < <       <  <      <      <
```

Or if you have `WORDCHARS=''`, you'll get this instead:

```zsh
       >  > >      >   >    >        >  >
shutdown.sh; gradlew devBuild; startup.sh
<        < < <       <  <      <       <
```

This has the following benefits:
* When your cursor is inside a word, you can now press <kbd>forward-word</kbd> or
  <kbd>backward-word</kbd> to reach either end of the word.
* When you have your cursor at either end of a word, pressing <kbd>kill-word</kbd> or
  <kbd>backward-kill-word</kbd> in the direction of the word will always kill the whole word and
  nothing else.
* You are now less likely to delete things you didn't want to delete.
* Subwords are now recognized and `devBuild` is parsed as two words, `dev` and `Build`, with the
  cursor stopping at the end of each.

Subword matching can be customized by adding or removing characters from `$WORDCHARS`: Besides
uppercase letters, any character in `$WORDCHARS` will be parsed parsed as starting a subword and
the cursor will end up to the left of it. So, for example, if you want the cursor to always end up
to the left of any adjacent spaces, just add a space to `$WORDCHARS`.

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
