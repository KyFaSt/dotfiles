
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

## Colors directories a color different than files
# Set CLICOLOR if you want Ansi Colors in iTerm2 
export CLICOLOR=1
# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# bash completion from: http://blog.kramerapps.com/post/40839091386/git-on-osx
# brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# git prompt from: http://blog.kramerapps.com/post/40839091386/git-on-osx
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

# "__git_ps1" adds the current branch to the default prompt in OS X. Made
# available by 'git-prompt.sh' (see previous)
PS1="\h:\W \u\$(__git_ps1 \" (%s) \")\$"

alias be='bundle exec'

function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function clean_branches {
  git branch | grep -v "\*"| grep -v "\master" |  xargs -n 1 git branch -d
}

# ANSI Colors
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

# Prompt
PS1_HOST="\[\e[1;31m\]\u@\h\[\e[0m\]:"
PS1_PROMPT="$ 🐈  "
if [ -z "${SSH_TTY-}" ]; then
    PS1_HOST=''
fi

# parse and colorize terminal prompt 
PS1="$FGRN$PS1_HOST\w $FYEL\$(parse_git_branch)$FRED$PS1_PROMPT$RS"

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Trigger ~/.bashrc commands
. ~/.bashrc

# Source git-completion.bash for git cmd tab completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
