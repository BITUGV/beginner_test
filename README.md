# beginner_test
## 目录

<ul type="disc">
<li><a href="#C1"> Git 安装及 GitHub 配置</a></li>
<li>
    <a href="#C2">自动化 Bash 脚本安装</a>
    <ul>
        <li><a href="#C2">基本依赖安装</a></li>
        <li><a href="#C2">ROS安装</a></li>
    </ul>
</li>
<li><a href="#C3">CLion IDE 安装</a></li>
</ul> 

<a name="C1"><h2> Git 安装及 GitHub 配置</h2></a>

**一、安装Git**

1. 在 Ubuntu 上安装 Git：

在终端中输入：

```shell
sudo apt-get install git
```

键入用户密码即可

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

第 1 步：创建 SSH Key。在用户主目录下，看看有没有 .ssh 目录，如果有，再看看这个目录下有没有 id_rsa 和 id_rsa.pub 这两个文件，如果已经有了，可直接跳到下一步。如果没有，打开终端，创建 SSH Key：

```shell
ssh-keygen -t rsa -C"youremail@example.com"
```

你需要把邮件地址换成你自己的邮件地址，然后一路回车，使用默认值即可。

如果一切顺利的话，可以在用户主目录里找到 .ssh 目录（可能被隐藏，系统更改设置为显示隐藏文件，Ubuntu下快捷键 ctrl+h），里面有 id_rsa 和 id_rsa.pub 两个文件，这两个就是 SSH Key 的秘钥对。

第 2 步：登陆GitHub，打开“Account settings”，“SSH Keys”页面：

然后，点“Add SSH Key”，填上任意 Title，在 Key 文本框里粘贴 id_rsa.pub 文件的内容：

![](https://raw.githubusercontent.com/BITUGV/beginner_test/master/pic/add.png)

点“Add Key”，你就应该看到已经添加的 Key

**四、联系管理员添加进 contributor**

​	将GitHub账号发给陈泰然，添加进 contributor

**五、克隆远程库**

现在，GitHub已经配置好了，下一步是用命令 git clone 克隆一个本地库：

打开终端，用 cd 命令切换到一个方便的文件夹，之后输入：

```shell
git clone git@github.com:BITUGV/beginner_test.git
```

**六、创建分支**

GitHub 仓库默认有一个 master 的分支，当我们在 master 分支开发过程中有一个新的功能需求，我们就可以新建一个分支同步开发而互不影响，开发完成后，再合并 merge 到主分支 master 上。

打开终端切换到本地仓库目录下，输入：

```shell
git checkout -b <name> (此处填写分支名字,例如 dev )
```

即可创建并切换到 dev 分支，或者：

```shell
git branch dev       //创建分支'dev'
git checkout dev     //切换分支'dev'
```

其他常用命令：

```shell
git branch           //查看当前分支
git merge dev        //将 'dev'分支合并到当前分支
git branch -d dev    //删除'dev'分支
git push origin dev  //提交'dev'分支的修改
```

**最后**：具体的 Git 命令教程请查看网络上的 [廖雪峰 Git 教程](https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000)

<a name="C2"><h2>自动化脚本安装</h2></a>

打开终端，用 cd 命令切换到该代码库的文件夹中，执行bash文件

```shell
./install_dependencies.bash         //安装基本依赖
./ros_install.bash                  //安装ROS
```

<a name="C3"><h2>CLion IDE 安装</h2></a>

CLion 被广泛用于ROS_package的开发中，这里提供一个通过申请学生版的免费安装教程。

登陆  [JetBrains官网](https://www.jetbrains.com/zh/student/)，点击立即申请，填写相关信息，邮箱填写edu邮箱，之后即可免费下载CLion。

![](https://raw.githubusercontent.com/BITUGV/beginner_test/master/pic/register.png)

安装完成后在 /usr/share/applications 中修改 jetbrains-clion.desktop 文件

修改

```shell
Exec="/home/clion-2016.2/bin/clion.sh" %f
```

为

```shell
Exec=bash -i -c "/home/clion-2016.2/bin/clion.sh" %f
```

即添加 bash -i -c

这样即可，编辑好源文件后。修改CMakeLists.txt，添加package依赖项，就可以进行编译了。