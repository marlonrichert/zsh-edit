```zsh
% _edit_opts=( extendedglob NO_listbeep NO_shortloops )
% autoload -Uz $PWD/functions/bind
% COLUMNS=40 key= bind -n {'^[','^X'}{$'\C-@'..$'\C-?'}
"^[^@"      Alt-Control-Space
"^[^A"      Alt-Control-A
"^[^B"      Alt-Control-B
"^[^C"      Alt-Control-C
"^[^D"      Alt-Control-D
"^[^E"      Alt-Control-E
"^[^F"      Alt-Control-F
"^[^G"      Alt-Control-G
"^[^H"      Alt-Control-Backspace
"^[^I"      Alt-Tab
"^[^J"      Alt-Enter
"^[^K"      Alt-Control-K
"^[^L"      Alt-Control-L
"^[^M"      Alt-Return
"^[^N"      Alt-Control-N
"^[^O"      Alt-Control-O
"^[^P"      Alt-Control-P
"^[^Q"      Alt-Control-Q
"^[^R"      Alt-Control-R
"^[^S"      Alt-Control-S
"^[^T"      Alt-Control-T
"^[^U"      Alt-Control-U
"^[^V"      Alt-Control-V
"^[^W"      Alt-Control-W
"^[^X"      Alt-Control-X
"^[^Y"      Alt-Control-Y
"^[^Z"      Alt-Control-Z
"^[^["      Alt-Escape
"^[^\\\\"   Alt-Control-\
"^[^]"      Alt-Control-]
"^[^\^"     Alt-Control-^
"^[^_"      Alt-Control-Minus
"^[ "       Alt-Space
"^[!"       Alt-!
"^[\""      Alt-"
"^[#"       Alt-#
"^[\$"      Alt-$
"^[%"       Alt-%
"^[&"       Alt-&
"^['"       Alt-'
"^[("       Alt-(
"^[)"       Alt-)
"^[*"       Alt-*
"^[+"       Alt-Plus
"^[,"       Alt-,
"^[-"       Alt-Minus
"^[."       Alt-.
"^[/"       Alt-/
"^[0"       Alt-0
"^[1"       Alt-1
"^[2"       Alt-2
"^[3"       Alt-3
"^[4"       Alt-4
"^[5"       Alt-5
"^[6"       Alt-6
"^[7"       Alt-7
"^[8"       Alt-8
"^[9"       Alt-9
"^[:"       Alt-:
"^[;"       Alt-;
"^[<"       Alt-<
"^[="       Alt-=
"^[>"       Alt->
"^[?"       Alt-?
"^[@"       Alt-@
"^[A"       Alt-Shift-A
"^[B"       Alt-Shift-B
"^[C"       Alt-Shift-C
"^[D"       Alt-Shift-D
"^[E"       Alt-Shift-E
"^[F"       Alt-Shift-F
"^[G"       Alt-Shift-G
"^[H"       Alt-Shift-H
"^[I"       Alt-Shift-I
"^[J"       Alt-Shift-J
"^[K"       Alt-Shift-K
"^[L"       Alt-Shift-L
"^[M"       Alt-Shift-M
"^[N"       Alt-Shift-N
"^[O"       Alt-Shift-O
"^[P"       Alt-Shift-P
"^[Q"       Alt-Shift-Q
"^[R"       Alt-Shift-R
"^[S"       Alt-Shift-S
"^[T"       Alt-Shift-T
"^[U"       Alt-Shift-U
"^[V"       Alt-Shift-V
"^[W"       Alt-Shift-W
"^[X"       Alt-Shift-X
"^[Y"       Alt-Shift-Y
"^[Z"       Alt-Shift-Z
"^[["       Alt-[
"^[\\\\"    Alt-\
"^[]"       Alt-]
"^[\^"      Alt-^
"^[_"       Alt-_
"^[\`"      Alt-`
"^[a"       Alt-A
"^[b"       Alt-B
"^[c"       Alt-C
"^[d"       Alt-D
"^[e"       Alt-E
"^[f"       Alt-F
"^[g"       Alt-G
"^[h"       Alt-H
"^[i"       Alt-I
"^[j"       Alt-J
"^[k"       Alt-K
"^[l"       Alt-L
"^[m"       Alt-M
"^[n"       Alt-N
"^[o"       Alt-O
"^[p"       Alt-P
"^[q"       Alt-Q
"^[r"       Alt-R
"^[s"       Alt-S
"^[t"       Alt-T
"^[u"       Alt-U
"^[v"       Alt-V
"^[w"       Alt-W
"^[x"       Alt-X
"^[y"       Alt-Y
"^[z"       Alt-Z
"^[{"       Alt-{
"^[|"       Alt-|
"^[}"       Alt-}
"^[~"       Alt-~
"^[^?"      Alt-Backspace
"^X^@"      Control-X + Control-Space
"^X^A"      Control-X + Control-A
"^X^B"      Control-X + Control-B
"^X^C"      Control-X + Control-C
"^X^D"      Control-X + Control-D
"^X^E"      Control-X + Control-E
"^X^F"      Control-X + Control-F
"^X^G"      Control-X + Control-G
"^X^H"      Control-X + Control-Backspace
"^X^I"      Control-X + Tab
"^X^J"      Control-X + Enter
"^X^K"      Control-X + Control-K
"^X^L"      Control-X + Control-L
"^X^M"      Control-X + Return
"^X^N"      Control-X + Control-N
"^X^O"      Control-X + Control-O
"^X^P"      Control-X + Control-P
"^X^Q"      Control-X + Control-Q
"^X^R"      Control-X + Control-R
"^X^S"      Control-X + Control-S
"^X^T"      Control-X + Control-T
"^X^U"      Control-X + Control-U
"^X^V"      Control-X + Control-V
"^X^W"      Control-X + Control-W
"^X^X"      Control-X + Control-X
"^X^Y"      Control-X + Control-Y
"^X^Z"      Control-X + Control-Z
"^X^["      Control-X + Escape
"^X^\\\\"   Control-X + Control-\
"^X^]"      Control-X + Control-]
"^X^\^"     Control-X + Control-^
"^X^_"      Control-X + Control-Minus
"^X "       Control-X + Space
"^X!"       Control-X + !
"^X\""      Control-X + "
"^X#"       Control-X + #
"^X\$"      Control-X + $
"^X%"       Control-X + %
"^X&"       Control-X + &
"^X'"       Control-X + '
"^X("       Control-X + (
"^X)"       Control-X + )
"^X*"       Control-X + *
"^X+"       Control-X + Plus
"^X,"       Control-X + ,
"^X-"       Control-X + Minus
"^X."       Control-X + .
"^X/"       Control-X + /
"^X0"       Control-X + 0
"^X1"       Control-X + 1
"^X2"       Control-X + 2
"^X3"       Control-X + 3
"^X4"       Control-X + 4
"^X5"       Control-X + 5
"^X6"       Control-X + 6
"^X7"       Control-X + 7
"^X8"       Control-X + 8
"^X9"       Control-X + 9
"^X:"       Control-X + :
"^X;"       Control-X + ;
"^X<"       Control-X + <
"^X="       Control-X + =
"^X>"       Control-X + >
"^X?"       Control-X + ?
"^X@"       Control-X + @
"^XA"       Control-X + Shift-A
"^XB"       Control-X + Shift-B
"^XC"       Control-X + Shift-C
"^XD"       Control-X + Shift-D
"^XE"       Control-X + Shift-E
"^XF"       Control-X + Shift-F
"^XG"       Control-X + Shift-G
"^XH"       Control-X + Shift-H
"^XI"       Control-X + Shift-I
"^XJ"       Control-X + Shift-J
"^XK"       Control-X + Shift-K
"^XL"       Control-X + Shift-L
"^XM"       Control-X + Shift-M
"^XN"       Control-X + Shift-N
"^XO"       Control-X + Shift-O
"^XP"       Control-X + Shift-P
"^XQ"       Control-X + Shift-Q
"^XR"       Control-X + Shift-R
"^XS"       Control-X + Shift-S
"^XT"       Control-X + Shift-T
"^XU"       Control-X + Shift-U
"^XV"       Control-X + Shift-V
"^XW"       Control-X + Shift-W
"^XX"       Control-X + Shift-X
"^XY"       Control-X + Shift-Y
"^XZ"       Control-X + Shift-Z
"^X["       Control-X + [
"^X\\\\"    Control-X + \
"^X]"       Control-X + ]
"^X\^"      Control-X + ^
"^X_"       Control-X + _
"^X\`"      Control-X + `
"^Xa"       Control-X + A
"^Xb"       Control-X + B
"^Xc"       Control-X + C
"^Xd"       Control-X + D
"^Xe"       Control-X + E
"^Xf"       Control-X + F
"^Xg"       Control-X + G
"^Xh"       Control-X + H
"^Xi"       Control-X + I
"^Xj"       Control-X + J
"^Xk"       Control-X + K
"^Xl"       Control-X + L
"^Xm"       Control-X + M
"^Xn"       Control-X + N
"^Xo"       Control-X + O
"^Xp"       Control-X + P
"^Xq"       Control-X + Q
"^Xr"       Control-X + R
"^Xs"       Control-X + S
"^Xt"       Control-X + T
"^Xu"       Control-X + U
"^Xv"       Control-X + V
"^Xw"       Control-X + W
"^Xx"       Control-X + X
"^Xy"       Control-X + Y
"^Xz"       Control-X + Z
"^X{"       Control-X + {
"^X|"       Control-X + |
"^X}"       Control-X + }
"^X~"       Control-X + ~
"^X^?"      Control-X + Backspace
% COLUMNS=40 key= bind -n '^['{\[,O}{{A..D},F,H,Z}
"^[[A"      Up
"^[[B"      Down
"^[[C"      Right
"^[[D"      Left
"^[[F"      End
"^[[H"      Home
"^[[Z"      Shift-Tab
"^[OA"      Up
"^[OB"      Down
"^[OC"      Right
"^[OD"      Left
"^[OF"      End
"^[OH"      Home
"^[OZ"      Shift-Tab
% COLUMNS=40 key= bind -n '^[[1;'{2..16}{A,B,C,D,F,H}
"^[[1;2A"    Shift-Up
"^[[1;2B"    Shift-Down
"^[[1;2C"    Shift-Right
"^[[1;2D"    Shift-Left
"^[[1;2F"    Shift-End
"^[[1;2H"    Shift-Home
"^[[1;3A"    Alt-Up
"^[[1;3B"    Alt-Down
"^[[1;3C"    Alt-Right
"^[[1;3D"    Alt-Left
"^[[1;3F"    Alt-End
"^[[1;3H"    Alt-Home
"^[[1;4A"    Alt-Shift-Up
"^[[1;4B"    Alt-Shift-Down
"^[[1;4C"    Alt-Shift-Right
"^[[1;4D"    Alt-Shift-Left
"^[[1;4F"    Alt-Shift-End
"^[[1;4H"    Alt-Shift-Home
"^[[1;5A"    Ctrl-Up
"^[[1;5B"    Ctrl-Down
"^[[1;5C"    Ctrl-Right
"^[[1;5D"    Ctrl-Left
"^[[1;5F"    Ctrl-End
"^[[1;5H"    Ctrl-Home
"^[[1;6A"    Ctrl-Shift-Up
"^[[1;6B"    Ctrl-Shift-Down
"^[[1;6C"    Ctrl-Shift-Right
"^[[1;6D"    Ctrl-Shift-Left
"^[[1;6F"    Ctrl-Shift-End
"^[[1;6H"    Ctrl-Shift-Home
"^[[1;7A"    Ctrl-Alt-Up
"^[[1;7B"    Ctrl-Alt-Down
"^[[1;7C"    Ctrl-Alt-Right
"^[[1;7D"    Ctrl-Alt-Left
"^[[1;7F"    Ctrl-Alt-End
"^[[1;7H"    Ctrl-Alt-Home
"^[[1;8A"    Ctrl-Alt-Shift-Up
"^[[1;8B"    Ctrl-Alt-Shift-Down
"^[[1;8C"    Ctrl-Alt-Shift-Right
"^[[1;8D"    Ctrl-Alt-Shift-Left
"^[[1;8F"    Ctrl-Alt-Shift-End
"^[[1;8H"    Ctrl-Alt-Shift-Home
"^[[1;9A"    Meta-Up
"^[[1;9B"    Meta-Down
"^[[1;9C"    Meta-Right
"^[[1;9D"    Meta-Left
"^[[1;9F"    Meta-End
"^[[1;9H"    Meta-Home
"^[[1;10A"   Meta-Shift-Up
"^[[1;10B"   Meta-Shift-Down
"^[[1;10C"   Meta-Shift-Right
"^[[1;10D"   Meta-Shift-Left
"^[[1;10F"   Meta-Shift-End
"^[[1;10H"   Meta-Shift-Home
"^[[1;11A"   Meta-Alt-Up
"^[[1;11B"   Meta-Alt-Down
"^[[1;11C"   Meta-Alt-Right
"^[[1;11D"   Meta-Alt-Left
"^[[1;11F"   Meta-Alt-End
"^[[1;11H"   Meta-Alt-Home
"^[[1;12A"   Meta-Alt-Shift-Up
"^[[1;12B"   Meta-Alt-Shift-Down
"^[[1;12C"   Meta-Alt-Shift-Right
"^[[1;12D"   Meta-Alt-Shift-Left
"^[[1;12F"   Meta-Alt-Shift-End
"^[[1;12H"   Meta-Alt-Shift-Home
"^[[1;13A"   Ctrl-Meta-Up
"^[[1;13B"   Ctrl-Meta-Down
"^[[1;13C"   Ctrl-Meta-Right
"^[[1;13D"   Ctrl-Meta-Left
"^[[1;13F"   Ctrl-Meta-End
"^[[1;13H"   Ctrl-Meta-Home
"^[[1;14A"   Ctrl-Meta-Shift-Up
"^[[1;14B"   Ctrl-Meta-Shift-Down
"^[[1;14C"   Ctrl-Meta-Shift-Right
"^[[1;14D"   Ctrl-Meta-Shift-Left
"^[[1;14F"   Ctrl-Meta-Shift-End
"^[[1;14H"   Ctrl-Meta-Shift-Home
"^[[1;15A"   Ctrl-Meta-Alt-Up
"^[[1;15B"   Ctrl-Meta-Alt-Down
"^[[1;15C"   Ctrl-Meta-Alt-Right
"^[[1;15D"   Ctrl-Meta-Alt-Left
"^[[1;15F"   Ctrl-Meta-Alt-End
"^[[1;15H"   Ctrl-Meta-Alt-Home
"^[[1;16A"   Ctrl-Meta-Alt-Shift-Up
"^[[1;16B"   Ctrl-Meta-Alt-Shift-Down
"^[[1;16C"   Ctrl-Meta-Alt-Shift-Right
"^[[1;16D"   Ctrl-Meta-Alt-Shift-Left
"^[[1;16F"   Ctrl-Meta-Alt-Shift-End
"^[[1;16H"   Ctrl-Meta-Alt-Shift-Home
% COLUMNS=40 key= bind -n '^[['{5,6}\;{2..16}\~
"^[[5;2~"    Shift-PageUp
"^[[5;3~"    Alt-PageUp
"^[[5;4~"    Alt-Shift-PageUp
"^[[5;5~"    Ctrl-PageUp
"^[[5;6~"    Ctrl-Shift-PageUp
"^[[5;7~"    Ctrl-Alt-PageUp
"^[[5;8~"    Ctrl-Backspace
"^[[5;9~"    Meta-PageUp
"^[[5;10~"   Meta-Shift-PageUp
"^[[5;11~"   Meta-Alt-PageUp
"^[[5;12~"   Meta-Alt-Shift-PageUp
"^[[5;13~"   Ctrl-Meta-PageUp
"^[[5;14~"   Ctrl-Meta-Shift-PageUp
"^[[5;15~"   Ctrl-Meta-Alt-PageUp
"^[[5;16~"   Ctrl-Meta-Alt-Shift-PageUp
"^[[6;2~"    Shift-PageDown
"^[[6;3~"    Alt-PageDown
"^[[6;4~"    Alt-Shift-PageDown
"^[[6;5~"    Ctrl-PageDown
"^[[6;6~"    Ctrl-Shift-PageDown
"^[[6;7~"    Ctrl-Alt-PageDown
"^[[6;8~"    Ctrl-Shift-Backspace
"^[[6;9~"    Meta-PageDown
"^[[6;10~"   Meta-Shift-PageDown
"^[[6;11~"   Meta-Alt-PageDown
"^[[6;12~"   Meta-Alt-Shift-PageDown
"^[[6;13~"   Ctrl-Meta-PageDown
"^[[6;14~"   Ctrl-Meta-Shift-PageDown
"^[[6;15~"   Ctrl-Meta-Alt-PageDown
"^[[6;16~"   Ctrl-Meta-Alt-Shift-PageDown
%
```
