source aliases/git.sh
source aliases/shell.sh


# Function to update the clock
clock() {
  echo -n "[$(date +"%H:%M:%S")]"
}

if [[ "$SHELL_ENV" == "dev" ]]; then
  # Set the Bash prompt, incorporating the git_info
  PS1="\n\[\033[1;94m\]\$(clock) \[\033[1;93m\]\u@\h:\[\033[1;92m\]\w\[\033[2;31m\]\$(git_info) \[\033[0m\]\n$ "
  umask 022
else
  PS1="\n\[\033[1;94m\]\$(clock) \[\033[1;93m\]\u@\h:\[\033[1;92m\]\w\[\033[0m\]\n$ "
fi

