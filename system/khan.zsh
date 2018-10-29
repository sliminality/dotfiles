# Khan Academy configuration.

# Source sh-agnostic profile
source ~/khan/devtools/khan-dotfiles/.profile.khan

# Source virtualenv for KA
source ~/.virtualenv/khan27/bin/activate

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sarahlim/exec -l /bin/bash/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/sarahlim/exec -l /bin/bash/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sarahlim/exec -l /bin/bash/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/sarahlim/exec -l /bin/bash/google-cloud-sdk/completion.zsh.inc'; fi

# Git aliases
alias go='git co'

