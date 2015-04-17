#!/bin/bash
set -e


# the active git branch
get_active_branch()
{
  local branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
  echo "$branch"
}
active_branch=$(get_active_branch)

# a single number representing the number of commits on the active branch since the tip of origin/master
get_change_count()
{
  local current_change_count=$(git log origin/master.. --pretty=oneline | wc -l | sed -e 's/^[ \t]*//')
  echo "$current_change_count"
}

change_count=$(get_change_count)
