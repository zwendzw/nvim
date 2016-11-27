# Mynvim

First step:  [Installing Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

And clone this .vim file to your nvim folder

```
git clone https://github.com/zhiwenwang/nvim ~/.config/nvim
```
Now you should [ Install vim_plug ](https://github.com/junegunn/vim-plug)
Download plug.vim and put it in the "autoload" directory.

```curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim```

Start neovim in terminal

$ ```nvim```

then

Install plugin
```
:PlugInstall
```
