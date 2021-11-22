#!/bin/bash

t_src=/usr/local/bin/tassign/src

mkdir -p $t_src
mv * $t_src

alias tassign='ruby /usr/local/bin/tassign/src/tassign.rb'

zsh=~/.zshrc
bash=~/.bashrc

env=$zsh

case $SHELL in
*/zsh)
    env=$zsh
    ;;
*/bash)
    env=$bash
*)
    echo "$SHELL not supported"
    return
esac

touch $env
echo "source $t_src/call.sh" >> $env
chmod 775 $t_src/call.sh

#case $SHELL in
#*/zsh)
#    if ! test -e $zsh; then
#        touch ~/.zshrc
#    fi
#    echo "source ~$t_src/call.sh" >> $zsh
#    ;;
#*/bash)
#    if ! test -e $bash; then
#        touch ~/.bashrc
#    fi
#    echo "source ~$t_src/call.sh" >> $bash
#    ;;
#*)
#    echo "$SHELL not supported."
#esac
#
#
#
rm -rf ../TAssign
