__convox_switch() {
  [ -e ~/.convox/rack ] && convox switch || echo unknown;
}
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] \e[0;35m[\$(__convox_switch)]\e[m \r\n\[\e[0;36m\][\t] $\[\e[m\] "

export NVM_DIR="/Users/lkim/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
