#/bin/bash
t_=/usr/local/bin/tassign/
t_src=/usr/local/bin/tassign/src/

if ! test -d $t_src; then
    mkdir -p $t_src
    touch $t_/config.json
    cp -r * $t_src

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
        ;;
    *)
        echo "$SHELL not supported"
        return
    esac

    touch $env
    echo "source $t_src/call.sh" >> $env
    chmod 775 $t_src/call.sh
    $SHELL
else
    echo "TAssign already installed."
    echo "Parsing for holes..."
    cp -r * $t_src
fi
