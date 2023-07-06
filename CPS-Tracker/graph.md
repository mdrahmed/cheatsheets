
### To work with graphs, I can use graphviz or pygraphviz
`graphviz` will not allow me to iterate over nodes but pygraphviz will do that. To install `pygraphviz`, do following,
```
sudo apt-get install graphviz-dev
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install pygraphviz
```


### External cmd's
To remove `python2.7`, I did following,
```
sudo apt-get remove python2.7
sudo apt autoremove
```
