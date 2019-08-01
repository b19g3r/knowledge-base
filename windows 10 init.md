[TOC]

# windwos 10 init steps

## softwares

- ssr
- chrome
- vs code
    - system install
    - add path
    - not add right menu
- IDM
- bandzip
- musictools
- Tecent DeskGo
- `wsl`
    - add to right menu 
- wsl-terminal
    - add to right menu 
- mactype
    - 注册表加载





## commands

- git proxy

```bash
git config --global https.proxy http://127.0.0.1:1080

git config --global https.proxy https://127.0.0.1:1080

git config --global --unset http.proxy

git config --global --unset https.proxy
```

- curl proxy
  - [see](https://linux.cn/article-9223-1.html)

```
curl --socks5 127.0.0.1:1080 https://www.cyberciti.biz/
```

- ssh

``` bash
ssh-keygen -t rsa -C "youremail@example.com"
```




### `wsl`

- [ ] ubuntu on the windows store

- [ ] update the `/etc/apt/sources.list` and update

  `sudo cp sources.list /etc/apt/sources.list`

- [ ] config vim

- [ ] install zsh and oh-my-zsh or fish and oh-my-fish

  `sudo apt install fish`



### scoop

>### Installing Scoop to Custom Directory
>
>Assuming the target directory is `C:\scoop`, in a PowerShell command console, run:
>
>```powershell
>$env:SCOOP='C:\scoop'
>[environment]::setEnvironmentVariable('SCOOP',$env:SCOOP,'User')
>iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
>```
>
>Assuming you didn't see any error messages, Scoop is now ready to run.
>
>### Installing global apps to custom directory
>
>Assuming the target directory is `C:\apps`, in a admin-enabled PowerShell command console, run:
>
>```powershell
>$env:SCOOP_GLOBAL='c:\apps'
>[environment]::setEnvironmentVariable('SCOOP_GLOBAL',$env:SCOOP_GLOBAL,'Machine')
>scoop install -g <app>
>```

- scoop list

```powershell
Installed apps:

  7zip 19.00
  bat 0.11.0
  curl 7.65.3
  git 2.22.0.windows.1
  less 551
  sudo 0.2018.07.25
  vim 8.1.1773
```



## config

### terminal and cmd

- color
    - solorized dark
- software
    - scoop
    - wsl

### environment

```bash
# 修改shell为zsh
chsh -s /bin/zsh
```

## fonts
- Monaco

- powerline fonts

  ```bash
  sudo apt-get install fonts-powerline
  # or install manually
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  ```

  


## fish

### fish shell

To install fish, run the following commands:

```bash
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt-get update
sudo apt-get install fish
```

### oh-my-fish

```bash
curl --socks5 127.0.0.1:1080 -L github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish
```

- omf commands
  - install plugin

    `omf install XXX`

  - change theme

    `omf theme xxx`

  - 

## [zsh](<https://blog.jae.sh/article/zqle60.html>)

```bash
#  安装zsh
apt-get install zsh -y
# 修改shell为zsh
chsh -s /bin/zsh
# 安装oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

# 安装配置 autojump
apt-get install autojump -y
echo '. /usr/share/autojump/autojump.sh'>>~/.zshrc

# 安装 zsh 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
# 编辑 .zshrc, add plugin
 plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

```

```bash
sudo passwd
sudo cp sources.list /etc/apt/sources.list
sudo apt install fish
which fish
chsh -s /usr/bin/fish
curl --socks5 127.0.0.1:1080 -L https://get.oh-my.fish | fish
omf install robbyrussell
```

```bash
sudo apt-get install mariadb-server
sudo service mysql restart
su -
# 输入密码
mysql
# 创建一个名为：admin  密码为：admin  的用户。
insert into mysql.user(Host,User,Password) values("localhost","admin",password("admin"));
# 刷新权限
flush privileges;
# 赋予admin用户所有权限
GRANT ALL ON *.* TO 'admin'@'localhost';
#local login
mysql –uadmin –padmin
#remote login
mysql -uadmin -h127.0.0.1 -padmin
# 删除用户及所有权限
DROP USER account;
```



```bash
#alias begin
alias curl='curl --socks5 127.0.0.1:1080'
alias db='sudo service mysql restart'
#alias end
```

