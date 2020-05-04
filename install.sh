#!/usr/bin/env bash

sudo apt-get install zsh

chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

for FILE in $DIR/.*; do
    FILENAME="$(basename $FILE)"
    [ -f "$FILE" ] || continue
    [ ! "$FILENAME" == ".gitignore" ] || continue
    [ ! "$FILENAME" == ".gitmodules" ] || continue

    echo "Linking $FILENAME"
    if [[ ! -e "$HOME/$FILENAME.bak" ]]
    then
        $(mv "$HOME/$FILENAME" "$HOME/$FILENAME.bak" &>/dev/null)
    fi

    $(ln -s "$DIR/$FILENAME" "$HOME/$FILENAME" &>/dev/null)
done