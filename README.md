# beginner_test
**一、安装Git**

1. 在Linux上安装Git：

在终端中输入：

```shell
sudo apt-get install git
```

键入用户密码即可

2. 在Windows上安装Git:

   在网盘中下载 [Git安装包](https://pan.baidu.com/s/1kU5OCOB#list/path=%2Fpub%2Fgit)

然后按默认选项安装即可。

**二、Git 配置**

安装完成后，还需要进行设置，在命令行输入：

```shell
git config --global user.name "Your Name" 
```

```Shell
git config --global user.email "email@example.com" 
```

*注："Your Name" 和 "email@example.com" 填写实际信息*

**三、GitHub 配置**

1. 注册 GitHub 账号，访问 [GitHub](github.com) 官网进行注册
2. 由于你的本地 Git 仓库和 GitHub 仓库之间的传输是通过 SSH 加密的，所以，需要一点设置：

第 1 步：创建 SSH Key。在用户主目录下，看看有没有 .ssh 目录，如果有，再看看这个目录下有没有 id_rsa 和 id_rsa.pub 这两个文件，如果已经有了，可直接跳到下一步。如果没有，打开 Shell（Windows下打开Git Bash），创建 SSH Key：

```shell
ssh-keygen -t rsa -C"youremail@example.com"
```

你需要把邮件地址换成你自己的邮件地址，然后一路回车，使用默认值即可。

如果一切顺利的话，可以在用户主目录里找到 .ssh 目录（可能被隐藏，系统更改设置为显示隐藏文件，Ubuntu下快捷键 ctrl+h），里面有 id_rsa 和 id_rsa.pub 两个文件，这两个就是 SSH Key 的秘钥对。

第 2 步：登陆GitHub，打开“Account settings”，“SSH Keys”页面：

然后，点“Add SSH Key”，填上任意 Title，在 Key 文本框里粘贴 id_rsa.pub 文件的内容：

![](https://raw.githubusercontent.com/BITUGV/beginner_test/master/pic/add.png)

点“Add Key”，你就应该看到已经添加的 Key

四、联系管理员添加进 contributor

​	将GitHub账号发给陈泰然，添加进 contributor

五、fork代码库

添加 contributor 成功后，进入 [beginner_test库](https://github.com/BITUGV/BITFSAC) 进行测试，点击 Fork ，即可将代码库 clone 到自己的代码库，可以在自己的代码库自由修改代码。

![](https://raw.githubusercontent.com/BITUGV/beginner_test/master/pic/fork.png)

如需提交代码，则在页面中提出 Pull request

![](https://raw.githubusercontent.com/BITUGV/beginner_test/master/pic/pr.png)

**五、克隆远程库**

现在，GitHub已经配置好了，下一步是用命令 git clone 克隆一个本地库：

```shell
git clone git@github.com:Your Github Name/beginner_test.git
```

具体 Git 命令教程查看网络上的 [教程](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

