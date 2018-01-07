NORMAL="\\033[0;39m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"

log() {
  echo "$BLUE > $1 $NORMAL"
}

error() {
  echo ""
  echo "$RED >>> ERROR - $1$NORMAL"
}


createLink() {
    from=$1
    to=$2

    log "Creating symlink to $2"

    if [ -f $2 ]; then
        read -p "Do you want to replace file $2? (y/n) " -n 1 -r 
        echo #
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm $2
            ln -s $1 $2
        fi
        
    fi
}

createLink  `pwd`/vim/.vimrc ~/.vimrc

createLink `pwd`/tmux/.tmux.conf ~/.tmux.conf

createLink `pwd`/bash/.bash_profile ~/.bash_profile

createLink `pwd`/git/.gitconfig ~/.gitconfig


if ! grep ". ~/.bash_profile" ~/.zshrc > /dev/null; then 
echo "
if [ -f ~/.bash_profile ]; then 
    . ~/.bash_profile 
fi" >> ~/.zshrc
fi
