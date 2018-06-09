############################################
# Navigation shortcuts
############################################

# Easier navigation
# from paulirish dotfiles
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shortcuts to folders
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"

# Tree listing of depth 3
alias tr='tree -L 3'

# List files with -F decorative endings
alias ls='ls -F'

# List files with -F decorative endings, including hidden files
alias lsa='ls -Fa'

# List files long with endings, human readable sizes
alias lsl='ls -hlF'

# List files long with endings, human readable sizes, including hidden files
alias lsla='ls -halF'
alias lsal='ls -halF'

# Alias k
alias k='k -h --no-vcs'

############################################
# Visual
############################################

# Use ccat for syntax highlighted cat
alias cat='ccat'

# Prettyprint path
alias path='echo $PATH | tr -s ":" "\n"'

# tmux requires screen-256colors
alias tmux='tmux -2'
alias tmka='tmux ls | grep : | cut -d. -f1 | awk "{print substr($1, 0, length($1)-1)}" | xargs kill'

############################################
# Utility
############################################

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

# Send a push notification when a job is complete (requires terminal-notifier)
alias tn='terminal-notifier -message'

############################################
# git
############################################

alias g='git'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gcamend='git commit --amend'
alias gcm='git commit -m '
alias gca='git commit -am '
alias gd='git diff'
alias go='git checkout '
alias gr='git rev-parse --show-toplevel'

git() {
  if [[ $@ == "wip" ]]; then
    command git add -u
    command git commit -m "🌱"
  else
    command git "$@"
  fi
}

############################################
# Chrome
############################################

alias google-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias canary='/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary --remote-debugging-port=9222'

############################################
# SSH
############################################

alias murphy='ssh scl025@murphy.wot.eecs.northwestern.edu'
alias hanlon='ssh scl025@hanlon.wot.eecs.northwestern.edu'
alias logine='ssh scl025@login.eecs.northwestern.edu'

############################################
# fasd
############################################

alias v='f -e nvim' # quick opening files with vim
