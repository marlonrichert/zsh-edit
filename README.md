# Zsh-Edit
Zsh-Edit is a set of powerful extensions to the Zsh command line editor.

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
| `` ^[` `` | Select a previous dir |
|     `^[e` | Redo (reverse Undo) |
|    `^U`   | Backward kill line |
|    `^[Y`  | [Reverse yank pop](#clipboard-viewer) |
|    `^[b`  | Backward [subword](#subword-movement) |
|    `^[^B` | Backward shell word |
|    `^[^H` | Backward kill [subword](#subword-movement) |
|    `^W`   | Backward kill shell word |
|    `^[f`  | Forward [subword](#subword-movement) |
|    `^[^F` | Forward shell word |
|    `^[d`  | Forward kill [subword](#subword-movement) |
|    `^[^D` | Forward kill shell word |
|    `^[<`  | Beginning of buffer |
|    `^[>`  | End of buffer |

### Subword Movement
Zsh's widgets <kbd>forward-word</kbd>, <kbd>backward-word</kbd>, <kbd>kill-word</kbd> and
<kbd>backward-kill-word</kbd> fail to stop on many of the positions that we humans see as word
boundaries:
```zsh
# ZSH default word boundaries 😕

# With default $WORDCHARS:
#     > >     >  >          >   >      >     >                        >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <    < <     <  <          <   <      <     <
# Skips/deletes _way_ too much.

# With WORDCHARS=''
#        >       >          >   >        >   >      >                 >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <       <       <          <   <        <   <      <
# A bit better, but still not great.
```

Zsh-Edit upgrades these widgets with better parsing rules that can find all the word boundaries
that matter to us and makes it easily customizable through the `$WORDCHARS` parameter.

```zsh
# Word boundaries with Zsh-Edit 🤗

# With default $WORDCHARS:
#    > >     >  >    >    > >  >      >     >      >    >        >    >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <    < <     <  <   <    < <   <      <     <     <    <        <

# With WORDCHARS='':
#    > > >   >  >    >    > >  >      >  >  >      >    >        >    >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <    <  <    <  <   <    < <   <      < <   <      <   <        <

# With WORDCHARS='*?~\':
#    > > >   > > >   >    > >  >      >  >  >      >    >        >    >
% dscl . -read ~/ UserShell; git config --get status.showUntrackedFiles
# <    <  <     < <   <    < <   <      < <   <      <   <        <
```

If you don't want to change your `$WORDCHARS` globally, you can instead use
```zsh
zstyle ':edit:*' word-chars '*?~\'
```
which will change `$WORDCHARS` only for the widgets provided by `zsh-edit`.

## Clipboard Viewer
Whenever you <kbd>yank</kbd> (`^Y` by default), Zsh-Edit will list the
contents of your kill ring (including the cut buffer) below your command line. In addition,
Zsh-Edit eliminates all duplicate kills from your kill ring. Thus, each entry listed is guaranteed
to be unique.

Furthermore, after using <kbd>yank</kbd>, when you use <kbd>yank-pop</kbd>
(`^[y` by default), Zsh-Edit will show you which kill is currently selected,
making it easier to cycle to the right one. To view your clipboard at any time, without modifying
your command line, just press <kbd>yank-pop</kbd> by itself.

Finally, Zsh-Edit adds a new widget <kbd>reverse-yank-pop</kbd>, which lets you cycle in the
opposite direction.

## `bindkey` Extensions
Zsh-Edit extends `bindkey` with the following new options:

### Bind commands directly to keyboard shortcuts
What's more, when using these, your current command line will be left intact.
```zsh
# By default, these will appear on screen and in history, just as if you typed
# them & pressed Enter:
bindkey -c '^[^[OA' 'git push'
bindkey -c '^[^[OB' 'git fetch; git pull --autostash'

# However, you can hide commands by prepending them with +, @ or -.

# Use + to print output below the current prompt and start a new command line:
bindkey -c '^S'     '+git status --show-stash'

# Use @ to leave the current prompt unmodified (if possible):
bindkey -c '^[^L'   '@git log'

# Use - to update the current prompt in place:
bindkey -c '^[-'    '-pushd -1'
bindkey -c '^[='    '-pushd +0'
```

### Look up key names listed by `bindkey`
```zsh
% bindkey -n '^[^[OA'
Alt-Up
% bindkey -n '^[^[OB'
Alt-Down
```

### List unused keybindings in the main keymap or another one
```zsh
% bindkey -u
% bindkey -u -M vicmd
```

### List duplicate keybindings in the main keymap or another one
```zsh
% bindkey -U
% bindkey -U -M vicmd
```

## Author
© 2020-2021 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
