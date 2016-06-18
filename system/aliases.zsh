# Easier navigation
# from paulirish dotfiles
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Shortcuts to folders
alias d="cd ~/Dropbox"
alias dl="cd ~/Downloads"

# Automatically list files after cd
alias cd='cdl'

# Use ccat for syntax highlighted cat
alias cat='ccat'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # macOS `ls`
	colorflag="-G"
fi

# List files with -F decorative endings
alias ls='ls -F ${colorflag}'

# List files with -F decorative endings, including hidden files
alias lsa='ls -Fa ${colorflag}'

# List only directories
alias lsd='ls -lF ${colorflag} | grep --color=never "^d"'

# List files long with endings, human readable sizes
alias lsl='ls -hlF ${colorflag}$'

# List files long with endings, human readable sizes, including hidden files
alias lsla='ls -halF ${colorflag}$'

# Enable aliases to be sudo'd
alias sudo='sudo '

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# git shortcuts
alias g='git'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit -m '
alias gca='git commit -am '
alias gd='git diff'
alias go='git checkout '

# Prettyprint path
alias path='echo $PATH | tr -s ":" "\n"'

# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update'
