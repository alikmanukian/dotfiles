# clone dotfiles if not exists
DOTFILES_PATH="$HOME/Library/Mobile\ Documents/com~apple~CloudDocs/Development/dotfiles"

if [ ! -d $DOTFILES_PATH ]; then
    mkdir -p $DOTFILES_PATH
    git clone git@github.com:alikmanukian/dotfiles.git $DOTFILES_PATH
fi

# create ~/.dotfiles
if [ ! -L $HOME/.dotfiles ]; then
    ln -sf $DOTFILES_PATH $HOME/.dotfiles
fi

# overwrite
DOTFILES_PATH=$HOME/.dotfiles

# install oh-my-zsh
if [ ! -D $HOME/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    for plugin in "zsh-autosuggestions" "zsh-syntax-highlighting"; do
        git clone https://github.com/zsh-users/$plugin ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin
    done
fi

# create symlink for ~/.ssh
if [ ! -L $HOME/.ssh ]; then
    ln -sf $DOTFILES_PATH/.ssh $HOME/.ssh
fi

# create symlink for ~/.tmux
if [ ! -L $HOME/.tmux ]; then
    ln -sf $DOTFILES_PATH/.tmux $HOME/.tmux
fi

# create symlink for ~/.tmux.conf
if [ ! -L $HOME/.tmux.conf ]; then
    ln -sf $DOTFILES_PATH/.tmux.conf $HOME/.tmux.conf
fi

# create symlink for ~/.vim
if [ ! -L $HOME/.vim ]; then
    ln -sf $DOTFILES_PATH/.vim $HOME/.vim
fi

# create symlink for ~/.vimrc
if [ ! -L $HOME/.vimrc ]; then
    ln -sf $DOTFILES_PATH/.vimrc $HOME/.vimrc
fi

# create symlink for ~/.zprofile
if [ ! if [ -L $HOME/.zprofile ]; then
    ln -sf $DOTFILES_PATH/.zprofile $HOME/.zprofile
fi

# create symlink for ~/.zshrc
if [ ! if [ -L $HOME/.zshrc ]; then
    ln -sf $DOTFILES_PATH/.zshrc $HOME/.zshrc
fi


source $HOME/.zshrc
