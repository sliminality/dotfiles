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

# Enable aliases to be sudo'd
# alias sudo='sudo '

############################################
# Visual
############################################

# Use ccat for syntax highlighted cat
alias cat='ccat'

# Prettyprint path
alias path='echo $PATH | tr -s ":" "\n"'

############################################
# Utility
############################################

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'

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

############################################
# Chrome
############################################

alias google-chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'


############################################
# SSH
############################################

alias murphy='ssh scl025@murphy.wot.eecs.northwestern.edu'


