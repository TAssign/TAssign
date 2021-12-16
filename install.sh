t_src=/usr/local/bin/tassign/src/
zsh=~/.zshrc
bash=~/.bashrc

if ! test -d $t_src; then
    echo "Installing files to new location $t_src"
    mkdir -p $t_src
    touch $t_/config.json
    cp -r * $t_src

    alias tassign='ruby /usr/local/bin/tassign/src/tassign.rb'

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
    echo Changing file permissions for execution...
    chmod 775 $t_src/call.sh
    "TAssign installed!"
    $SHELL
else
    echo "TAssign already installed."
    echo "Remaking TAssign directories..."
    rm -rf $t_src
    mkdir -p $t_src
    echo "Copying over remaining files..."
    cp -r * $t_src

    case $SHELL in
        */zsh)
            env=$zsh
            ;;
        */bash)
            env=$bash
            ;;
        *)
            echo "$SHELL not supported."
            return
    esac

    echo "Checking if TAssign is correctly sourced in $env"
    if grep -q "source $t_src/call.sh" "$env";
    then
        echo "Checked..."
    else
        echo "Fixing source."
        touch $env
        echo "source $t_src/call.sh" >> $env
        echo Changing file permissions for execution...
        chmod 775 $t_src/call.sh
    fi
    echo "Success!"
    $SHELL
fi
