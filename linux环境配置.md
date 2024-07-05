## linux环境配置

#### neovim

1. 将nvim 配置设置软连接到~/.config/nvim

2. 下载包管理器

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

3. python3安装pynvim

```
python3 -m pip install pynvim
```

4.安装language server——clangd

https://github.com/clangd/clangd/releases

5.安装nerdfont

https://www.nerdfonts.com/font-downloads

选择并下载hasklug，在terminal的preference里面设置字体为hasklug

6. 下载fzf、riggrep

```
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
将~/.fzf.zsh加入到环境变量

# riggrep
curl -LO  https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo dpkg -i ripgrep_12.1.1_amd64.deb

```

7. 下载language server

```
pip3 install pyright cmake-language-server
```

linux 生成的compile_command.json中lp64是不支持的。

#### zsh

1. 下载zsh
2. 将zshrc软链接为~/.zshrc
3. 下载插件
4. 下载fzf

#### Tmux

先看XDG_CONFIG_HOME的值，决定tmux安装在哪

```
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```

tmux create session with name

`tmux new -s session_name`

attach session with session_name or id

`tmux attach-session -t session_name`

kill session with session name

`tmux kill-session -t 0`









