# Zsh-Edit
Zsh-Edit is a set of powerful extensions to the Zsh command line editor.

## Requirements
* Recommended: Zsh 5.7.1 or newer
* Minimum: Zsh 5.4.2

## `bind` Command
```zsh
# Bind shell commands directly to keyboard shortcuts.
# What's more, when using these, your current command line will be left intact.
bind '^Xc' 'code .'
bind '^Xo' 'open .'
bind '^Xl' 'git log'
bind '^Xs' 'git status -Mu --show-stash'

# List duplicate keybindings in the main keymap or another one:
bind -d
bind -dM viins

# List unused keybindings in the main keymap or another one:
bind -u
bind -uM emacs

# Look up the names of key codes listed by `bind` or `bindkey`:
% bind -n '^[[5~' '^[^[OA'
PreviousPage  Alt-UpArrow
```

## Key Bindings
Zsh-Edit adds the following keyboard shortcuts to the default `emacs` keymap. After sourcing
Zsh-Edit, you can change these bindings [through the `bindkey`
command](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins).
If you don't know what the key codes below mean, Zsh-Edit [can translate them for
you](#look-up-key-names-listed-by-bindkey).

|      Keys | Command |
| --------: | ------- |
|     `^[-` | `cd` to previous dir |
|     `^[=` | `cd` to next dir |
| `` ^[` `` | Select from the last 16 dirs |
|     `^[e` | Redo (reverse Undo) |
|      `^U` | Backward kill line |
|     `^[<` | Beginning of buffer |
|     `^[>` | End of buffer |
|     `^[Y` | [Reverse yank pop](#clipboard-viewer) |
|     `^[b` | Backward [subword](#subword-movement) |
|    `^[^B` | Backward shell word |
|    `^[^H` | Backward kill [subword](#subword-movement) |
|      `^W` | Backward kill shell word |
|     `^[f` | Forward [subword](#subword-movement) |
|    `^[^F` | Forward shell word |
|     `^[d` | Forward kill [subword](#subword-movement) |
|    `^[^D` | Forward kill shell word |

### Subword Movement
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

## Clipboard Viewer
Whenever you use <kbd>yank</kbd> (`^Y` by default), <kbd>vi-put-after</kbd> (`p` in `vicmd`) or
<kbd>vi-put-after</kbd> (`P` in `vicmd`) to paste a kill into the command line, Zsh-Edit will list
the contents of your kill ring (including the cut buffer) below your command line. In addition,
Zsh-Edit eliminates all duplicate kills from your kill ring. Thus, each entry listed is guaranteed
to be unique.

Furthermore, after pasting, when you use <kbd>yank-pop</kbd> (`^[y` by default), Zsh-Edit will show
you which kill is currently selected, making it easier to cycle to the right one. To view your
clipboard at any time – without modifying your command line – just press <kbd>yank-pop</kbd> by
itself.

Finally, Zsh-Edit adds a new widget <kbd>reverse-yank-pop</kbd>, which lets you cycle in the
opposite direction. It is bound to `^[Y` in the default `emacs` keymap.

## Author
© 2020-2021 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
