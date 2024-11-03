#!/bin/bash

# clone dotfiles if not exists
ICLOUD_PATH="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
DOTFILES_PATH="$ICLOUD_PATH/Development/dotfiles"

if [ ! -d "$DOTFILES_PATH" ]; then
    mkdir -p "$DOTFILES_PATH"
    git clone git@github.com:alikmanukian/dotfiles.git "$DOTFILES_PATH"
fi

# create ~/Development
if [ ! -L "$HOME/Development" ]; then
    ln -sf "$ICLOUD_PATH/Development" "$HOME/Development"
fi

# create ~/.dotfiles
if [ ! -L "$HOME/.dotfiles" ]; then
    ln -sf "$HOME/Development/dotfiles" "$HOME/.dotfiles"
fi

# overwrite
DOTFILES_PATH="$HOME/.dotfiles"

# install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" & wait

    sleep 1

    for plugin in "zsh-autosuggestions" "zsh-syntax-highlighting"; do
        git clone https://github.com/zsh-users/$plugin ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/$plugin
    done
fi

# create symlink for ~/.ssh
if [ ! -L "$HOME/.ssh" ]; then
    ln -sf "$DOTFILES_PATH/.ss"h "$HOME/.ssh"
fi

# create symlink for ~/.tmux
if [ ! -L "$HOME/.tmux" ]; then
    ln -sf "$DOTFILES_PATH/.tmux" "$HOME/.tmux"
fi

# create symlink for ~/.tmux.conf
if [ ! -L "$HOME/.tmux.conf" ]; then
    ln -sf "$DOTFILES_PATH/.tmux.conf" "$HOME/.tmux.conf"
fi

# create symlink for ~/.vim
if [ ! -L "$HOME/.vim" ]; then
    ln -sf "$DOTFILES_PATH/.vim" "$HOME/.vim"
fi

# create symlink for ~/.vimrc
if [ ! -L "$HOME/.vimrc" ]; then
    ln -sf "$DOTFILES_PATH/.vimrc" "$HOME/.vimrc"
fi

# create symlink for ~/.zprofile
if [ ! -L "$HOME/.zprofile" ]; then
    ln -sf "$DOTFILES_PATH/.zprofile" "$HOME/.zprofile"
fi

# create symlink for ~/.zshrc
if [ ! -L "$HOME/.zshrc" ]; then
    ln -sf "$DOTFILES_PATH/.zshrc" "$HOME/.zshrc"
fi
