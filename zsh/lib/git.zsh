function git-current-branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function git-track() {
  branch=$(git-current-branch)
  git config branch.$branch.remote origin
  git config branch.$branch.merge refs/heads/$branch
  echo "tracking origin/$branch"
}

function git-can-ff() {
  a="$(git rev-parse "$1")" &&
  test "$(git merge-base "$a" "$2")" = "$a"
}
