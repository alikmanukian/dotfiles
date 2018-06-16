# bash_profile

export PATH=$PATH:~/.composer/vendor/bin

dockip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

# aliases
alias reload="source ~/.bash_profile"
alias dcm="docker-compose"
alias watch-tree="while; do; clear; tree .; sleep 1; done;"
alias show-hidden-files="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hide-hidden=files="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias tmuxtb="~/dotfiles/tmux/scripts/techbuddy.sh"
alias veoliadb="ssh -L 4000:192.168.50.21:3306 veolia"
