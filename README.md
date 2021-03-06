# git-nits
Some bits and bops I use to help me suck less at git.  These commands assume the `origin` remote for your repo is your main github repository. Also, they assume you're active branch is a feature branch. Do not run them on the `master` branch directly.  You need to have `$EDITOR` set.  These commands use `set -e` so if anything fails they wont continue.

The basic flow is like this...

```bash
# start a feature
git checkout -b my-feature-branch
# do some work
git commit -am "WIP"
# do some more work
git commit -am "More WIP"
# open a PR on github with the current branch
git pr
# incorporate feedback
git commit -am "Incorporate feedback"
git push
# PR is approved
git mainline
# make sure my master looks good
git push origin master
```

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
- force pushes your feature branch back to origin (github)
- Checks out master
- Rebases master on to origin/master
- Does a fast forward only merge of your single commit feature branch onto master
- Does a log to demonstrate which commits you have on master that aren't on origin/master (should just be the single commit that was just merged)

Follow it up with a `git push` when everything looks groovy. Because the squashed feature was pushed to github once you push to master that commit landing will close your pull request for you.
