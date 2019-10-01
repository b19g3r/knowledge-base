### 设置多个 git 账号

- generate and test

```bash
#generate
ssh-keygen -t rsa -b 4096 -C "b19g3r@gmail.com"
ssh-keygen -t rsa -b 4096 -C "878826589@qq.com"
ssh-keygen -t rsa -b 4096 -C "xingxuntao_qd@caxins.com"

#test
ssh -T git@github.com
ssh -T git@gitee.com
ssh -T git@10.10.8.201
```

- create file named `.ssh/config ` 

```config
# 配置github.com
Host github.com                 
	HostName github.com
	IdentityFile  C:\Users\Shane\.ssh\id_rsa
#   IdentityFile  /home/shane/.ssh/id_rsa
	PreferredAuthentications publickey
	User b19g3r

# 配置 comp git 
Host 10.10.8.201 
	HostName 10.10.8.201
	IdentityFile C:\Users\Shane\.ssh\id_rsa_comp_git
#   IdentityFile /home/shane/.ssh/id_rsa_comp_git    
	PreferredAuthentications publickey
	User b19g3r

# gitee 码云
Host gitee.com
	HostName gitee.com
	IdentityFile C:\Users\Shane\.ssh\id_rsa_gitee
#   IdentityFile /home/shane/.ssh/id_rsa_gitee
	PreferredAuthentications publickey
	User b19g3r
```



## git proxy

```bash
git config --global http.proxy http://127.0.0.1:1080
git config --global https.proxy https://127.0.0.1:1080

git config --global --unset http.proxy
git config --global --unset https.proxy
```

