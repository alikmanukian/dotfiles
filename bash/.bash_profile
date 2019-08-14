# bash_profile

export PATH=$PATH:~/.composer/vendor/bin:/usr/local/bin
export PATH=$PATH:~/Development/flutter/bin
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH=~/.composer/vendor/bin:$PATH

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
alias dstats="docker stats --format \"table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}\""
alias iphone-emulator="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/"
alias android-emulator="~/Library/Android/sdk/emulator/emulator -avd Nexus_5X_API_28 -netdelay none -netspeed full"
alias chdownload="~/Downloads/downloadCourseHunters/download.sh"

# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/alik/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/alik/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/alik/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/alik/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

