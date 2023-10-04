`Conda` can be used to run projects need to use different `python` versions or `tensorflow` versions in different environments, which will help use the same executables I am running in that environment.

### To install `conda`
1. Go to this site [Anaconda user guide](https://docs.conda.io/projects/conda/en/stable/user-guide/install/linux.html) to see how it works and click on [Anaconda installer for Linux.](https://www.anaconda.com/download/).
2. Download it from that site clicking on the [Download](https://repo.anaconda.com/archive/Anaconda3-2023.03-1-Linux-x86_64.sh) option.
3. Now, go to the download directory and do following,
```
chmod +x Anaconda3-2023.03-1-Linux-x86_64.sh # downloaded file <Anaconda....sh>
bash Anaconda3-2023.03-1-Linux-x86_64.sh ## downloaded file <Anaconda....sh>
```
4. Follow the options that will come after running the above cmd,
```
press enter
yes
yes
```
5. Open new terminal
Check if installed with `conda init`

### To remove conda
```
rm -rf ~/anaconda3
rm -rf ~/.condarc ~/.conda ~/.continuum
```
**Also, I will not need this, but if needed I can run this to stop `conda` running at start-up**
```
conda config --set auto_activate_base false
```

**Only to get the bash shell, run following**
```
conda deactivate
```

### Using `cpsenv` for CPS proj
1. To create the environment,
```
conda create -n cpsenv python=3
```
2. Activate env,
```
conda activate cpsenv
```
To deactivate env,
```
conda deactivate
```
To see env list,
```
conda env list
```
3. Install files for the proj
```
conda install graphviz
pip3 install pygraphviz
pip3 install pydot
```
Check if those pkgs are installed or not like this `python3 -c "import pygraphviz"`

If again running into problems saying that `graphviz` is not found, do this,
```
pip3 install graphviz
```

### To remove conda env
```
conda remove --name ENV_NAME --all
```
