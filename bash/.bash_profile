# bash_profile

export PATH=$PATH:~/.composer/vendor/bin:/usr/local/bin
export PATH=$PATH:~/Development/flutter/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=~/.composer/vendor/bin:$PATH
export PATH=$PATH:/Users/alik/Library/Python/3.7/bin

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
alias dstats="docker stats --format \"table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\""
alias iphone-emulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias android-emulator="~/Library/Android/sdk/emulator/emulator -avd Nexus_5X_API_28 -netdelay none -netspeed full"
alias chdownload="~/Downloads/downloadCourseHunters/download.sh"
alias papertrail-restart="ssh root@novads papertrail-restart"
