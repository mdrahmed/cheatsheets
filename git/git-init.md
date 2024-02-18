## Basic git commands
Quickstart git with these initial commands
```
sudo apt install git

## initialize git
git init myrepo 
# or, init inside repo
git init

## Add the files
git add <filename>

## set user info with git config
git config --global user.name "raihan"
git config --global user.email "raihan@example.com"

## commit the file
git commit -m "<put some info about changes>"

## check the changes
git diff <filename>

## change branch name
git branch -M main
git remote add origin <url>

## push to github/gitlab
git push
# or, if branch changed
git push -u origin <branch name>

## Reverting to previous commit 
git log --oneline
# get the hash of the one you want to revert - most recent hash
git revert <hash>
# Add some info like ticket if there is a ticketing system

## clone a repo
git clone <ssh/https link>

## check the url
cat .git/config
# or, do following
git remote -v
```

### Ignore any file
To ignore a file, create a file `.gitignore`, and add filenames to the file.




