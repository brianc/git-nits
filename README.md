# git-nits
Some bits and bops I use to help me suck less at git


### git squash

Squash all the commits on your feature branch down into a single commit.

### git pr

You need to have [hub](https://github.com/github/hub) installed for `git-pr` to work.

Pushes your feature branch out to `origin` (github)
Opens a pull request from your feature branch on github (uses hub pr)

### git mainline
- Fetches origin/master
- Rebases origin/master into your feature branch
- Squashes your feature branch into a single commit
- Checks out master
- Rebases master on to origin/master
- Does a fast forward only merge of your single commit feature branch onto master
- Does a log to demonstrate which commits you have on master that aren't on origin/master (should just be the single commit that was just merged)

Follow it up with a `git push` when everything looks groovy
