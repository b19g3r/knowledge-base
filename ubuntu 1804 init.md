[TOC]

## init

```bash
sudo vi /etc/apt/sources.list
#:1,$ s/archive.ubuntu.com/mirrors.aliyun.com/g
sudo apt-get update
sudo apt-get upgrade

# install fish
sudo apt-get install fish
chsh -s $(which fish)

# vmware-tools patch
git clone https://github.com/rasa/vmware-tools-patches.git
cd vmware-tools-patches
./patched-open-vm-tools.sh

#install java
mkdir -p /usr/local/java
tar -vzxf jdk.*.tar.gz -C /usr/local/java/
vi /etc/profile
#export JAVA_HOME=/usr/local/java/jdk*
#export CLASSPATH=$:CLASSPATH:$JAVA_HOME/lib/
#export PATH=$PATH:$JAVA_HOME/bin
source /etc/profile
java -version
javac -version
```

>### 使用 apt-get 命令安装 java
>
>```bash
>#添加 ppa
>sudo add-apt-repository ppa:webupd8team/java
>sudo apt-get update
>#安装java
>sudo apt-get install oracle-java8-installer
>```
>
>- 安装器会提示你同意 oracle 的服务条款，选择 ok,然后选择 yes 即可
>
>- 也可以中断操作,然后下载好相应 jdk 的 tar.gz 包，放在 `/var/cache/oracle-jdk8-installer` 下面，然后安装一次 installer，installer 则会默认使用你下载的 tar.gz 包。

## settings

1. 单击dock最小化

   ```bash
   gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
   ```

2. 减少交换空间使用

   ```bash
   #查看
   cat /proc/sys/vm/swappiness
   # 修改,在文件末尾添加 vm.swappiness=10
   gedit admin:///etc/sysctl.conf
   ```

## middle ware

### docker

#### install

>```bash
># step 1: 安装必要的一些系统工具
>sudo apt-get update
>sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
># step 2: 安装GPG证书
>curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
># Step 3: 写入软件源信息
>sudo add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
># Step 4: 更新并安装Docker-CE
>sudo apt-get -y update
>sudo apt-get -y install docker-ce
># 安装指定版本的Docker-CE:
># Step 1: 查找Docker-CE的版本:
># apt-cache madison docker-ce
>#   docker-ce | 17.03.1~ce-0~ubuntu-xenial | http://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial/stable amd64 Packages
>#   docker-ce | 17.03.0~ce-0~ubuntu-xenial | http://mirrors.aliyun.com/docker-ce/linux/ubuntu xenial/stable amd64 Packages
># Step 2: 安装指定版本的Docker-CE: (VERSION例如上面的17.03.1~ce-0~ubuntu-xenial)
># sudo apt-get -y install docker-ce=[VERSION]
>```

#### 加速器

>```bash
>sudo mkdir -p /etc/docker
>sudo tee /etc/docker/daemon.json <<-'EOF'
>{
>      "registry-mirrors": ["https://****.mirror.aliyuncs.com"]
>}
>EOF
>sudo systemctl daemon-reload
>sudo systemctl restart docker
>```

- 使用

```bash
docker search image_name
docker image_name:tag
docker images
docker rmi image_name
docker ps
docker ps -a
docker rm container_name|container_id
docker stop container_name|container_id
docker stop container_name|container_id
docker exec -it container_name|container_id redis-cli|bash|
docker exec -it container_name||container_id sh -c "shell commads"
```

#### docker-mysql

```bash
docker run --name mysql-test1 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag
docker run -it --network some-network --rm mysql mysql -hsome-mysql -uexample-user -p

docker run -p 3306:3306 --name mysqlc -v $PWD/logs:/logs -v $PWD/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d mysql
```

#### redis

```bash
docker run --name redis-test-01 -p 6379:6379 -v $PWD/data:/data  -d redis redis-server --appendonly yes

 docker exec -it redis-test-01 redis-cli
```

### mysql

- install

  ```bash
  sudo apt-get install mysql-server-5.7
  
  sudo apt install mariadb-server
  ```

- init

  ```bash
  # 重启数据库，以创建sock文件
  sudo service mysql restart
  切换到root用户，进入数据库
  su -
  # 输入密码
  mysql
  在mysql> 提示符下创建用户
  # 创建一个名为：admin  密码为：admin  的用户。
  insert into mysql.user(Host,User,authentication_string) values("localhost","admin",password("admin"));
  
  CREATE USER "admin"@"%" IDENTIFIED BY "admin";
  
  # 刷新权限
  flush privileges;
  
  
  # 赋予admin用户所有权限
  GRANT ALL ON *.* TO 'admin'@'%';
  
  
  # 删除用户及所有权限
  DROP USER account;
  在~/.zshrc中设置alias
  alias db='sudo service mysql start'
  注意： mariaDB需要手动创建数据库
  Ubuntu上mariaDB的默认字符集为utf8mb4，兼容utf-8，不需要进行更改。Centos需要设置charset。
  ```
