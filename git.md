
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

