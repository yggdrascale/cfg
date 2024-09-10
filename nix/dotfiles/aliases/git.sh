# aliases for git

alias g="git"
alias gs="git status"
alias ga="git add ."
alias gap="git add -p"
alias gb="git branch"
alias gbr="git branch -r"
alias gc="git commit -m"
alias gcl="git clone"
alias gch="git checkout"
alias gi="git init -b main"
alias gm="git commit -am"
alias gs="git status"
alias gp="git push"
alias gbrm='git branch | grep -v "master" | xargs git branch -d'
alias gpu="git push --set-upstream origin"
alias gu="git fetch && git pull --rebase"
alias gz="git archive --format=tar.gz -o main.tar.gz main"

# Show files involved in last commit
alias gslc="git show --pretty="" --name-status HEAD"

gam () {
git add "$1" && git commit -m "$2"
}

git_info() {
    # Check if the current directory is inside a Git repository
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        # Get the current branch name
        local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
        # Check for changes that are staged
        local staged=$(git diff --staged --shortstat 2>/dev/null | tail -n1)
        # Check for changes that are not yet staged
        local changes=$(git diff --shortstat 2>/dev/null | tail -n1)
        # Build the prompt string
        local git_status="(${branch})"
        [[ -n $staged ]] && git_status="${git_status}*"
        [[ -n $changes ]] && git_status="${git_status}+"

        echo " $git_status"
    fi
}

checkout_pr() {
  PR_ID="$1"
  LOCAL_BRANCH_NAME="$2"
  
  # Add the upstream remote repository if it doesn't exist
#  if ! git remote | grep -q 'upstream'; then
#    git remote add upstream git@github.com:NixOS/nixpkgs.git
#  fi

  # Fetch the pull request into a local branch
  git fetch upstream pull/"$PR_ID"/head:"$LOCAL_BRANCH_NAME"

  # Checkout the new local branch
  git checkout "$LOCAL_BRANCH_NAME"
}

