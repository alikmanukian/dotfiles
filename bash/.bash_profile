# bash_profile

export PATH=$PATH:~/.composer/vendor/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/homebrew/opt/php@8.0/bin

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
alias sail="bash vendor/bin/sail"
alias a="sail artisan"
alias pint="./vendor/bin/pint"
alias debug="docker-compose exec -u sail -e XDEBUG_SESSION=1 -e PHP_IDE_CONFIG=\"serverName=MP\" app php artisan"
alias tm="~/dotfiles/scripts/tmux.sh"
alias php7="/opt/homebrew/Cellar/php@7.3/7.3.33_2/bin/php"
alias sublime="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias subl="sublime"

# customized ----------------------------
#
# This enables Zsh to understand commands like docker run -it ubuntu
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
 
autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /opt/homebrew/bin/terraform terraform
 
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=11"
