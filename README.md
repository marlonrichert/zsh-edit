# Zsh Edit
_Zsh Edit_ is a set of handy utilities for making life easier on the Zsh command line.

## Requirements
Tested to work with Zsh 5.8 and newer.

## Installating & updating
I recommend using [Znap](https://github.com/marlonrichert/zsh-snap) or installing the plugin manually.  You can also
install it using any 3rd-party framework or plugin manager you like, but I won't document that here.

### Using Znap
Aust add this to your `.zshrc` file:
```zsh
znap source marlonrichert/zsh-edit
```
To update, run `znap pull`.

### Manually
1. Clone the repo:
   ```zsh
   % git clone --depth 1 https://github.com/marlonrichert/zsh-edit.git
   ```
1. Source the plugin in your `.zshrc` file:
   ```zsh
   source <your plugins dir>/zsh-edit/zsh-edit.plugin.zsh
   ```
1. Restart your shell:
   ```zsh
   exec zsh
   ```
To update:
```zsh
% cd <your plugins dir>/zsh-edit
% git pull
```

## `bind` Command
Bind shell commands directly to keyboard shortcuts.  What's more, when using these, your current command line will be
left intact.
```zsh
bind  '^[:' 'cd ..'
bind  '^[-' 'pushd -1' \
      '^[=' 'pushd +0'
```

List duplicate keybindings in the main keymap or another one.
```zsh
bind -d
bind -dM viins
```

List unused keybindings in the main keymap or another one.
```zsh
bind -u
bind -uM emacs
```

Look up which combination of keys could generate an escape sequence listed by `bind` or `bindkey`.
```zsh
% bind -n '^[[5~' '^[^[OA'
"^[[5~"    PageUp
"^[^[OA"   Alt-Up
```

## Key Bindings
_Zsh Edit_ adds the keyboard shortcuts below to your `main` and `emacs` keymaps.
* By default, the `emacs` keymap is your `main` keymap.
* However, if you use `vi` mode, then your `main` keymap will be the `viins` keymap.

All key bindings can be modified through [Zsh's `bindkey`
command](https://zsh.sourceforge.io/Doc/Release/Zsh-Line-Editor.html#Zle-Builtins), _after_ sourcing _Zsh Edit_.

⚠️ Note:
* Not all terminals support all key bindings.
* In some terminals, instead of <kbd>Alt</kbd>, you'll have to press <kbd>Esc</kbd> or <kbd>Ctrl</kbd><kbd>[</kbd>.
* In many terminals, <kbd>Home</kbd>, <kbd>End</kbd>, <kbd>PgUp</kbd> and <kbd>PgDn</kbd> scroll the terminal buffer and
  don't send any keystrokes to the shell.  To use these keys in the shell, you'll have to hold an additional modifier
  key, usually <kbd>Shift</kbd>.  Refer to your terminal's documentation and/or settings for more info.

|Command|`emacs` keymap|`main` keymap||
|-|-:|-:|-:
|Redo (reverse Undo)                                                                         |<kbd>Alt</kbd><kbd>/</kbd>
|[Reverse yank pop](#clipboard-viewer)                                                       |<kbd>Alt</kbd><kbd>Y</kbd>
||
|`cd` to parent dir           |<kbd>Alt</kbd><kbd>Shift</kbd><kbd>;</kbd>
|`cd` to previous dir         |<kbd>Alt</kbd><kbd>-</kbd>
|`cd` to next dir             |<kbd>Alt</kbd><kbd>=</kbd>
|Select from previous 16 dirs |<kbd>Alt</kbd><kbd>`</kbd>
|Select from next 16 dirs     |<kbd>Alt</kbd><kbd>Shift</kbd><kbd>`</kbd>
||
|Repeat word up   |<kbd>Alt</kbd><kbd>.</kbd>
|Repeat word down |<kbd>Alt</kbd><kbd>,</kbd>
|Repeat word left |<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>-</kbd>
|Repeat word right|<kbd>Alt</kbd><kbd>Shift</kbd><kbd>-</kbd>
||
|Backward [subword](#subword-movement)|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>B</kbd>  |<kbd>Ctrl</kbd><kbd>←</kbd>|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>←</kbd>
|Forward [subword](#subword-movement) |<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>F</kbd>  |<kbd>Ctrl</kbd><kbd>→</kbd>|<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>→</kbd>
|Backward shell word                  |<kbd>Alt</kbd><kbd>B</kbd>                 |<kbd>Alt</kbd><kbd>←</kbd> |<kbd>Shift</kbd><kbd>←</kbd>
|Forward shell word                   |<kbd>Alt</kbd><kbd>F</kbd>                 |<kbd>Alt</kbd><kbd>→</kbd> |<kbd>Shift</kbd><kbd>→</kbd>
|Beginning of line                    |<kbd>Ctrl</kbd><kbd>A</kbd>                |<kbd>Home</kbd>            |<kbd>Ctrl</kbd><kbd>X</kbd> <kbd>←</kbd>
|End of line                          |<kbd>Ctrl</kbd><kbd>E</kbd>                |<kbd>End</kbd>             |<kbd>Ctrl</kbd><kbd>X</kbd> <kbd>→</kbd>
|Beginning of buffer                  |<kbd>Alt</kbd><kbd><</kbd>                 |<kbd>PgUp</kbd>            |<kbd>Ctrl</kbd><kbd>X</kbd> <kbd>↑</kbd>
|End of buffer                        |<kbd>Alt</kbd><kbd>></kbd>                 |<kbd>PgDn</kbd>            |<kbd>Ctrl</kbd><kbd>X</kbd> <kbd>↓</kbd>
||
|Backward delete character                  |                                         |<kbd>⌫</kbd>
|Forward delete character                   |                                         |<kbd>⌦</kbd>
|Backward kill [subword](#subword-movement) |<kbd>Ctrl</kbd><kbd>H</kbd>              |<kbd>Ctrl</kbd><kbd>⌫</kbd>                |<kbd>Alt</kbd><kbd>Ctrl</kbd><kbd>⌫</kbd>
|Forward kill [subword](#subword-movement)  |<kbd>Ctrl</kbd><kbd>Alt</kbd><kbd>D</kbd>|<kbd>Ctrl</kbd><kbd>⌦</kbd>                |<kbd>Alt</kbd><kbd>Ctrl</kbd><kbd>⌦</kbd>
|Backward kill shell word                   |<kbd>Ctrl</kbd><kbd>W</kbd>              |<kbd>Alt</kbd><kbd>⌫</kbd>                 |<kbd>Shift</kbd><kbd>⌫</kbd>
|Forward kill shell word                    |<kbd>Alt</kbd><kbd>D</kbd>               |<kbd>Alt</kbd><kbd>⌦</kbd>                 |<kbd>Shift</kbd><kbd>⌦</kbd>
|Backward kill line                         |<kbd>Ctrl</kbd><kbd>U</kbd>              |<kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>⌫</kbd>|<kbd>Ctrl</kbd><kbd>X</kbd> <kbd>⌫</kbd>
|Forward kill line                          |<kbd>Ctrl</kbd><kbd>K</kbd>              |<kbd>Ctrl</kbd><kbd>Shift</kbd><kbd>⌦</kbd>|<kbd>Ctrl</kbd><kbd>X</kbd> <kbd>⌦</kbd>

## Clipboard Viewer
Whenever you use <kbd>yank</kbd> (`^Y` in `emacs`), <kbd>vi-put-after</kbd> (`p` in `vicmd`) or <kbd>vi-put-after</kbd>
(`P` in `vicmd`) to paste a kill into the command line, _Zsh Edit_ will list the contents of your kill ring (including
the cut buffer) below your command line. In addition, _Zsh Edit_ eliminates all duplicate kills from your kill ring.
Thus, each entry listed is guaranteed to be unique.

Furthermore, after pasting, when you use <kbd>yank-pop</kbd> (`^[y` in `emacs`), _Zsh Edit_ will show you which kill is
currently selected, making it easier to cycle to the right one. To view your clipboard at any time – without modifying
your command line – just press <kbd>yank-pop</kbd> by itself.

Finally, _Zsh Edit_ adds a new widget <kbd>reverse-yank-pop</kbd>, which lets you cycle in the opposite direction. It is
bound to `^[Y` in the `emacs` keymap.

## Subword Movement
Zsh's widgets <kbd>forward-word</kbd>, <kbd>backward-word</kbd>, <kbd>kill-word</kbd> and <kbd>backward-kill-word</kbd>
fail to stop on many of the positions that we humans see as word boundaries:
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

_Zsh Edit_ adds new widgets with better parsing rules that can find all the word boundaries that matter to us as humans:

```zsh
# Word boundaries with _Zsh Edit_ 🤗

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
This will change `$WORDCHARS` only for the widgets provided by Zsh Edit.

## Author
© 2020-2021 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
