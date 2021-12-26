# Zsh-Edit
Zsh-Edit is a set of powerful extensions to the Zsh command line editor.

## Requirements
* Recommended: Zsh 5.7.1 or newer
* Minimum: Zsh 5.4.2

## `bind` Command
```zsh
# Bind shell commands directly to keyboard shortcuts.
# What's more, when using these, your current command line will be left intact.
bind \
    '^[c' 'code .' \
    '^[o' 'open .' \
    '^[l' 'git log' \
    '^[s' 'git status -Mu --show-stash'

# List duplicate keybindings in the main keymap or another one:
bind -d
bind -dM viins

# List unused keybindings in the main keymap or another one:
bind -u
bind -uM emacs

# Look up the names of key codes listed by `bind` and `bindkey`:
% bind -n '^[[5~' '^[^[OA'
PreviousPage  Alt-UpArrow
```

## Key Bindings
Zsh-Edit adds the following keyboard shortcuts to keymaps `main` and `emacs` (which are usually
[the same](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#index-VISUAL)).

* You can customize these with [Zsh's `bindkey`
  command](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins),
  _after_ sourcing Zsh-Edit.
* Not all terminals support all key bindings.

|Command|`emacs`|`main`||
|-|-:|-:|-:
|Redo (reverse Undo)|<kbd>Alt</kbd><kbd>/</kbd>
|[Reverse yank pop](#clipboard-viewer)|<kbd>Alt</kbd><kbd>Y</kbd>
||
|`cd` to previous dir|<kbd>Alt</kbd><kbd>-</kbd>
|Select from previous 16 dirs|<kbd>Shift</kbd><kbd>Alt</kbd><kbd>-</kbd>
|`cd` to next dir|<kbd>Alt</kbd><kbd>=</kbd>
|Select from next 16 dirs|<kbd>Shift</kbd><kbd>Alt</kbd><kbd>=</kbd>
|`cd` to parent dir|<kbd>Shift</kbd><kbd>Alt</kbd><kbd>;</kbd>
||
|Backward [subword](#subword-movement)|<kbd>Alt</kbd><kbd>B</kbd>|<kbd>Ctrl</kbd><kbd>←</kbd>|<kbd>Alt</kbd><kbd>←</kbd>
|Backward shell word|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>B</kbd>|<kbd>Ctrl</kbd><kbd>↑</kbd>|<kbd>Alt</kbd><kbd>↑</kbd>
|Forward [subword](#subword-movement)|<kbd>Alt</kbd><kbd>F</kbd>|<kbd>Ctrl</kbd><kbd>→</kbd>|<kbd>Alt</kbd><kbd>→</kbd>
|Forward shell word|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>F</kbd>|<kbd>Ctrl</kbd><kbd>↓</kbd>|<kbd>Alt</kbd><kbd>↓</kbd>
||
|Backward kill [subword](#subword-movement)|<kbd>Alt</kbd><kbd>Backspace</kbd>|<kbd>Ctrl</kbd><kbd>Backspace</kbd>|<kbd>Alt</kbd><kbd>Backspace</kbd>
|Backward kill shell word|<kbd>Ctrl</kbd><kbd>W</kbd>|<kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>Backspace</kbd>|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>Backspace</kbd>
|Forward delete character||<kbd>Delete</kbd>
|Forward kill [subword](#subword-movement)|<kbd>Alt</kbd><kbd>D</kbd>|<kbd>Ctrl</kbd><kbd>Delete</kbd>|<kbd>Alt</kbd><kbd>Delete</kbd>
|Forward kill shell word|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>D</kbd>|<kbd>Shift</kbd><kbd>Ctrl</kbd><kbd>Delete</kbd>|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>Delete</kbd>
||
|Beginning of line|<kbd>Ctrl</kbd><kbd>A</kbd>|<kbd>Home</kbd>
|End of line|<kbd>Ctrl</kbd><kbd>E</kbd>|<kbd>End</kbd>
|Beginning of buffer|<kbd>Alt</kbd><kbd><</kbd>|<kbd>Ctrl</kbd><kbd>Home</kbd>|<kbd>PageUp</kbd>
|End of buffer|<kbd>Alt</kbd><kbd>></kbd>|<kbd>Ctrl</kbd><kbd>End</kbd>|<kbd>PageDn</kbd>
|Backward kill line|<kbd>Ctrl</kbd><kbd>U</kbd>|<kbd>Shift</kbd><kbd>Home</kbd>|<kbd>Shift</kbd><kbd>←</kbd>
|Forward kill line|<kbd>Ctrl</kbd><kbd>K</kbd>|<kbd>Shift</kbd><kbd>End</kbd>|<kbd>Shift</kbd><kbd>→</kbd>

## Clipboard Viewer
Whenever you use <kbd>yank</kbd> (`^Y` in `emacs`), <kbd>vi-put-after</kbd> (`p` in `vicmd`) or
<kbd>vi-put-after</kbd> (`P` in `vicmd`) to paste a kill into the command line, Zsh-Edit will list
the contents of your kill ring (including the cut buffer) below your command line. In addition,
Zsh-Edit eliminates all duplicate kills from your kill ring. Thus, each entry listed is guaranteed
to be unique.

Furthermore, after pasting, when you use <kbd>yank-pop</kbd> (`^[y` in `emacs`), Zsh-Edit will show
you which kill is currently selected, making it easier to cycle to the right one. To view your
clipboard at any time – without modifying your command line – just press <kbd>yank-pop</kbd> by
itself.

Finally, Zsh-Edit adds a new widget <kbd>reverse-yank-pop</kbd>, which lets you cycle in the
opposite direction. It is bound to `^[Y` in the `main` keymap.

## Subword Movement
Zsh's widgets <kbd>forward-word</kbd>, <kbd>backward-word</kbd>, <kbd>kill-word</kbd> and
<kbd>backward-kill-word</kbd> fail to stop on many of the positions that we humans see as word
boundaries:
```zsh
# Zsh default word boundaries 😕

# With default WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
#     > >     >  >          >   >      >     >                        >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <    < <     <  <          <   <      <     <
# Skips/deletes _way_ too much.

# With WORDCHARS=''
#        >       >          >   >        >   >      >                 >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <       <       <          <   <        <   <      <
# A bit better, but skips _all_ punctuation clusters & doesn't find SubWords.
```

Zsh-Edit adds new widgets with better parsing rules that can find all the word boundaries that
matter to us as humans:
```zsh
# Word boundaries with Zsh-Edit 🤗

# With default WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
#    > >     >  >    >    > >  >      >     >      >    >        >    >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <    < <     <  <   <    < <   <      <     <     <    <        <

# With WORDCHARS=''
#    > > >   >  >    >    > >  >      >  >  >      >    >        >    >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <   < < <    <  <   <    < <   <      < <   <      <   <        <
```

If you don't want to change your `$WORDCHARS` globally, you can instead use
```zsh
zstyle ':edit:*' word-chars '*?\'
```
This will change `$WORDCHARS` only for the widgets provided by `zsh-edit`.

## Author
© 2020-2021 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
