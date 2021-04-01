# Zsh-Edit
Zsh-Edit is a set of powerful extensions to the Zsh command line editor.

## Better (Sub)Word Movement
By default, Zsh's widgets <kbd>forward-word</kbd>, <kbd>backward-word</kbd>, <kbd>kill-word</kbd>
and <kbd>backward-kill-word</kbd> fail to stop on many of the positions that we humans see as word
boundaries:
```zsh
# ZSH default behavior 😭

# With default $WORDCHARS:
      >   >    >          >        >                                    >
% yarn run test:nocoverage --filter resources/test/apps/HiboxMeet.spec.js
  <    <   <    <          <        <
# Skips/deletes _way_ too much.

# With WORDCHARS=''
      >   >    >            >      >         >    >    >         >    >
% yarn run test:nocoverage --filter resources/test/apps/HiboxMeet.spec.js
  <    <   <    <            <      <         <    <    <         <    <
# A bit better, but
#   * does not recognize subwords ('Hibox' and 'Meet') and
#   * forward motion often still skips/deletes too much.
```
With ``, it's somewhat better, but some word boundaries are still missed:

Zsh-Edit upgrades these widgets with better parsing rules that can find all the word boundaries
that matter to us and makes it easily customizable through the `$WORDCHARS` parameter.

```zsh
# With Zsh-Edit 🤩

# With default $WORDCHARS:
     >   >    >          >        >         >    >    >     >   >    >
% yarn run test:nocoverage --filter resources/test/apps/HiboxMeet.spec.js
  <    <   <    <          <        <        <    <    <     <   <    <

# With WORDCHARS=''
      >   >   >          >  >      >        >    >    >     >   >    >
% yarn run test:nocoverage --filter resources/test/apps/HiboxMeet.spec.js
  <    <   <    <            <      <         <    <    <    <    <    <

# With WORDCHARS=' *?_-.~\':
     >   >    >          >        >         >    >    >     >   >    >
% yarn run test:nocoverage --filter resources/test/apps/HiboxMeet.spec.js
  <   <   <     <         <        <          <    <    <    <   <    <
# Cursor to the left of space let's start typing right away, without further fiddling. ✨
```

## Clipboard Viewer
Whenever you <kbd>yank</kbd> (<kbd>Control</kbd><kbd>Y</kbd> by default), Zsh-Edit will list the
contents of your kill ring (including the cut buffer) below your command line. In addition,
Zsh-Edit eliminates all duplicate kills from your kill ring. Thus, each entry listed is
 guaranteed to be unique.

Furthermore, after using <kbd>yank</kbd>, when you use <kbd>yank-pop</kbd>
(<kbd>Alt</kbd><kbd>Y</kbd> by default), Zsh-Edit will show you which kill is currently selected,
making it easier to cycle to the right one. To view your clipboard at any time, without modifying
your command line, just press <kbd>yank-pop</kbd> by itself.

Finally, Zsh-Edit adds a new widget <kbd>reverse-yank-pop</kbd>, which lets you cycle in the
opposite direction. It is bound in the `emacs` keymap (which is the default keymap) to
<kbd>Alt</kbd><kbd>Shift</kbd><kbd>Y</kbd>.

## `bindkey` Extensions
Zsh-Edit extends `bindkey` with the following new options:
```zsh
# List unused keybindings in the main keymap or another one.
% bindkey -u
% bindkey -u -M vicmd

# Bind commands directly to keyboard shortcuts in your .zshrc file.
# What's more, when using these, your current command line will be left intact.
bindkey -c '^S'     'git status --show-stash'
bindkey -c '^G'     'git log'
bindkey -c '^O'     'git log --oneline'
bindkey -c '^[^[OA' 'git push'
bindkey -c '^[^[OB' 'git pull --autostash'

# Look up the names of keys listed by `bindkey`.
% bindkey -n '^[^[OA'
Alt-Up
% bindkey -n '^[^[OB'
Alt-Down
```

## `cd` History Navigation
Zsh-Edit adds the following keyboard shortcuts for quick directory navigation:

| key binding | action |
| --- | --- |
| <kbd>Alt</kbd><kbd>-</kbd> | Backward in dir history |
| <kbd>Alt</kbd><kbd>=</kbd> | Forward in dir history |
| <kbd>Alt</kbd><kbd>`</kbd> | Select from dir history |

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

## Author
© 2020 [Marlon Richert](https://github.com/marlonrichert)

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
