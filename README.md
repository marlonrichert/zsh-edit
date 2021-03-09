# zsh-edit
`zsh-edit` is a set of powerful extensions to the Zsh command line editor.

* Features:
  * [Better (Sub)Word Movement](#better-subword-movement)
  * [Clipboard Viewer](#clipboard-viewer)
  * [`cd` History Navigation](#cd-history-button)
  * [`cd` to Ancestors & Siblings](#cd-to-ancestors--siblings)
  * [`bindkey` Extensions](#bindkey-extensions)
* [Author](#author)
* [License](#license)

## Better (Sub)Word Movement
By default, Zsh's widgets <kbd>forward-word</kbd>, <kbd>backward-word</kbd>, <kbd>kill-word</kbd>
and <kbd>backward-kill-word</kbd> always move to the left side of the each word and do not
recognize subwords (for example, `dev` and `Build` in `devBuild`). This often causes them to move
or delete too much, especially in the `forward` direction.

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

Subword matching can be customized by adding or removing characters from `$WORDCHARS`: In addition
to uppercase letters, any character in `$WORDCHARS` will be parsed as starting a subword and the
cursor will end up to the left of it. So, for example, if you want the cursor to always end up to
the left of any adjacent spaces, just add a space to `$WORDCHARS`.

## `cd` History Navigation
`zsh-edit` adds the following keyboard shortcuts for quick directory navigation:

| key binding | action |
| --- | --- |
| <kbd>Alt</kbd><kbd>-</kbd> | Backward in dir history |
| <kbd>Alt</kbd><kbd>=</kbd> | Forward in dir history |
| <kbd>Alt</kbd><kbd>`</kbd> | Select from dir history |


## Clipboard Viewer
Whenever you <kbd>yank</kbd> (<kbd>Control</kbd><kbd>Y</kbd> by default), `zsh-edit` will list the
contents of your kill ring (including the cut buffer) below your command line. In addition,
`zsh-edit` eliminates all duplicate kills from your kill ring. Thus, each entry listed is
 guaranteed to be unique.

Furthermore, after using <kbd>yank</kbd>, when you use <kbd>yank-pop</kbd>
(<kbd>Alt</kbd><kbd>Y</kbd> by default), `zsh-edit` will show you which kill is currently selected,
making it easier to cycle to the right one. To view your clipboard at any time, without modifying
your command line, just press <kbd>yank-pop</kbd> by itself.

Finally, `zsh-edit` adds a new widget <kbd>reverse-yank-pop</kbd>, which lets you cycle in the
opposite direction. It is bound in the `emacs` keymap (which is the default keymap) to
<kbd>Alt</kbd><kbd>Shift</kbd><kbd>Y</kbd>.

## `cd` to Ancestors & Siblings
💡 This is an optional feature. To enable it, add the following to your `.zshrc` file:
```zsh
add-zsh-hook chpwd _cdpath
```
Thereafter, whenever you use `cd`, you can type the name of any ancestor dir and you'll be taken
straight to it. What's more, this also works for sibling dirs, including siblings of ancestors. To
top it off, Zsh will also complete these dirs for you.

For example, if you're in `/Users/marlon/git/prezto/modules/history-substring-search/external`,
then
* `cd prezto` takes you to `/Users/marlon/git/prezto`.
* `cd fasd` takes you to `/Users/marlon/git/prezto/modules/fasd`

To reduce the number of false positives, children of `/` and `~` are not included. So, for the
example above, if you want to go to `/Users/marlon/git`, you'll have to type `cd ~/git`. Likewise,
if you want to go to `/Users`, you'll have to type `cd /Users`.

## `bindkey` Extensions
`zsh-edit` extends `bindkey` with the following new options:
```zsh
# List unused keybindings in the main keymap or another one.
bindkey -u
bindkey -u -M vicmd

# Look up the names of keys listed by `bindkey`.
bindkey -n '^[^[[5~'

# Bind commands. What's more, using these will not sacrifice your current command line.
bindkey -c '^[.'  'cd ..'
bindkey -c '^[`'  'cd ~'
bindkey -c '^L'   'ls'
bindkey -c '^S'   'git status'
bindkey -c '^O'   'git log --oneline'
```
Tip: If you use
[`zkbd`](http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Keyboard-Definition)
or
[`zsh-autocomplete`](https://github.com/marlonrichert/zsh-autocomplete),
`bindkey -n` will give better results.

## Author
© 2020 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
