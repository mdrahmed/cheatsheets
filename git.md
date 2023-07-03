
### To remove large files from git commit 
If the large file was added in the most recent commit, you can just run:

1. `git rm --cached <filename>` to remove the large file, then
2. `git commit --amend -C HEAD` to edit the commit

If the large file was added in an earlier commit, I recommend running an interactive rebase. That means you need to:

1. Run `git log` to find the commit hash of the last commit before you added the large file
2. Then run `git rebase -i <commit hash>`. This will open up an editor where you want to replace pick with edit on the commit where the large file was added.
3. Once you save and close the editor, you’ll be in essentially the same position as if you had added the file in the most recent commit—all you need to do is `git rm --cached <filename>` and `git commit --amend -C HEAD` (same as the “most recent commit” steps)
    Then to finish up, run `git rebase --continue`


### To push large files(>100 mb) inside a repo, use git lfs

```
sudo apt install git-lfs ## to install git-lfs
git lfs install ## Configure Git LFS for the repository
# git lfs track '**/*.txt'i ## to track all .txt files in the current directory and its subdirectories
git lfs track '**/**/*.txt' ## This command will recursively track all .txt files in the current directory and its subdirectories, including subdirectories of subdirectories.
git add .
git commit -m "Configure Git LFS for large files"
git push -u origin main # push it to the main branch
```
If branch `main` is not set then run following cmd's.
```
git branch -M main # initialize branch `main` from `master`
git remote add origin git@github.com:mdrahmed/<repo name>.git # will add the origin of that repo
```

To list all files manages by lfs,
```
git lfs ls-files
```

### To add a submodule -- for some reason, it initially worked but didn't work after that.
I have a folder and want to create this as git repo. But inside this folder I have another repo. In that case, git will not allow me to push. So, I can add that repo using `submodule`,
```
git submodule add <repository-url> <submodule-path> ## use ssh to add the submodule
# git submodule add git@github.com:mdrahmed/Attacking_Phase.git All-new-logs/Analysis
git add .
git commit -m "submodule added"
git push
```

#### To remove the submodule path,
Move it to another folder,
```
git mv <submodule path> <submodule-path>-backup
git mv All-new-logs/Analysis All-new-logs/Analysis_backup
```
Now, add the repo with `ssh`.



