#!/bin/zsh -f
cd ${0:A:h}
env -i HOME=$( mktemp -d ) PATH=$PATH FPATH=$FPATH /bin/zsh -f -- \
    clitest/clitest  --list-run --progress dot --prompt '%' \
        --pre-flight 'git --version; print $PWD $VENDOR $OSTYPE =zsh $ZSH_VERSION $ZSH_PATCHLEVEL' \
        --diff-options -b \
        -- $PWD/.clitest/*.md
