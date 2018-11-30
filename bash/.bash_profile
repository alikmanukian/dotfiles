# bash_profile

export PATH=$PATH:~/.composer/vendor/bin:/usr/local/bin
export PATH=$PATH:~/Development/flutter/bin

dockip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

# transfer to coder.am:8085
transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
    curl --progress-bar --upload-file $1 http://coder.am:8085/$(basename $1) >> $tmpfile;
    cat $tmpfile | tee -a ~/.transfers;
    rm -f $tmpfile;
    echo "\n" >> ~/.transfers;
}

# aliases
alias reload="source ~/.bash_profile"
alias dcm="docker-compose"
alias watch-tree="while; do; clear; tree .; sleep 1; done;"
alias show-hidden-files="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hide-hidden=files="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"
alias tmuxtb="~/dotfiles/tmux/scripts/techbuddy.sh"
alias veoliadb="ssh -L 4000:192.168.50.21:3306 veolia"
alias transfer=transfer

alias ssh-staging="ssh-add -D; ssh-add ~/.ssh/accontech; ssh tb-staging;"
alias ssh-io="ssh-add -D; ssh-add ~/.ssh/accontech; ssh tb-io;"
alias ssh-dev1="ssh-add -D; ssh-add ~/.ssh/accontech; ssh tb-dev1;"
alias ssh-dev2="ssh-add -D; ssh-add ~/.ssh/accontech; ssh tb-dev2;"
