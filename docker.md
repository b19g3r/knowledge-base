# Windows docker 设置

- ## 配置加速

  - 阿里云加速

    > 针对安装了 Docker for Windows 的用户，您可以参考以下配置步骤：
    >在系统右下角托盘图标内右键菜单选择 Settings，打开配置窗口后左侧导航菜单选择 Docker Daemon。编辑窗口内的 JSON 串，填写下方加速器地址：
    >
    >```bash
    >{
    >  "registry-mirrors": ["https://some-string.mirror.aliyuncs.com"]
    >}
    >```
    >
    >   编辑完成后点击 Apply 保存按钮，等待 Docker 重启并应用配置的镜像加速器。

  - Docker 中国官方镜像加速

    > 您可以使用以下命令直接从该镜像加速地址进行拉取：
    >
    > ```bash
    > $ docker pull registry.docker-cn.com/myname/myrepo:mytag
    > ```
    >
    > 例如:
    >
    > ```bash
    > $ docker pull registry.docker-cn.com/library/ubuntu:16.04
    > ```

## docker 命令权限问题

  > Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get `http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/json`: dial unix /var/run/docker.sock: connect: permission denied

  ``` bash
  sudo groupadd docker     #添加docker用户组
  sudo gpasswd -a $USER docker     #将登陆用户加入到docker用户组中
  newgrp docker     #更新用户组
  docker ps    #测试docker命令是否可以使用sudo正常使用
  ```

## docker 显示容器 ip

  ``` bash
  docker inspect --format='{{.Name}} - {{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
  ```
