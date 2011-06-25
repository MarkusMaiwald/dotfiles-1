function git-current-branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function git-track() {
  remote=${1:-"origin"}
  branch=$(git-current-branch)
  git branch --set-upstream $branch $remote/$branch
}

function git-commits-behind() {
  git rev-list --count --left-only @{upstream}...HEAD
}

function git-commits-ahead() {
  git rev-list --count --right-only @{upstream}...HEAD
}

function git-can-ff() {
  a="$(git rev-parse "$1")" &&
  test "$(git merge-base "$a" "$2")" = "$a"
}
