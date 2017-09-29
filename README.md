1. install vim
2. make .vim dir
3. clone files into .vim
4. create symbolic link to the vimrc
5. install plugins
```
apt-get install vim
mkdir ~/.vim
git clone https://github.com/liamaharon/dotvim.git ~/.vim
ln ~/.vim/vimrc ~/.vimrc
vim ~/.vim/vimrc
:PlugInstall
```
