---
title: Hexo 搭配 GitHub 建立博客, 选用 nexT 主题
date: 2021-04-26 19:21:20
categories:
  - [兴趣, 网站, 博客]
tags:
  - Hexo
  - Git
password: 
top: 100
typora-root-url: ..
---

{% cq %}整理网上的Next优化方法,外加写一份文章

感觉博客还行,不再羡慕别人的主题了

特效全开,跟开了吃鸡一样,电脑呼呼的

看了下建站时间,花了23天整,为了一个工具,感觉血亏

等学习前端知识以后再改吧,现在先用着{% endcq %}



# Hexo 博客搭建

Hexo是一款基于Node.js的静态博客框架，依赖少易于安装使用，可以方便的生成静态网页托管在GitHub上.

因为Hexo的创建者是台湾人，对中文的支持很友好，可以选择中文进行查看。

官网: [hexo官网](https://hexo.io/zh-cn/)

<!-- more -->

## 安装 Git

pass

### 参考:

1. [Git - Book (git-scm.com)](https://git-scm.com/book/zh/v2)
2. [超详细Git 安装教程(Windows)_eno_yang的博客-CSDN博客_git安装](https://blog.csdn.net/eno_yang/article/details/114782695)



## Git 代码备份

{% spoiler "<strong>主要是一些为源文件备份的代码,用于<code>git push</code></strong>" %}

```bash
npm install -g hexo-cli
hexo init MyBlog
cd MyBlog
npm install
hexo generate
hexo server

git config --global user.name "yourname"
git config --global user.email "youremail"
git config user.name
git config user.email
ssh-keygen -t rsa -C "youremail"
ssh -T git@github.com

deploy:
  type: git
  repo: <repository url> #https://bitbucket.org/JohnSmith/johnsmith.bitbucket.io
  branch: [branch]
  message: [message]
npm install hexo-deployer-git --save
hexo clean
hexo generate
hexo deploy

git branch newbranch
git branch
git checkout newbranch
git add .
git commit -a
git status
git checkout source
git merge newbranch
git diff
git push -u origin source
git branch -D newbranch

git init
git add .
git commit -m "20210423手动push"
git branch -M source
git remote add origin https://github.com/Liuzh25/Liuzh25.github.io.git
git push -u origin source
git push origin source --force

git branch -a
git push origin --delete new
```

{% endspoiler %}



## 安装nodejs

pass


### 参考:

1. [Node.js 中文网 ](http://nodejs.cn/)



## 安装hexo

选择准备安装的目录,打开`git bash`,输入

```bash
//全局安装
npm install -g hexo-cli
//查看一下版本
hexo -v

//初始化hexo, 即创建"myblog"文件夹并添加相关文件
hexo init myblog//创建文件夹
cd myblog //进入这个myblog文件夹
npm install//添加相关文件
hexo g//生成文件
hexo s//本地浏览
```

打开hexo的服务，在浏览器输入localhost:4000就可以看到你生成的博客了。



## GitHub创建个人仓库

创建一个和你用户名相同的仓库，[后面加.github.io](http://xn--yfr16an19l.github.io/)，只有这样，将来要部署到GitHub page的时候，才会被识别.

![new_repository](/images/new_repository.jpg)



## 生成SSH添加到GitHub

ssh，简单来讲，就是一个秘钥，其中，id_rsa是你这台电脑的私人秘钥，不能给别人看的，id_rsa.pub是公共秘钥，可以随便给别人看。把这个公钥放在GitHub上，这样当你链接GitHub自己的账户时，它就会根据公钥匹配你的私钥，当能够相互匹配时，才能够顺利的通过git上传你的文件到GitHub上。

打开`git bash`,输入

```bash
git config --global user.name "yourname"
git config --global user.email "youremail"
```


这里的yourname输入你的GitHub用户名，youremail输入你GitHub的邮箱。这样GitHub才能知道你是不是对应它的账户。

检查一下你有没有输对

```bash
git config user.name
git config user.email
```

创建SSH,一路回车即可

~~~bash
ssh-keygen -t rsa -C "youremail"
~~~

打开`C:\Users\用户\.ssh\id_rsa.pub`, 复制内容

在github的用户设置里,找到`SSH and GPG keys`,点击`New SSH key`

![new_SSH](/images/new_SSH.jpg)

**Title**随意,将复制内容填入Key,点击`New SSH key`

查看是否成功

```bash
ssh -T git@github.com
```

### 参考:

1. [ hexo史上最全搭建教程_Fangzh的技术博客-CSDN博客_hexo](https://blog.csdn.net/sinat_37781304/article/details/82729029)



## 将hexo部署到GitHub

打开`myblog`文件夹下的**站点配置文件**`_config.yml`

找到代码并修改

```yaml
deploy:
  type: git
  repo: https://github.com/YourgithubName/YourgithubName.github.io.git
  branch: master
```

`repo:` 仓库名,可直接在你创建的仓库复制,有三种,复制后粘贴即可

![repo](/images/repo.jpg)

`branch:`准备部署的分支,一般使用`main`,可随意填写

如下为我的配置

```yaml
# Deployment
## Docs: https://hexo.io/docs/one-command-deployment
deploy:
  type: git
  repo: git@github.com:Liuzh25/Liuzh25.github.io.git,main
```

安装deploy-git ，也就是部署的命令,这样你才能用命令部署到GitHub

```bash
npm install hexo-deployer-git --save
```

部署命令

```bash
hexo clean
hexo generate
hexo deploy
```

其中 `hexo clean`清除了你之前生成的东西，也可以不加。
`hexo generate` 顾名思义，生成静态文章，可以用 `hexo g`缩写
`hexo deploy` 部署文章，可以用`hexo d`缩写

注意第一次deploy时可能要你输入username和password。



## 等待

进入 `http://yourname.github.io` ,如果显示为空白,**而不是404**,说明你已经部署成功,请等待**1-4小时**



## 设置个人域名(了解)

注册一个阿里云账户,在阿里云上买一个域名

**实名认证**

在域名控制台点**解析**进去

添加如下

![域名](/images/yuming.jpg)

即将**`www.jxxb.top`**和**`jxxb.top`**均指向`yourname.github.io`

**不推荐指向IP地址**

然后,修改**github仓库**设置如下

![连接](/images/lianjie.jpg)

最后一步

```bash
hexo clean
hexo g
hexo d
```



## 写文章

Hexo支持`makedown`语言,这是一种轻量级的标记语言,类似于`html`,为你的文章添加文字格式及图片,音频,链接等,文件名后缀`.md`

语法可在[Markdown 中文网](http://markdown.p2hp.com/)或者[Markdown 教程 | 菜鸟教程](https://www.runoob.com/markdown/md-tutorial.html)查看

推荐使用**Typora**文本编辑器

在`git bash`输入下列代码

```bash
hexo new abc
```

即在`\myblog\source\_posts`文件夹下创建`abc.md`文件并预先输入信息

使用**文本编辑器**或者**记事本**打开编辑即可

编辑完毕,部署至网页

```bash
hexo clean
hexo g
hexo d
```

### 参考:

1. [Markdown 中文网](http://markdown.p2hp.com/)
2. [Typora官网](https://typora.io/)




# 安装NexT

##　安装「主题」

在 `/myblog` 启动**Git bash**

```bash
git clone https://github.com/theme-next/hexo-theme-next themes/next
```



## 启用「主题」

编辑 **站点配置文件 _config.yml **(位于根目录)

~~~yaml
theme: next
~~~

将**Hexo 站点配置文件**（`/_config.yml`）与 **NexT主题配置文件**(`/themes/next/_config.yml`)**备份**



## 将主题配置文件独立出来

**hexo-next**的更新不够人性化,且 **Hexo 站点配置文件**（`/_config.yml`）与 **NexT主题配置文件**(`/themes/next/_config.yml`)的割裂使得配置时体验也不算太好

因此现在有四种配置方法,参考官方文档[DATA-FILES.md ](https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/DATA-FILES.md)

1. 直接在**Hexo 站点配置文件**和**NexT主题配置文件**内编写

   优点: 当在本地预览(`hexo s`)时,更改后可实时查看,不需要再操作`git bash`(退出本地预览并再次进入)

2. NexT主题配置文件内**`override: false`（默认）**,从**站点配置文件**和**主题配置文件**中复制你需要更改的条目至`/myblog/source/_data/next.yml`,**如果没有就新建,通常是没有的**.

   缺点: 某些插件只能从**站点配置文件读取选项**

3. NexT主题配置文件内**`override: false`**改为**`true`**,将**主题配置文件**中全部内容复制到**`next.yml`**,在**Hexo 站点配置文件**和**next.yml**内编写

4. 确认**`next.yml`**文件不存在,**存在要删除或改名**,然后将**站点配置文件**和**主题配置文件**中复制的你需要更改的条目,即**方法2**的内容向右移两个空格,在这些参数最上方添加一行 `theme_config:`,放置于**站点配置文件**末尾.如下

   ```yaml
   # Deployment
   ## Docs: https://hexo.io/docs/one-command-deployment
   deploy:
     type: git
     repo: git@github.com:Liuzh25/Liuzh25.github.io.git,main
   
   theme_config:
   
   
     # 自定义文件
     custom_file_path:
       #head: source/_data/head.swig
       #header: source/_data/header.swig
       #sidebar: source/_data/sidebar.swig
       #postMeta: source/_data/post-meta.swig
       #postBodyEnd: source/_data/post-body-end.swig
       #footer: source/_data/footer.swig
       #bodyEnd: source/_data/body-end.swig
       #variable: source/_data/variables.styl
       #mixin: source/_data/mixins.styl
       style: source/_data/styles.styl
     
     # ---------------------------------------------------------------
     # 网站信息设置
     # ---------------------------------------------------------------
     
     # 头像
     favicon:
       small: /uploads/favicon-16x16-next.png
       medium: /uploads/favicon-32x32-next.png
   ```

   **推荐使用方法2或4**,这里我使用的**方法2**,并且只将**主题配置文件**复制到**`next.yml`**

### 参考:

1. [hexo-theme-next/DATA-FILES.md at master · theme-next/hexo-theme-next](https://github.com/theme-next/hexo-theme-next/blob/master/docs/zh-CN/DATA-FILES.md)



## 编辑站点配置文件

编辑下列代码如下所示

```yaml
# Site
title: 机械细胞
subtitle: 三十功名尘与土，八千里路云和月
description: 三十功名尘与土，八千里路云和月
keywords: 个人,博客
author: 谨礼
language: zh-CN
timezone: Asia/Shanghai

# URL
## Set your site url here. For example, if you use GitHub Page, set url as 'https://username.github.io/project'
url: https://www.jxxb.top
```

### 参考:

1. [Hexo+NexT（二）：Hexo站点配置详解_Guide2IT-CSDN博客](https://blog.csdn.net/loze/article/details/94209583)
2. [hexo _config.yml站点配置文件说明_猫狗记-CSDN博客](https://blog.csdn.net/weixin_42148729/article/details/114457383)



# 博客个性化初试

## GitHub Corners「图标角」

~~粘贴代码到`themes/next/layout/_layout.swig`文件中(放在`<div class="headband"></div>`的下面)，并把`href`改为你的github地址,将`style="fill:#151513; color:#fff`改为你喜欢的颜色.~~

最新版本NexT主题支持**`GitHub Corners`**

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

~~~yaml
# GitHub corner.
github_banner:
  enable: true
  permalink: https://github.com/Liuzh25
  title: 欢迎访问我的GitHub主页
~~~

编辑后发现在网页右上角,且颜色为黑白色,准备更改

按F12后如下图

![corner](/images/github.jpg)

用红圈内按键指向**`GitHub Corners`**,显示如下

![corner](/images/github1.jpg)

点击`mian.css:1180`,打开`mian.css`,复制如下代码

~~~css
.github-corner svg {
  border: 0;
  color: #fff;
  fill: #222;
  position: absolute;
  right: 0;
  top: 0;
  z-index: 1000;
}
~~~

打开[GitHub Corners (tholman.com)](https://tholman.com/github-corners/#),对比代码,会发现右边和左边的区别是

```diff
- right: 0;
+ left: 0;
+ transform: scale(-1, 1);
```

编辑**`/myblog/source/_data/styles.styl`**文件添加下列代码

```css
.github-corner svg {
  border: 0;
  color: #fff;
  fill: #FD6C6C;
  position: absolute;
  left: 0;
  transform: scale(-1, 1);
  top: 0;
  z-index: 1000;
}
```

将**主题配置文件**内`style`代码注释`#`去掉.(复制到**`next.yml`**,方法2)

``` yaml
custom_file_path:
  #head: source/_data/head.swig
  #header: source/_data/header.swig
  #sidebar: source/_data/sidebar.swig
  #postMeta: source/_data/post-meta.swig
  #postBodyEnd: source/_data/post-body-end.swig
  #footer: source/_data/footer.swig
  #bodyEnd: source/_data/body-end.swig
  #variable: source/_data/variables.styl
  #mixin: source/_data/mixins.styl
  style: source/_data/styles.styl
```

![GitHub Corners](/images/Corners1.jpg)

![GitHub Corners](/images/Corners2.jpg)

![color](/images/color.png)

### 参考:

1. [GitHub Corners (tholman.com)](https://tholman.com/github-corners/#)
2. [科学上最令人舒服的十种颜色（RGB)](https://blog.csdn.net/orange_man/article/details/38490429?utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.control&dist_request_id=1332049.11033.16194356463928393&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.control)
3. [Color Hex Color Codes](https://www.color-hex.com/)



## <font color="#FF4500">图标角延伸知识</font>

使用F12找到对应的**css文件**,并在`/_data/styles.styl`文件内重写,用于个性化自己的网站


### 参考:

1. [基于Hexo搭建个人博客——进阶篇(从入门到入土) | ookamiAntD's Blog](https://yangbingdong.com/2017/build-blog-hexo-advanced/#元素微调自定义篇)



# 编辑NexT主题配置文件


## 设置「网站标签图标」和「页脚」

在`/myblog/source`下创建文件夹,**将16x16及32x32的任意图像格式文件**放入,并在代码内填写路径

亦可以使用链接

**图标的使用方法请阅读下一条**

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 网站信息设置
# ---------------------------------------------------------------

# 头像
favicon:
  small: /uploads/favicon-16x16-next.png
  medium: /uploads/favicon-32x32-next.png
  #apple_touch_icon: /images/apple-touch-icon-next.png
  #safari_pinned_tab: /images/logo.svg
  #android_manifest: /images/manifest.json
  #ms_browserconfig: /images/browserconfig.xml

# 页脚    
footer:
  # 指定网站设置的日期,如果没有定义，则使用当前时间.
  since: 2021

  # 图标,位于时间和版权信息之间.
  icon:
    name: fab fa-ravelry
    # 如果你想要动画图标，设置它为true.
    animated: true
    # 改变图标的颜色，使用十六进制代码.
    color: "#dada1"
  # 如果没有定义，将在Hexo主配置中使用' author '.
  copyright: 机械细胞
  
  # 控制(由 Hexo 强力驱动)是否显示
  powered: false

#版权信息
creative_commons:
  license: by-nc-sa
  sidebar: true
  post: true
  language: deed.zh
```



## 图标的选用

NexT 默认使用 Font Awesome 库作为 icon 库,美中不足的是，有一些中国的社交网站的图标在 Font Awesome 库中并没有提供，包括我们熟悉的哔哩哔哩、豆瓣、简书等等。所以如果想使用这些图标，就需要我们使用本地图标进行手动添加。

首先,在 [阿里巴巴矢量图标库](https://www.iconfont.cn/) 之类的网站找到你需要的图标，下载 SVG 格式文件。在`/myblog/source`新建文件夹,并放入.

编辑 `source/_data/styles.styl `文件,编辑代码

{% spoiler "示例代码" %}
~~~css
/*图标的引用*/
.fa-ravelry {
  background: url(/iconfont/ravelry-red.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-home {
  background: url(/iconfont/home-orange.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-about {
  background: url(/iconfont/about-purple.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-commonweal {
  background: url(/iconfont/commonweal-green.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-archive {
  background: url(/iconfont/archive-blue.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-tags {
  background: url(/iconfont/tags.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-categories {
  background: url(/iconfont/categories.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-github {
  background: url(/iconfont/github.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-email {
  background: url(/iconfont/email.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-qq {
  background: url(/iconfont/qq.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-baidu {
  background: url(/iconfont/baidu.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-qqduihua {
  background: url(/iconfont/qqduihua.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-zhihu {
  background: url(/iconfont/zhihu.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-bilibili {
  background: url(/iconfont/bilibili.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-csdn {
  background: url(/iconfont/csdn.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-gitee {
  background: url(/iconfont/gitee.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-leetcode {
  background: url(/iconfont/leetcode.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-link {
  background: url(/iconfont/link.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-video {
  background: url(/iconfont/video.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-music {
  background: url(/iconfont/music.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-photo {
  background: url(/iconfont/photo.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

.fa-book {
  background: url(/iconfont/book.svg);
  background-position: 50% 75%;
  background-repeat: no-repeat;
  height: 1rem;
  width: 1rem;
}

/*github-corner*/
.github-corner svg {
  border: 0;
  color: #fff;
  fill: #FD6C6C;
  position: absolute;
  left: 0;
  transform: scale(-1, 1);
  top: 0;
  z-index: 1000;
}

/*文章内链接文本样式*/
if hexo-config("post_body_a.enabled")
  .post-body
    a {
      color: convert(hexo-config("post_body_a.normal_color"));
      border-bottom: none;
      &:hover {
        color: convert(hexo-config("post_body_a.hover_color"));
        text-decoration: underline;
		}
    }

/*小代码块的自定义样式*/	
code {
    color: #ff7600;
    background: #fbf7f8;
    margin: 2px;
}
.highlight, code {
    border: 1px solid #d6d6d6;
}

/*自定义的侧栏时间样式*/
#days {
    display: block;
    color: #19caad;
    font-size: 14px;
    margin-left: 15px;
}

/*文章标题下划线*/
.posts-expand .post-title-link::before {
	background-image: linear-gradient(90deg, #a166ab 0%, #ef4e7b 25%, #f37055 50%, #ef4e7b 75%, #a166ab 100%);
}

/*目录下划线*/
a.nav-link {
	border-bottom:0px
}

/*首字下沉*/
.post-body>p:first-child::first-letter {
  float: left;
/* height: 32px;*/
  margin-top: 14px;
  margin-right: 6px;
  color: #555;
  font-size: 42px;
  line-height: 28px;
  font-style: normal;
  font-weight: 400;
  +mobile(){
    margin-top: 10px;
    margin-right: 4px;
    font-size: 26px;
    line-height: 20px;
  }
}

/*添加背景图片*/
body {
      background: url(/uploads/background.jpg);
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-position: 50% 50%;
}

/*代码折叠功能添加*/
.hider_title {
    cursor: pointer;
    color: #ef4a05;
}
.close:before {
    content: "▼";
}
.open:before {
    content: "▲";
}
~~~
{% endspoiler %}

将**主题配置文件**内`custom_file_path:style`代码注释`#`去掉.(如果你之前没有这么做)

最后一步,引用.

````yaml
name: fab fa-ravelry
````

 Font Awesome 的图标引用方式有fa,fab,fad,far,fal等,每种类型可能有相应图标,也可能没有所以如果出现图标叠加,请换引用方式或者图标名,推荐更改图标名`.fa-xxx`,其中,**`fa-`**不能省略,可能出错,**我暂时不会改**

### 参考:

1.  [阿里巴巴矢量图标库](https://www.iconfont.cn/) 
2. [Hexo + NexT 通过自定义样式添加 Bilibili 图标_R先生一天不学习就浑身难受-CSDN博客](https://blog.csdn.net/lu_embedded/article/details/114181462)
3. [Hexo博客之优雅使用阿里iconfont图标_小康博客-CSDN博客](https://blog.csdn.net/u012208219/article/details/106883012/)
4. [Hexo-使用阿里iconfont图标](https://www.tqwba.com/x_d/jishu/418737.html)



## 设置「布局风格」

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

将你需用启用的**scheme**前面注释 `#` 去除即可。

```yaml
# ---------------------------------------------------------------
# 布局设置
# ---------------------------------------------------------------

# 布局
#scheme: Muse
#scheme: Mist
#scheme: Pisces
scheme: Gemini
```



## 添加「菜单项」

**`fab`**后面的图标是我自己下载并添加的,参考**条目8**

**`badges`**控制的是**归档,标签,分类**旁边是否显示**统计数**

若要添加**自定义菜单项**,直接插入,并在`/themes/next/languages/zh_CN`中添加对应代码

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 菜单设置
# ---------------------------------------------------------------

# 菜单
# 格式: `Key: /link/ || icon`
menu:
  home: / || fab fa-home
  tags: /tags/ || fab fa-tags
  categories: /categories/ || fab fa-categories
  archives: /archives/ || fab fa-archive
  videos: /videos/ || fab fa-video
  music: /music/ || fab fa-music
  photos: /photos/ || fab fa-photo
  books: /videos/ || fab fa-book
  #schedule: /schedule/ || fab fa-calendar
  #sitemap: /sitemap.xml || fab fa-sitemap
  commonweal: /404/ || fab fa-commonweal
  about: /about/ || fab fa-about

# 启用/禁用菜单图标/项目徽章.
menu_settings:
  icons: true
  badges: true
```

编辑**`zh-CN.yml`**

```yaml
menu:
  home: 首页
  archives: 归档
  categories: 分类
  tags: 标签
  music: 音乐
  videos: 视频
  books: 图书
  photos: 照片
  about: 关于
  search: 搜索
  schedule: 日程表
  sitemap: 站点地图
  commonweal: 公益 404
```



## 设置「侧栏」

1. 侧栏位置
2. 侧栏头像
3. 添加社交链接
4. 添加友链
5. 侧边栏目录设置

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 侧边栏设置
# ---------------------------------------------------------------

sidebar:
  # 侧栏位置.
  position: left
  #position: right

  # 自定义侧栏宽度,默认如下:Muse | Mist: 320  Pisces | Gemini: 240
  #width: 300

  # 侧栏顶部填充像素.
  padding: 18
  # 侧栏与菜单栏和文档的像素偏移
  offset: 12

# 侧栏头像
avatar:
  url: /uploads/avatar.jpeg
  # 头像显示圆形.
  rounded: true
  # 鼠标放置时头像旋转.
  rotated: true

# 日志/分类/标签在侧边栏.
site_state: false

# 社交链接
# 格式: `关键字: 链接 || 图标名`
social:
  GitHub: https://github.com/Liuzh25 || fa fa-github
  E-Mail: 786189861@qq.com || fa fa-email
  QQ: tencent://message/?uin=1095652242 || fa fa-qq
  QQ对话: tencent://Message/?Uin=786189861&websiteName=www.oicqzone.com&Menu=yes || fa fa-qqduihua
  CSDN: https://blog.csdn.net/qq_37828104 || fa fa-csdn
  码云: https://gitee.com/Liuzh25 || fab fa-gitee
  力扣: https://leetcode-cn.com/u/liuzh25/ || fab fa-leetcode
  哔哩哔哩: https://space.bilibili.com/500942397 || fab fa-bilibili
  知乎: https://www.zhihu.com/people/jin-li-22-85 || fa fa-zhihu
  百度: http://www.baidu.com || fab fa-baidu

# `enable` 控制是否显示图标 ,`icons_only` 控制是否隐藏关键字, `transition` 暂时不懂.
social_icons:
  enable: true
  icons_only: false
  transition: false

# 友情链接
links_settings:
  icon: fab fa-link
  title: 友情链接
  # 链接排列方式
  #layout: block
  layout: inline
  
links:
  野生程序员: http://www.yscxy.net/
  又见苍岚: https://www.zywvvd.com/
  小丁的个人博客: https://tding.top/
  Moorez: http://shenzekun.cn/
  橘子味雪糕: https://www.liuxianl.com/

# 侧边栏目录
toc:
  enable: fasle
  # 自动添加列表号到toc.
  number: false
  # 标题过长换行.
  wrap: false
  # 所有目录全部显示.
  expand_all: false
  # 最大标题深度.
  max_depth: 6
```



## 添加「打赏」和「字数统计」

字数统计功能依赖于 https://github.com/theme-next/hexo-symbols-count-time

```bash
npm install hexo-symbols-count-time
```

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 站点设置
# ---------------------------------------------------------------

# 自动摘录描述在主页作为序言文本.
excerpt_description: true

# 显示阅读全文.
read_more_btn: true

# 文章数据显示
post_meta:
  item_text: true # 标题显示
  created_at: true # 创建时间
  updated_at: # 更新时间
    enable: true
    another_day: true
  categories: true # 分类显示

# 字数统计
symbols_count_time:
  separated_meta: true
  item_text_post: true
  item_text_total: true

# 标签,使用图标代替符号#
tag_icon: true

# 打赏
reward_settings:
  enable: true
  animation: false
  #comment: 赞赏一杯咖啡

reward:
  alipay: /uploads/alipay.jpg
  wechatpay: /uploads/wechatpay.jpg
  #paypal: /images/paypal.png
  #bitcoin: /images/bitcoin.png

# 通过Telegram Channel、Twitter等订阅
# 格式: `Key: permalink || icon` (Font Awesome)
follow_me:
  #Twitter: https://twitter.com/username || fab fa-twitter
  #Telegram: https://t.me/channel_name || fab fa-telegram
  WeChat:  /uploads/wechat-qcode.jpg || fab fa-weixin
  #RSS: /atom.xml || fa fa-rss

# 相关热门文章链接
related_posts:
  enable: false
  title: # Custom header, leave empty to use the default one
  display_in_home: false
  params:
    maxCount: 5
    #PPMixingRate: 0.0
    #isDate: false
    #isImage: false
    #isExcerpt: false

# 文章编辑
post_edit:
  enable: true
  url: https://github.com/Liuzh25/Liuzh25.github.io/tree/source # 查看源链接
  #url: https://github.com/user-name/repo-name/edit/branch-name/subdirectory-name # 编辑链接分支

# 显示前一篇文章和下一篇文章
post_navigation: left
#post_navigation: right
#post_navigation: false
```



## 设置「谷歌日历」和「标签云」

谷歌日历设置失败

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 自定义页面设置
# ---------------------------------------------------------------

# 标签页标签云设置.
tagcloud:
  min: 12 # 字体最小 in px
  max: 30 # 字体最大 in px
  start: "#ccc" # 开始颜色 (hex, rgba, hsla or color keywords)
  end: "#111" # 结束颜色 (hex, rgba, hsla or color keywords)
  amount: 200 # 标签最大数量

# 谷歌日历
calendar:
  calendar_id: # liuzhgq1995@gmail.com
  api_key: # bGl1emhncTE5OTVAZ21haWwuY29t
  orderBy: startTime
  offsetMax: 24 # Time Range
  offsetMin: 4 # Time Range
  showDeleted: false
  singleEvents: true
  maxResults: 250
```



## 自定义「logo,代码块,阅读进度条,书签」等

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 杂项布局设置
# ---------------------------------------------------------------

# 设置文章/页面的文本对齐方式.
text_align:
  # 取值: start | end | left | right | center | justify | justify-all | match-parent
  desktop: justify
  mobile: justify

# 缩小设备上的padding / margin缩进.
mobile_layout_economy: false

# Android Chrome header panel color ($brand-bg / $headband-bg => $black-deep).
android_chrome_color: "#222"

# 自定义Logo (不支持 scheme Mist)
custom_logo: /uploads/custom-logo.jpg

codeblock:
  # 代码高亮主题
  # 取值范围: normal | night | night eighties | night blue | night bright | solarized | solarized dark | galactic
  highlight_theme: normal
  # 代码块复制按钮
  copy_button:
    enable: true
    # 显示文本复制结果.
    show_result: true
    # 取值: default | flat | mac
    style: mac

back2top:
  enable: true
  # 在侧边栏显示返回顶部.
  sidebar: false
  # 返回顶部箭头显示百分比.
  scrollpercent: true

# 阅读进度条
reading_progress:
  enable: true
  # 取值: top | bottom
  position: top
  color: "#FD6C6C"
  height: 3px

# 书签支持
bookmark:
  enable: true
  # 自定义书签的颜色.
  color: "#64CEAA"
  # If auto, 关闭页面或单击书签图标时保存阅读进度.
  # If manual, 只需点击书签图标来保存.
  save: auto

# GitHub corner.
github_banner:
  enable: true
  permalink: https://github.com/Liuzh25
  title: 欢迎访问我的GitHub主页
```



## 设置「字符间空格,图片缩放」

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 第三方插件和服务设置
# ---------------------------------------------------------------

# 盘古支持,自动在中文和英文、数字、符号之间添加空格.
# For more information: https://github.com/vinta/pangu.js
pangu: true

# 图片缩放.
# For more information: https://github.com/francoischalifour/medium-zoom
mediumzoom: true

# 懒加载图像.
# For more information: https://github.com/ApoorvSaxena/lozad.js
lazyload: true

# 快速加载页面.
# Dependencies: https://github.com/theme-next/theme-next-pjax
pjax: true
```



## 添加「评论」

多评论支持在设置多个评论系统为`true`时启动

**不推荐`gittalk`评论系统**,仅说下如何设置

`github`设置内开发人员设置OAuth Apps

**Application name： 应用名称，随意
Homepage URL： 网站URL，对应自己博客地址
Application description ：描述，随意
Authorization callback URL：# 网站URL，博客地址就好
点击注册，页面会出现其中Client ID和Client Secret在后面的配置中需要用到，到时复制粘贴即可：**

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 评论设置
# ---------------------------------------------------------------

# 多评论系统支持
comments:
  # 取值: tabs | buttons
  style: tabs
  # 选择默认显示的评论系统.
  # 取值: changyan | disqus | disqusjs | gitalk | livere | valine
  active: gitalk
  # If true, 记住访客选择的评论系统.
  storage: true
  # 懒加载所有评论系统.
  lazyload: true
  # 修改文本或命令的任何navs.
  nav:
    #disqus:
    #  text: Load Disqus
    #  order: -1
    #gitalk:
    #  order: -2
    
# 畅言
changyan:
  enable: false
  appid: cyvs0PiIk
  appkey: a868a79f4480491e7870339ebcbcd8b7
  #post_meta_order: 0

# Valine
# For more information: https://valine.js.org, https://github.com/xCss/Valine
valine:
  enable: false
  appid: S0ExOBWoQQYlRlqOT9dAhkTP-gzGzoHsz
  appkey: 7EKLluWPKYoO83sAWtUnwu0H
  notify: false # 邮件通知
  verify: false # 验证码
  placeholder: Just go go # 评论框占位符
  avatar: mm # 个人风格
  guest_info: nick,mail,link # Custom comment header
  pageSize: 10 # Pagination size
  language: # Language, available values: en, zh-cn
  visitor: true # 文章阅读统计
  comment_count: true # If false, 评论计数将只显示在发布页面，而不是主页
  recordIP: true # 是否记录评论者IP
  serverURLs: # When the custom domain name is enabled, fill it in here (it will be detected automatically by default, no need to fill in)
  #post_meta_order: 0
  
# Gitalk评论系统
# For more information: https://gitalk.github.io, https://github.com/gitalk/gitalk
gitalk:
  enable: true
  github_id: Liuzh25 # GitHub用户名
  repo: Liuzh25.github.io # 仓库名
  client_id: 415feb380f28706a3d9e # GitHub Application Client ID
  client_secret: 8e23474fec2292126310cebde51d90df21869e9e # GitHub Application Client Secret
  admin_user: Liuzh25 # GitHub的回购所有者和合作者，只有这些人可以初始化GitHub问题
  distraction_free_mode: true # 专注模式
  # Gitalk的显示语言取决于用户的浏览器或系统环境
  # 如果你想让每个访问你网站的人都看到统一的语言，你可以设置一个强制语言值
  # 取值: en | es-ES | fr | ru | zh-CN | zh-TW
  language: zh-CN
```

### 参考:

1. [GitTalk评论配置_Madridcrls7的博客-CSDN博客](https://blog.csdn.net/madridcrls7/article/details/80871596)



## 设置「百度统计分析」

1. 登录 [百度统计](https://tongji.baidu.com/web/32956741/welcome/login),以站长身份注册,进入管理-代码管理-代码获取页面
1. 复制 hm.js? 后面那串统计脚本 id.

![baidu_analytics](/images/analytics-baidu-id.png)

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 统计和分析
# ---------------------------------------------------------------

# Baidu Analytics
baidu_analytics: 2f80625c255f4d995edcdcf2ad0a5201
```

### 参考:

1. [百度统计——领先的中文网站分析平台 (baidu.com)](https://tongji.baidu.com/web/32956741/welcome/login)



## 添加「本地搜索」

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 搜索服务
# ---------------------------------------------------------------

# 本地搜索
local_search:
  enable: true
  # If auto, 则通过更改输入触发搜索.
  # If manual, 按下输入键或搜索按钮触发搜索.
  trigger: auto
  # 每篇文章显示前n个结果，设置为-1显示所有结果
  top_n_per_article: 1
  # 将html字符串转换为可读字符串.
  unescape: false
  # P在页面加载时预加载搜索数据.
  preload: false
```



## 设置「动画」

设置顶部加载动画

```bash
git clone https://github.com/theme-next/theme-next-pace source/lib/pace
```

设置背景动画

```bash
git clone https://github.com/theme-next/theme-next-three source/lib/three
```

编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# ---------------------------------------------------------------
# 动画设置
# ---------------------------------------------------------------

# Progress bar in the top during page loading.
# Dependencies: https://github.com/theme-next/theme-next-pace
# For more information: https://github.com/HubSpot/pace
pace:
  enable: true
  # Themes list:
  # big-counter | bounce | barber-shop | center-atom | center-circle | center-radar | center-simple
  # corner-indicator | fill-left | flat-top | flash | loading-bar | mac-osx | material | minimal
  theme: bounce
  
# JavaScript 3D library.
# Dependencies: https://github.com/theme-next/theme-next-three
three:
  enable: false
  three_waves: true
  canvas_lines: false
  canvas_sphere: false
```



# 博客配置进阶

## 添加「页面」

1. 新建页面

   在Hexo 站点目录下。使用 `hexo new page` 新建一个页面，命名,例如

   ~~~bash
   hexo new page link
   ~~~

2. 设置页面类型

   在index.md中添加一行type,例如

   ```markdown
   ---
   title: link
   date: 2021-04-27 09:57:29
   type: "link"
   comments: false
   ---
   ```

3. 修改菜单项

   编辑 **主题配置文件 _config.yml**,在菜单中添加链接.(复制到**`next.yml`**,方法2)

4. 为 `categories,archives,tags,about,commonweal`等菜单添加页面



## 设置「腾讯公益404页面」

**腾讯公益404页面，寻找丢失儿童，让大家一起关注此项公益事业！**

新建 404.html 页面，放到 `/myblog/source` 目录下，内容如下：

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>404</title>
    <link rel="alternate" href="/atom.xml" title="机械细胞" type="application/atom+xml">
</head>
    <body>
        <script type="text/javascript" src="//qzonestyle.gtimg.cn/qzone/hybrid/app/404/search_children.js" charset="utf-8" homePageUrl="/" homePageName="返回"></script> 
    </body>
</html>
```



## <font color="#FF4500">实现「鼠标点击效果」和添加「鼠标跟随粒子特效」</font>

编辑 **主题配置文件 _config.yml,添加动态配置项,并取消 `body-end.swig` 的注释**(复制到**`next.yml`**,方法2)

我将其放在了动画效果下面

```yaml
# 鼠标点击效果
cursor_effect:
  enabled: true
  type: fireworks  # fireworks：礼花 | explosion：爆炸 | love：浮出爱心 | text：浮出文字
  fairyDustCursor: true  # 鼠标跟随粒子特效
```

新建`body-end.swig` ,添加如下代码：

```html
{# 鼠标点击特效 #}
{% if theme.cursor_effect.enabled and not is_index %}
  {% if theme.cursor_effect.fairyDustCursor %}
	<script src="/js/cursor/fairyDustCursor.js"></script>
  {% endif %}
  {% if theme.cursor_effect.type == "fireworks" %}
    <script src="/js/cursor/fireworks.js"></script>
  {% elseif theme.cursor_effect.type == "explosion" %}
    <canvas class="fireworks" style="position: fixed;left: 0;top: 0;z-index: 1; pointer-events: none;" ></canvas>
    <script src="//cdn.bootcss.com/animejs/2.2.0/anime.min.js"></script>
    <script src="/js/cursor/explosion.min.js"></script>
  {% elseif theme.cursor_effect.type == "love" %}
    <script src="/js/cursor/love.min.js"></script>
  {% elseif theme.cursor_effect.type == "text" %}
    <script src="/js/cursor/text.js"></script>
  {% endif %}
{% endif %}
```

将以下5个 JS 文件复制到目录 **`/myblog/source/js/cursor/ `**下

### fireworks.js

{% spoiler "示例代码" %}
```js
    class Circle {
      constructor({ origin, speed, color, angle, context }) {
        this.origin = origin
        this.position = { ...this.origin }
        this.color = color
        this.speed = speed
        this.angle = angle
        this.context = context
        this.renderCount = 0
      }

      draw() {
        this.context.fillStyle = this.color
        this.context.beginPath()
        this.context.arc(this.position.x, this.position.y, 2, 0, Math.PI * 2)
        this.context.fill()
      }
    
      move() {
        this.position.x = (Math.sin(this.angle) * this.speed) + this.position.x
        this.position.y = (Math.cos(this.angle) * this.speed) + this.position.y + (this.renderCount * 0.3)
        this.renderCount++
      }
    }
    
    class Boom {
      constructor ({ origin, context, circleCount = 16, area }) {
        this.origin = origin
        this.context = context
        this.circleCount = circleCount
        this.area = area
        this.stop = false
        this.circles = []
      }
    
      randomArray(range) {
        const length = range.length
        const randomIndex = Math.floor(length * Math.random())
        return range[randomIndex]
      }
    
      randomColor() {
        const range = ['8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
        return '#' + this.randomArray(range) + this.randomArray(range) + this.randomArray(range) + this.randomArray(range) + this.randomArray(range) + this.randomArray(range)
      }
    
      randomRange(start, end) {
        return (end - start) * Math.random() + start
      }
    
      init() {
        for(let i = 0; i < this.circleCount; i++) {
          const circle = new Circle({
            context: this.context,
            origin: this.origin,
            color: this.randomColor(),
            angle: this.randomRange(Math.PI - 1, Math.PI + 1),
            speed: this.randomRange(1, 6)
          })
          this.circles.push(circle)
        }
      }
    
      move() {
        this.circles.forEach((circle, index) => {
          if (circle.position.x > this.area.width || circle.position.y > this.area.height) {
            return this.circles.splice(index, 1)
          }
          circle.move()
        })
        if (this.circles.length == 0) {
          this.stop = true
        }
      }
    
      draw() {
        this.circles.forEach(circle => circle.draw())
      }
    }
    
    class CursorSpecialEffects {
      constructor() {
        this.computerCanvas = document.createElement('canvas')
        this.renderCanvas = document.createElement('canvas')
    
        this.computerContext = this.computerCanvas.getContext('2d')
        this.renderContext = this.renderCanvas.getContext('2d')
    
        this.globalWidth = window.innerWidth
        this.globalHeight = window.innerHeight
    
        this.booms = []
        this.running = false
      }
    
      handleMouseDown(e) {
        const boom = new Boom({
          origin: { x: e.clientX, y: e.clientY },
          context: this.computerContext,
          area: {
            width: this.globalWidth,
            height: this.globalHeight
          }
        })
        boom.init()
        this.booms.push(boom)
        this.running || this.run()
      }
    
      handlePageHide() {
        this.booms = []
        this.running = false
      }
    
      init() {
        const style = this.renderCanvas.style
        style.position = 'fixed'
        style.top = style.left = 0
        style.zIndex = '999999999999999999999999999999999999999999'
        style.pointerEvents = 'none'
    
        style.width = this.renderCanvas.width = this.computerCanvas.width = this.globalWidth
        style.height = this.renderCanvas.height = this.computerCanvas.height = this.globalHeight
    
        document.body.append(this.renderCanvas)
    
        window.addEventListener('mousedown', this.handleMouseDown.bind(this))
        window.addEventListener('pagehide', this.handlePageHide.bind(this))
      }
    
      run() {
        this.running = true
        if (this.booms.length == 0) {
          return this.running = false
        }
    
        requestAnimationFrame(this.run.bind(this))
    
        this.computerContext.clearRect(0, 0, this.globalWidth, this.globalHeight)
        this.renderContext.clearRect(0, 0, this.globalWidth, this.globalHeight)
    
        this.booms.forEach((boom, index) => {
          if (boom.stop) {
            return this.booms.splice(index, 1)
          }
          boom.move()
          boom.draw()
        })
        this.renderContext.drawImage(this.computerCanvas, 0, 0, this.globalWidth, this.globalHeight)
      }
    }
    
    const cursorSpecialEffects = new CursorSpecialEffects()
    cursorSpecialEffects.init()
```
{% endspoiler %}



### explosion.min.js

{% spoiler "示例代码" %}
```js
"use strict";function updateCoords(e){pointerX=(e.clientX||e.touches[0].clientX)-canvasEl.getBoundingClientRect().left,pointerY=e.clientY||e.touches[0].clientY-canvasEl.getBoundingClientRect().top}function setParticuleDirection(e){var t=anime.random(0,360)*Math.PI/180,a=anime.random(50,180),n=[-1,1][anime.random(0,1)]*a;return{x:e.x+n*Math.cos(t),y:e.y+n*Math.sin(t)}}function createParticule(e,t){var a={};return a.x=e,a.y=t,a.color=colors[anime.random(0,colors.length-1)],a.radius=anime.random(16,32),a.endPos=setParticuleDirection(a),a.draw=function(){ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.fillStyle=a.color,ctx.fill()},a}function createCircle(e,t){var a={};return a.x=e,a.y=t,a.color="#F00",a.radius=0.1,a.alpha=0.5,a.lineWidth=6,a.draw=function(){ctx.globalAlpha=a.alpha,ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.lineWidth=a.lineWidth,ctx.strokeStyle=a.color,ctx.stroke(),ctx.globalAlpha=1},a}function renderParticule(e){for(var t=0;t<e.animatables.length;t++){e.animatables[t].target.draw()}}function animateParticules(e,t){for(var a=createCircle(e,t),n=[],i=0;i<numberOfParticules;i++){n.push(createParticule(e,t))}anime.timeline().add({targets:n,x:function(e){return e.endPos.x},y:function(e){return e.endPos.y},radius:0.1,duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule}).add({targets:a,radius:anime.random(80,160),lineWidth:0,alpha:{value:0,easing:"linear",duration:anime.random(600,800)},duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule,offset:0})}function debounce(e,t){var a;return function(){var n=this,i=arguments;clearTimeout(a),a=setTimeout(function(){e.apply(n,i)},t)}}var canvasEl=document.querySelector(".fireworks");if(canvasEl){var ctx=canvasEl.getContext("2d"),numberOfParticules=30,pointerX=0,pointerY=0,tap="mousedown",colors=["#FF1461","#18FF92","#5A87FF","#FBF38C"],setCanvasSize=debounce(function(){canvasEl.width=2*window.innerWidth,canvasEl.height=2*window.innerHeight,canvasEl.style.width=window.innerWidth+"px",canvasEl.style.height=window.innerHeight+"px",canvasEl.getContext("2d").scale(2,2)},500),render=anime({duration:1/0,update:function(){ctx.clearRect(0,0,canvasEl.width,canvasEl.height)}});document.addEventListener(tap,function(e){"sidebar"!==e.target.id&&"toggle-sidebar"!==e.target.id&&"A"!==e.target.nodeName&&"IMG"!==e.target.nodeName&&(render.play(),updateCoords(e),animateParticules(pointerX,pointerY))},!1),setCanvasSize(),window.addEventListener("resize",setCanvasSize,!1)}"use strict";function updateCoords(e){pointerX=(e.clientX||e.touches[0].clientX)-canvasEl.getBoundingClientRect().left,pointerY=e.clientY||e.touches[0].clientY-canvasEl.getBoundingClientRect().top}function setParticuleDirection(e){var t=anime.random(0,360)*Math.PI/180,a=anime.random(50,180),n=[-1,1][anime.random(0,1)]*a;return{x:e.x+n*Math.cos(t),y:e.y+n*Math.sin(t)}}function createParticule(e,t){var a={};return a.x=e,a.y=t,a.color=colors[anime.random(0,colors.length-1)],a.radius=anime.random(16,32),a.endPos=setParticuleDirection(a),a.draw=function(){ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.fillStyle=a.color,ctx.fill()},a}function createCircle(e,t){var a={};return a.x=e,a.y=t,a.color="#F00",a.radius=0.1,a.alpha=0.5,a.lineWidth=6,a.draw=function(){ctx.globalAlpha=a.alpha,ctx.beginPath(),ctx.arc(a.x,a.y,a.radius,0,2*Math.PI,!0),ctx.lineWidth=a.lineWidth,ctx.strokeStyle=a.color,ctx.stroke(),ctx.globalAlpha=1},a}function renderParticule(e){for(var t=0;t<e.animatables.length;t++){e.animatables[t].target.draw()}}function animateParticules(e,t){for(var a=createCircle(e,t),n=[],i=0;i<numberOfParticules;i++){n.push(createParticule(e,t))}anime.timeline().add({targets:n,x:function(e){return e.endPos.x},y:function(e){return e.endPos.y},radius:0.1,duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule}).add({targets:a,radius:anime.random(80,160),lineWidth:0,alpha:{value:0,easing:"linear",duration:anime.random(600,800)},duration:anime.random(1200,1800),easing:"easeOutExpo",update:renderParticule,offset:0})}function debounce(e,t){var a;return function(){var n=this,i=arguments;clearTimeout(a),a=setTimeout(function(){e.apply(n,i)},t)}}var canvasEl=document.querySelector(".fireworks");if(canvasEl){var ctx=canvasEl.getContext("2d"),numberOfParticules=30,pointerX=0,pointerY=0,tap="mousedown",colors=["#FF1461","#18FF92","#5A87FF","#FBF38C"],setCanvasSize=debounce(function(){canvasEl.width=2*window.innerWidth,canvasEl.height=2*window.innerHeight,canvasEl.style.width=window.innerWidth+"px",canvasEl.style.height=window.innerHeight+"px",canvasEl.getContext("2d").scale(2,2)},500),render=anime({duration:1/0,update:function(){ctx.clearRect(0,0,canvasEl.width,canvasEl.height)}});document.addEventListener(tap,function(e){"sidebar"!==e.target.id&&"toggle-sidebar"!==e.target.id&&"A"!==e.target.nodeName&&"IMG"!==e.target.nodeName&&(render.play(),updateCoords(e),animateParticules(pointerX,pointerY))},!1),setCanvasSize(),window.addEventListener("resize",setCanvasSize,!1)};
```
{% endspoiler %}


### love.min.js

{% spoiler "示例代码" %}
```js
!function(e,t,a){function n(){c(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),o(),r()}function r(){for(var e=0;e<d.length;e++)d[e].alpha<=0?(t.body.removeChild(d[e].el),d.splice(e,1)):(d[e].y--,d[e].scale+=.004,d[e].alpha-=.013,d[e].el.style.cssText="left:"+d[e].x+"px;top:"+d[e].y+"px;opacity:"+d[e].alpha+";transform:scale("+d[e].scale+","+d[e].scale+") rotate(45deg);background:"+d[e].color+";z-index:99999");requestAnimationFrame(r)}function o(){var t="function"==typeof e.onclick&&e.onclick;e.οnclick=function(e){t&&t(),i(e)}}function i(e){var a=t.createElement("div");a.className="heart",d.push({el:a,x:e.clientX-5,y:e.clientY-5,scale:1,alpha:1,color:s()}),t.body.appendChild(a)}function c(e){var a=t.createElement("style");a.type="text/css";try{a.appendChild(t.createTextNode(e))}catch(t){a.styleSheet.cssText=e}t.getElementsByTagName("head")[0].appendChild(a)}function s(){return"rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"}var d=[];e.requestAnimationFrame=function(){return e.requestAnimationFrame||e.webkitRequestAnimationFrame||e.mozRequestAnimationFrame||e.oRequestAnimationFrame||e.msRequestAnimationFrame||function(e){setTimeout(e,1e3/60)}}(),n()}(window,document);
```
{% endspoiler %}


### text.js

{% spoiler "示例代码" %}
```js
    var a_idx = 0;
    jQuery(document).ready(function($) {
      $("body").click(function(e) {
        var a = new Array("富强", "民主", "文明", "和谐", "自由", "平等", "公正" ,"法治", "爱国", "敬业", "诚信", "友善");
        var $i = $("<span/>").text(a[a_idx]);
        var x = e.pageX,
          y = e.pageY;
        $i.css({
          "z-index": 99999,
          "top": y - 28,
          "left": x - a[a_idx].length * 8,
          "position": "absolute",
          "color": "#ff7a45"
        });
        $("body").append($i);
        $i.animate({
          "top": y - 180,
          "opacity": 0
        }, 1500, function() {
          $i.remove();
        });
        a_idx = (a_idx + 1) % a.length;
      });
    });
```
{% endspoiler %}


### fairyDustCursor.js

{% spoiler "示例代码" %}
```js

    /*!
     * Fairy Dust Cursor.js
     * - 90's cursors collection
     * -- https://github.com/tholman/90s-cursor-effects
     * -- http://codepen.io/tholman/full/jWmZxZ/
     */
    
    (function fairyDustCursor() {
    
      var possibleColors = ["#D61C59", "#E7D84B", "#1B8798"]
      var width = window.innerWidth;
      var height = window.innerHeight;
      var cursor = {x: width/2, y: width/2};
      var particles = [];
    
      function init() {
        bindEvents();
        loop();
      }
    
      // Bind events that are needed
      function bindEvents() {
        document.addEventListener('mousemove', onMouseMove);
        document.addEventListener('touchmove', onTouchMove);
        document.addEventListener('touchstart', onTouchMove);
    
        window.addEventListener('resize', onWindowResize);
      }
    
      function onWindowResize(e) {
        width = window.innerWidth;
        height = window.innerHeight;
      }
    
      function onTouchMove(e) {
        if( e.touches.length > 0 ) {
          for( var i = 0; i < e.touches.length; i++ ) {
            addParticle( e.touches[i].clientX, e.touches[i].clientY, possibleColors[Math.floor(Math.random()*possibleColors.length)]);
          }
        }
      }
    
      function onMouseMove(e) {    
        cursor.x = e.clientX;
        cursor.y = e.clientY;
    
        addParticle( cursor.x, cursor.y, possibleColors[Math.floor(Math.random()*possibleColors.length)]);
      }
    
      function addParticle(x, y, color) {
        var particle = new Particle();
        particle.init(x, y, color);
        particles.push(particle);
      }
    
      function updateParticles() {
    
        // Updated
        for( var i = 0; i < particles.length; i++ ) {
          particles[i].update();
        }
    
        // Remove dead particles
        for( var i = particles.length -1; i >= 0; i-- ) {
          if( particles[i].lifeSpan < 0 ) {
            particles[i].die();
            particles.splice(i, 1);
          }
        }
    
      }
    
      function loop() {
        requestAnimationFrame(loop);
        updateParticles();
      }
    
      /**
       * Particles
       */
    
      function Particle() {
    
        this.character = "*";
        this.lifeSpan = 120; //ms
        this.initialStyles ={
          "position": "fixed",
          "top": "0", //必须加
          "display": "block",
          "pointerEvents": "none",
          "z-index": "10000000",
          "fontSize": "20px",
          "will-change": "transform"
        };
    
        // Init, and set properties
        this.init = function(x, y, color) {
    
          this.velocity = {
            x:  (Math.random() < 0.5 ? -1 : 1) * (Math.random() / 2),
            y: 1
          };
    
          this.position = {x: x - 10, y: y - 20};
          this.initialStyles.color = color;
          console.log(color);
    
          this.element = document.createElement('span');
          this.element.innerHTML = this.character;
          applyProperties(this.element, this.initialStyles);
          this.update();
    
          document.body.appendChild(this.element);
        };
    
        this.update = function() {
          this.position.x += this.velocity.x;
          this.position.y += this.velocity.y;
          this.lifeSpan--;
    
          this.element.style.transform = "translate3d(" + this.position.x + "px," + this.position.y + "px,0) scale(" + (this.lifeSpan / 120) + ")";
        }
    
        this.die = function() {
          this.element.parentNode.removeChild(this.element);
        }
    
      }
    
      /**
       * Utils
       */
    
      // Applies css `properties` to an element.
      function applyProperties( target, properties ) {
        for( var key in properties ) {
          target.style[ key ] = properties[ key ];
        }
      }
    
      init();
    })();
```
{% endspoiler %}





若`http://localhost:4000/`无效果,关闭本地预览, `hexo clean` ,`hexo s`.

### 参考:

1. [给Hexo(next主题)博客加上stackexchange愚人节鼠标跟随特效](https://blog.csdn.net/a201577F0546/article/details/89060017?utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-1&spm=1001.2101.3001.4242)
2. [Hexo博客+Next主题鼠标点击特效](https://blog.csdn.net/qq_42889280/article/details/103087564?utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-1.control)



## 修改「文章内链接文本样式」

编辑`/myblog/source/_data/styles.styl`,添加

```css
// 文章内链接文本样式
if hexo-config("post_body_a.enable")
  .post-body
    a{
      color: convert(hexo-config("post_body_a.normal_color"));
      border-bottom: none;
      &:hover {
        color: convert(hexo-config("post_body_a.hover_color"));
        text-decoration: underline;
		}
    }
```

编辑 **主题配置文件 _config.yml,添加动态配置项**(复制到**`next.yml`**,方法2)

```yaml
# 文章内链接文本样式  
post_body_a:
  enable: true
  normal_color: "#0593d3"
  hover_color: "#0477ab"
```

### 参考:

1. [修改文章内链接样式 ｜ hexo_好好编程的博客-CSDN博客](https://blog.csdn.net/qw8880000/article/details/80235648)



## 修改「小代码块自定义样式」

编辑`/myblog/source/_data/styles.styl`,添加.

```css
// 小代码块的自定义样式	
code {
    color: #ff7600;
    background: #fbf7f8;
    margin: 2px;
}
.highlight, code {
    border: 1px solid #d6d6d6;
}
```



## 添加「文章加密访问」

编辑 **主题配置文件 _config.yml,取消 `head.swig` 的注释**(复制到**`next.yml`**,方法2)

新建`head.swig`文件,填入下列代码

```html
<script>
    (function () {
        if ('{{ page.password }}') {
            if (prompt('请输入文章密码') !== '{{ page.password }}') {
                alert('密码错误！');
                if (history.length === 1) {
                    location.replace("http://www.jxxb.top"); // 这里替换成你的首页
                } else {
                    history.back();
                }
            }
        }
    })();
</script>
```

在文章标题添加`password`,如下

```markdown
title: Hexo 搭配 GitHub 建立博客, 选用 nexT 主题
date: 2021-04-26 19:21:20
categories:
- [兴趣, 网站, 博客]
tags:
- Hexo
- Git
password: 123
```



## 设置「文章置顶」

修改 `hero-generator-index` 插件，把文件：`node_modules/hexo-generator-index/lib/generator.js` 内的代码替换为：

```js
'use strict';
var pagination = require('hexo-pagination');
module.exports = function(locals){
  var config = this.config;
  var posts = locals.posts;
    posts.data = posts.data.sort(function(a, b) {
        if(a.top && b.top) { // 两篇文章top都有定义
            if(a.top == b.top) return b.date - a.date; // 若top值一样则按照文章日期降序排
            else return b.top - a.top; // 否则按照top值降序排
        }
        else if(a.top && !b.top) { // 以下是只有一篇文章top有定义，那么将有top的排在前面（这里用异或操作居然不行233）
            return -1;
        }
        else if(!a.top && b.top) {
            return 1;
        }
        else return b.date - a.date; // 都没定义按照文章日期降序排
    });
  var paginationDir = config.pagination_dir || 'page';
  return pagination('', posts, {
    perPage: config.index_generator.per_page,
    layout: ['index', 'archive'],
    format: paginationDir + '/%d/',
    data: {
      __index: true
    }
  });
};
```

在文章标题添加`top`,如下

```markdown
title: Hexo 搭配 GitHub 建立博客, 选用 nexT 主题
date: 2021-04-26 19:21:20
categories:
- [兴趣, 网站, 博客]
tags:
- Hexo
- Git
password:
top: 100
```



## 添加「侧栏已运行时间」

编辑 **主题配置文件 _config.yml,取消 `sidebar.swig` 的注释**(复制到**`next.yml`**,方法2)

新建`sidebar.swig`文件,填入下列代码

```html
<div id="days"></div>
    <script>
    function show_date_time(){
        window.setTimeout("show_date_time()", 1000);
        BirthDay=new Date("04/23/2021 23:24:52");
        today=new Date();
        timeold=(today.getTime()-BirthDay.getTime());
        sectimeold=timeold/1000
        secondsold=Math.floor(sectimeold);
        msPerDay=24*60*60*1000
        e_daysold=timeold/msPerDay
        daysold=Math.floor(e_daysold);
        e_hrsold=(e_daysold-daysold)*24;
        hrsold=setzero(Math.floor(e_hrsold));
        e_minsold=(e_hrsold-hrsold)*60;
        minsold=setzero(Math.floor((e_hrsold-hrsold)*60));
        seconds=setzero(Math.floor((e_minsold-minsold)*60));
        document.getElementById('days').innerHTML="已运行"+daysold+"天"+hrsold+"小时"+minsold+"分"+seconds+"秒";
    }
function setzero(i){
    if (i<10)
    {i="0" + i};
    return i;
}
show_date_time();
</script>
```

在`_data/styles.styl`中添加

```css
// 自定义的侧栏时间样式
#days {
    display: block;
    color: #19caad;
    font-size: 14px;
    margin-left: 15px;
}
```

最后,修改`BirthDay=new Date("01/10/2017 12:34:56");`,   ` color: #fffa74;`,   `margin-top: 15px;`等等



## 添加「萌萌的宠物」

在`git bash`输入

```bash
npm install -save hexo-helper-live2d
npm install --save live2d-widget-model-wanko
```

在 `hexo` 的 `_config.yml`中添加参数(必须是**站点配置文件**)

```yaml
live2d:
  enable: true
  scriptFrom: local
  pluginRootPath: live2dw/
  pluginJsPath: lib/
  pluginModelPath: assets/
  model:
    use: live2d-widget-model-wanko
  display:
    position: right
    width: 150
    height: 300
  mobile:
    show: true
```



## 添加「“本文结束”标记」

编辑 **主题配置文件 _config.yml,添加动态配置项,并取消 `post-body-end.swig` 的注释**(复制到**`next.yml`**,方法2)

```yaml
# 文章末尾添加“本文结束”标记
passage_end_tag:
  enabled: true
```

新建`post-body-end.swig`文件,填入下列代码

```html
<div>
    {% if theme.passage_end_tag.enabled and not is_index %}
        <div style="text-align:center;color: #ccc;font-size:25px;">-------------本文结束<i class="fa fa-paw"></i>感谢您的阅读-------------</div>
    {% endif %}
</div>
```



## 添加「APlayer音乐播放器」

### download
点击访问Aplayer源码：[GitHub Aplayer](https://github.com/MoePlayer/APlayer)。下载到本地，解压后将dist文件夹复制到`/mybolg/source`文件夹下并重命名为`aplayer`。

### music.js
新建`/mybolg/source/dist/music.js`文件，添加内容：

```js
const ap = new APlayer({
    container: document.getElementById('aplayer'),
    listFolded: false,
    listMaxHeight: 90,
    lrcType: 3,
    audio: [
      {
        name: "暗涌",
        artist: '王菲',
        url: 'http://www.ytmp3.cn/down/52980.mp3',
        cover: 'http://p1.music.126.net/w8RFsMH8VJfPsBmVudYGsA==/109951163020569833.jpg?param=130y130',
		lrc: 'lrc.lrc'
      },
      {
        name: 'Wonderful U',
        artist: 'AGA',
        url: 'http://www.ytmp3.cn/down/51181.mp3',
        cover: 'http://p1.music.126.net/Blb_Gi0AJTWIEBLr189F4A==/18791753232142320.jpg?param=130y130',
      },
      {
        name: '浮夸',
        artist: '陈奕迅',
        url: 'http://www.ytmp3.cn/down/49639.mp3',
        cover: 'http://p1.music.126.net/Bl1hEdJbMSj5YJsTqUjr-w==/109951163520311175.jpg?param=130y130',
      }
    ]
});

```

源码参数解释[APlayer 中文文档](https://aplayer.js.org/#/zh-Hans/)

audio对应的便是音频文件，所以音乐播放器需要播放的音乐是需要自己进行相关信息（如歌曲链接、歌词、封面等）的配置。这里放一个mp3音乐外链网站：http://up.mcyt.net/ ，搜索对应的音乐，然后复制url和右击封面图片链接粘贴到对应的位置上就行了。

编辑`body-end.swig`,将下列代码填入

```html
<link rel="stylesheet" href="/aplayer/APlayer.min.css">
<div id="aplayer"></div>
<script type="text/javascript" src="/aplayer/APlayer.min.js"></script>
<script type="text/javascript" src="/aplayer/music.js"></script>
```

### 参考:

1. [hexo4.0 - Next7.2.4 主题优化配置_xiaohu的博客-CSDN博客](https://xiaohu.blog.csdn.net/article/details/102677424?utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-12.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-12.control#t28)
2. [APlayer 中文文档](https://aplayer.js.org/#/zh-Hans/)



## 引用jquery

发现**动态标签页**没法使用了,查了一下,需要引用`jquery`.

编辑`body-end.swig`,在首行添加代码

```html
{# 引用JQ #} 
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/jquery@3/dist/jquery.min.js"></script>
```



## 动态标签页

新建`/myblog/source/js/src/dytitle.js`,填入下列代码

```js
var OriginTitile = document.title;
var titleTime;
document.addEventListener('visibilitychange', function () {
    if (document.hidden) {
        $('[rel="shortcut icon"]').attr('href', "/TEP.png");
        document.title = '程序已暂停';
        clearTimeout(titleTime);
    }
    else {
        $('[rel="shortcut icon"]').attr('href', "/favicon.png");
        document.title = '程序运行中 ' + OriginTitile;
        titleTime = setTimeout(function () {
            document.title = OriginTitile;
        }, 2000);
    }
});
```

编辑`body-end.swig`,追加代码

```html
<script type="text/javascript" src="/js/src/dytitle.js"></script>
```



## 雪花特效

编辑 **主题配置文件 _config.yml,添加动态配置项**(复制到**`next.yml`**,方法2)

```yaml
# 雪花飘落特效
snow:
  enabled: true
  #type: hexo
  #type: circle
  type: sakura
```

编辑`body-end.swig`,添加代码

```html
<!-- 雪花飘落特效 -->
{% if theme.snow.enabled and not is_index %}
  {% if theme.snow.type == "hexo" %}
	<script type="text/javascript">
	  var windowWidth = $(window).width();
	  if (windowWidth > 480) {
		document.write('<script type="text/javascript" src="/js/src/hexo.js"><\/script>');
	  }
	</script>
  {% elseif theme.snow.type == "circle" %}}
	<script type="text/javascript">
	  var windowWidth = $(window).width();
	  if (windowWidth > 480) {
		document.write('<script type="text/javascript" src="/js/src/circle.js"><\/script>');
	  }
	</script>
  {% elseif theme.snow.type == "sakura" %}}
    <script type="text/javascript" src="/js/src/sakura.js"><\/script>
  {% endif %}
{% endif %}
```

在`/myblog/source/js/src`文件夹新建`.js`文件

### hexo.js

{% spoiler "示例代码" %}
```js
/*样式一*/
(function($){
	$.fn.snow = function(options){
	var $flake = $('<div id="snowbox" />').css({'position': 'absolute','z-index':'9999', 'top': '-50px'}).html('&#10052;'),
	documentHeight 	= $(document).height(),
	documentWidth	= $(document).width(),
	defaults = {
		minSize		: 10,
		maxSize		: 20,
		newOn		: 1000,
		flakeColor	: "#AFDAEF" /* 此处可以定义雪花颜色，若要白色可以改为#FFFFFF */
	},
	options	= $.extend({}, defaults, options);
	var interval= setInterval( function(){
	var startPositionLeft = Math.random() * documentWidth - 100,
	startOpacity = 0.5 + Math.random(),
	sizeFlake = options.minSize + Math.random() * options.maxSize,
	endPositionTop = documentHeight - 200,
	endPositionLeft = startPositionLeft - 500 + Math.random() * 500,
	durationFall = documentHeight * 10 + Math.random() * 5000;
	$flake.clone().appendTo('body').css({
		left: startPositionLeft,
		opacity: startOpacity,
		'font-size': sizeFlake,
		color: options.flakeColor
	}).animate({
		top: endPositionTop,
		left: endPositionLeft,
		opacity: 0.2
	},durationFall,'linear',function(){
		$(this).remove()
	});
	}, options.newOn);
    };
})(jQuery);
$(function(){
    $.fn.snow({ 
	    minSize: 5, /* 定义雪花最小尺寸 */
	    maxSize: 50,/* 定义雪花最大尺寸 */
	    newOn: 300  /* 定义密集程度，数字越小越密集 */
    });
});
```
{% endspoiler %}



### circle.js

{% spoiler "示例代码" %}
```js
/*样式二*/
/* 控制下雪 */
function snowFall(snow) {
    /* 可配置属性 */
    snow = snow || {};
    this.maxFlake = snow.maxFlake || 200;   /* 最多片数 */
    this.flakeSize = snow.flakeSize || 10;  /* 雪花形状 */
    this.fallSpeed = snow.fallSpeed || 1;   /* 坠落速度 */
}
/* 兼容写法 */
requestAnimationFrame = window.requestAnimationFrame ||
    window.mozRequestAnimationFrame ||
    window.webkitRequestAnimationFrame ||
    window.msRequestAnimationFrame ||
    window.oRequestAnimationFrame ||
    function(callback) { setTimeout(callback, 1000 / 60); };

cancelAnimationFrame = window.cancelAnimationFrame ||
    window.mozCancelAnimationFrame ||
    window.webkitCancelAnimationFrame ||
    window.msCancelAnimationFrame ||
	window.oCancelAnimationFrame;
/* 开始下雪 */
snowFall.prototype.start = function(){
    /* 创建画布 */
    snowCanvas.apply(this);
    /* 创建雪花形状 */
    createFlakes.apply(this);
    /* 画雪 */
    drawSnow.apply(this)
}
/* 创建画布 */
function snowCanvas() {
    /* 添加Dom结点 */
    var snowcanvas = document.createElement("canvas");
    snowcanvas.id = "snowfall";
    snowcanvas.width = window.innerWidth;
    snowcanvas.height = document.body.clientHeight;
    snowcanvas.setAttribute("style", "position:absolute; top: 0; left: 0; z-index: 1; pointer-events: none;");
    document.getElementsByTagName("body")[0].appendChild(snowcanvas);
    this.canvas = snowcanvas;
    this.ctx = snowcanvas.getContext("2d");
    /* 窗口大小改变的处理 */
    window.onresize = function() {
        snowcanvas.width = window.innerWidth;
        /* snowcanvas.height = window.innerHeight */
    }
}
/* 雪运动对象 */
function flakeMove(canvasWidth, canvasHeight, flakeSize, fallSpeed) {
    this.x = Math.floor(Math.random() * canvasWidth);   /* x坐标 */
    this.y = Math.floor(Math.random() * canvasHeight);  /* y坐标 */
    this.size = Math.random() * flakeSize + 2;          /* 形状 */
    this.maxSize = flakeSize;                           /* 最大形状 */
    this.speed = Math.random() * 1 + fallSpeed;         /* 坠落速度 */
    this.fallSpeed = fallSpeed;                         /* 坠落速度 */
    this.velY = this.speed;                             /* Y方向速度 */
    this.velX = 0;                                      /* X方向速度 */
    this.stepSize = Math.random() / 30;                 /* 步长 */
    this.step = 0                                       /* 步数 */
}
flakeMove.prototype.update = function() {
    var x = this.x,
        y = this.y;
    /* 左右摆动(余弦) */
    this.velX *= 0.98;
    if (this.velY <= this.speed) {
        this.velY = this.speed
    }
    this.velX += Math.cos(this.step += .05) * this.stepSize;

    this.y += this.velY;
    this.x += this.velX;
    /* 飞出边界的处理 */
    if (this.x >= canvas.width || this.x <= 0 || this.y >= canvas.height || this.y <= 0) {
        this.reset(canvas.width, canvas.height)
    }
};
/* 飞出边界-放置最顶端继续坠落 */
flakeMove.prototype.reset = function(width, height) {
    this.x = Math.floor(Math.random() * width);
    this.y = 0;
    this.size = Math.random() * this.maxSize + 2;
    this.speed = Math.random() * 1 + this.fallSpeed;
    this.velY = this.speed;
    this.velX = 0;
};
// 渲染雪花-随机形状（此处可修改雪花颜色！！！）
flakeMove.prototype.render = function(ctx) {
    var snowFlake = ctx.createRadialGradient(this.x, this.y, 0, this.x, this.y, this.size);
    snowFlake.addColorStop(0, "rgba(255, 255, 255, 0.9)");  /* 此处是雪花颜色，默认是白色 */
    snowFlake.addColorStop(.5, "rgba(255, 255, 255, 0.5)"); /* 若要改为其他颜色，请自行查 */
    snowFlake.addColorStop(1, "rgba(255, 255, 255, 0)");    /* 找16进制的RGB 颜色代码。 */
    ctx.save();
    ctx.fillStyle = snowFlake;
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
    ctx.fill();
    ctx.restore();
};
/* 创建雪花-定义形状 */
function createFlakes() {
    var maxFlake = this.maxFlake,
        flakes = this.flakes = [],
        canvas = this.canvas;
    for (var i = 0; i < maxFlake; i++) {
        flakes.push(new flakeMove(canvas.width, canvas.height, this.flakeSize, this.fallSpeed))
    }
}
/* 画雪 */
function drawSnow() {
    var maxFlake = this.maxFlake,
        flakes = this.flakes;
    ctx = this.ctx, canvas = this.canvas, that = this;
    /* 清空雪花 */
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    for (var e = 0; e < maxFlake; e++) {
        flakes[e].update();
        flakes[e].render(ctx);
    }
    /*  一帧一帧的画 */
    this.loop = requestAnimationFrame(function() {
        drawSnow.apply(that);
    });
}
/* 调用及控制方法 */
var snow = new snowFall({maxFlake:60});
snow.start();
```
{% endspoiler %}



### sakura.js

{% spoiler "示例代码" %}
```js
			var stop, staticx;
			var img = new Image();
			img.src = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUgAAAEwCAYAAADVZeifAAAACXBIWXMAAACYAAAAmAGiyIKYAAAHG2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXBSaWdodHM9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9yaWdodHMvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtbG5zOnN0RXZ0PSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VFdmVudCMiIHhtbG5zOnhtcD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLyIgeG1sbnM6ZGM9Imh0dHA6Ly9wdXJsLm9yZy9kYy9lbGVtZW50cy8xLjEvIiB4bWxuczpwaG90b3Nob3A9Imh0dHA6Ly9ucy5hZG9iZS5jb20vcGhvdG9zaG9wLzEuMC8iIHhtcFJpZ2h0czpNYXJrZWQ9IkZhbHNlIiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6NDFDMjQxQjYyNjIwNjgxMTgwODNEMjE2MDAzOTU1NDQiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDozNDVjOWViOC04NDc4LTFkNDctOGRjMi0yZDkyOGNhYTYxZWQiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6YjAzN2ZiMGItNTU5Mi0xYjRkLWJjZGQtOWU4NGExMDJiMGM2IiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDE4LTA1LTA5VDE0OjQ5OjM3KzA4OjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAxOC0wNS0wOVQxNDo1MToyNSswODowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAxOC0wNS0wOVQxNDo1MToyNSswODowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjEyMjVlZWE3LTEyY2QtMTY0NC04ZDAzLWFjOTE2ZTAxZDQ1YyIgc3RSZWY6ZG9jdW1lbnRJRD0idXVpZDoxRDIwNUFGNjZCRDlFNTExOUM5REMwMzg2RjlEQjFGNyIvPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDphYmMzNjIzMy1hOWNkLWNiNDQtODViYi0zZTgyMjEwYmIxMjYiIHN0RXZ0OndoZW49IjIwMTgtMDUtMDlUMTQ6NTE6MjUrMDg6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6YjAzN2ZiMGItNTU5Mi0xYjRkLWJjZGQtOWU4NGExMDJiMGM2IiBzdEV2dDp3aGVuPSIyMDE4LTA1LTA5VDE0OjUxOjI1KzA4OjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgQ0MgMjAxOCAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPC9yZGY6U2Vx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";

			function Sakura(x, y, s, r, fn) {
				this.x = x;
				this.y = y;
				this.s = s;
				this.r = r;
				this.fn = fn;
			}
	
			Sakura.prototype.draw = function(cxt) {
				cxt.save();
				var xc = 40 * this.s / 4;
				cxt.translate(this.x, this.y);
				cxt.rotate(this.r);
				cxt.drawImage(img, 0, 0, 40 * this.s, 40 * this.s)
				cxt.restore();
			}
	
			Sakura.prototype.update = function() {
				this.x = this.fn.x(this.x, this.y);
				this.y = this.fn.y(this.y, this.y);
				this.r = this.fn.r(this.r);
				if(this.x > window.innerWidth ||
					this.x < 0 ||
					this.y > window.innerHeight ||
					this.y < 0
				) {
					this.r = getRandom('fnr');
					if(Math.random() > 0.4) {
						this.x = getRandom('x');
						this.y = 0;
						this.s = getRandom('s');
						this.r = getRandom('r');
					} else {
						this.x = window.innerWidth;
						this.y = getRandom('y');
						this.s = getRandom('s');
						this.r = getRandom('r');
					}
				}
			}
	
			SakuraList = function() {
				this.list = [];
			}
			SakuraList.prototype.push = function(sakura) {
				this.list.push(sakura);
			}
			SakuraList.prototype.update = function() {
				for(var i = 0, len = this.list.length; i < len; i++) {
					this.list[i].update();
				}
			}
			SakuraList.prototype.draw = function(cxt) {
				for(var i = 0, len = this.list.length; i < len; i++) {
					this.list[i].draw(cxt);
				}
			}
			SakuraList.prototype.get = function(i) {
				return this.list[i];
			}
			SakuraList.prototype.size = function() {
				return this.list.length;
			}
	
			function getRandom(option) {
				var ret, random;
				switch(option) {
					case 'x':
						ret = Math.random() * window.innerWidth;
						break;
					case 'y':
						ret = Math.random() * window.innerHeight;
						break;
					case 's':
						ret = Math.random();
						break;
					case 'r':
						ret = Math.random() * 6;
						break;
					case 'fnx':
						random = -0.5 + Math.random() * 1;
						ret = function(x, y) {
							return x + 0.5 * random - 1.7;
						};
						break;
					case 'fny':
						random = 1.5 + Math.random() * 0.7
						ret = function(x, y) {
							return y + random;
						};
						break;
					case 'fnr':
						random = Math.random() * 0.03;
						ret = function(r) {
							return r + random;
						};
						break;
				}
				return ret;
			}
	
			function startSakura() {
	
				requestAnimationFrame = window.requestAnimationFrame ||
					window.mozRequestAnimationFrame ||
					window.webkitRequestAnimationFrame ||
					window.msRequestAnimationFrame ||
					window.oRequestAnimationFrame;
				var canvas = document.createElement('canvas'),
					cxt;
				staticx = true;
				canvas.height = window.innerHeight;
				canvas.width = window.innerWidth;
				canvas.setAttribute('style', 'position: fixed;left: 0;top: 0;pointer-events: none;');
				canvas.setAttribute('id', 'canvas_sakura');
				document.getElementsByTagName('body')[0].appendChild(canvas);
				cxt = canvas.getContext('2d');
				var sakuraList = new SakuraList();
				for(var i = 0; i < 50; i++) {
					var sakura, randomX, randomY, randomS, randomR, randomFnx, randomFny;
					randomX = getRandom('x');
					randomY = getRandom('y');
					randomR = getRandom('r');
					randomS = getRandom('s');
					randomFnx = getRandom('fnx');
					randomFny = getRandom('fny');
					randomFnR = getRandom('fnr');
					sakura = new Sakura(randomX, randomY, randomS, randomR, {
						x: randomFnx,
						y: randomFny,
						r: randomFnR
					});
					sakura.draw(cxt);
					sakuraList.push(sakura);
				}
				stop = requestAnimationFrame(function() {
					cxt.clearRect(0, 0, canvas.width, canvas.height);
					sakuraList.update();
					sakuraList.draw(cxt);
					stop = requestAnimationFrame(arguments.callee);
				})
			}
	
			window.onresize = function() {
				var canvasSnow = document.getElementById('canvas_snow');
				canvasSnow.width = window.innerWidth;
				canvasSnow.height = window.innerHeight;
			}
	
			img.onload = function() {
				startSakura();
			}
	
			function stopp() {
				if(staticx) {
					var child = document.getElementById("canvas_sakura");
					child.parentNode.removeChild(child);
					window.cancelAnimationFrame(stop);
					staticx = false;
				} else {
					startSakura();
				}
			}


​		



```
{% endspoiler %}



### 参考:

1. [Hexo中NexT主题添加雪花飘落效果_DonLex 的博客-CSDN博客](https://blog.csdn.net/stormdony/article/details/86001618?utm_medium=distribute.pc_relevant.none-task-blog-baidujs_title-4&spm=1001.2101.3001.4242)
2. [html从零开始——为网页加入樱花飘落效果_不会java不改名的博客-CSDN博客_html樱花飘落代码复制](https://blog.csdn.net/weixin_45174208/article/details/103317900?utm_medium=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-2.control&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2~default~BlogCommendFromMachineLearnPai2~default-2.control)



## 心知天气插件

1. 注册[心知天气](https://www.seniverse.com/widget/get)

2. 控制台-产品管理-添加产品(免费版)

3. 新版插件-选择产品

4. 配置插件-获取代码-将代码填入`head.swig`,填到其他位置也行

5. 为插件配置动态加载项,如下

   ```html
   <!-- 心知天气 -->
   {% if theme.weather_widget.enabled and not is_index %}
   	<div id="tp-weather-widget"></div>
   	  <script>
   		(function(a,h,g,f,e,d,c,b){b=function(){d=h.createElement(g);c=h.getElementsByTagName(g)[0];d.src=e;d.charset="utf-8";d.async=1;c.parentNode.insertBefore(d,c)};a["SeniverseWeatherWidgetObject"]=f;a[f]||(a[f]=function(){(a[f].q=a[f].q||[]).push(arguments)});a[f].l=+new Date();if(a.attachEvent){a.attachEvent("onload",b)}else{a.addEventListener("load",b,false)}}(window,document,"script","SeniverseWeatherWidget","//cdn.sencdn.com/widget2/static/js/bundle.js?t="+parseInt((new Date().getTime() / 100000000).toString(),10)));
   		window.SeniverseWeatherWidget('show', {
   		  flavor: "bubble",
   		  location: "WM7B0X53DZW2",
   		  geolocation: true,
   		  language: "zh-Hans",
   		  unit: "c",
   		  theme: "auto",
   		  token: "6f2b0ab7-4bda-4cbe-8ee0-50d827246f1c",
   		  hover: "enabled",
   		  container: "tp-weather-widget"
   		})
   	  </script>
   {% endif %}
   ```
   
6. 编辑 **主题配置文件 _config.yml,添加动态配置项**(复制到**`next.yml`**,方法2)

   ```yaml
   #心知天气
   weather_widget:
     enabled: true
   ```

### 参考:

1. [站点配置更新 | Don Lex](https://donlex.cn/archives/undefined.html)
2. [心知天气](https://www.seniverse.com/widget/get)



## 打字特效

编辑 **主题配置文件 _config.yml,添加动态配置项**(复制到**`next.yml`**,方法2)

```yaml
# 打字特效
typing_effect:
  enabled: true
  colorful: true  # 礼花特效
  shake: true  # 震动特效
```

编辑`head.swig` ,添加如下代码：

```html
<!-- 打字特效 -->
{% if theme.typing_effect.enabled and not is_index %}
  <script src="/js/src/activate-power-mode.min.js"></script>
  <script>
    POWERMODE.colorful = {{ theme.typing_effect.colorful }};
    POWERMODE.shake = {{ theme.typing_effect.shake }};
    document.body.addEventListener('input', POWERMODE);
  </script>
{% endif %}
```

新建`/myblog/source/js/src/activate-power-mode.min.js`,添加下列代码

{% spoiler "示例代码" %}

```js
(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["POWERMODE"] = factory();
	else
		root["POWERMODE"] = factory();
})(this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

	'use strict';
	
	var canvas = document.createElement('canvas');
	canvas.width = window.innerWidth;
	canvas.height = window.innerHeight;
	canvas.style.cssText = 'position:fixed;top:0;left:0;pointer-events:none;z-index:999999';
	window.addEventListener('resize', function () {
	    canvas.width = window.innerWidth;
	    canvas.height = window.innerHeight;
	});
	document.body.appendChild(canvas);
	var context = canvas.getContext('2d');
	var particles = [];
	var particlePointer = 0;
	var rendering = false;
	
	POWERMODE.shake = true;
	
	function getRandom(min, max) {
	    return Math.random() * (max - min) + min;
	}
	
	function getColor(el) {
	    if (POWERMODE.colorful) {
	        var u = getRandom(0, 360);
	        return 'hsla(' + getRandom(u - 10, u + 10) + ', 100%, ' + getRandom(50, 80) + '%, ' + 1 + ')';
	    } else {
	        return window.getComputedStyle(el).color;
	    }
	}
	
	function getCaret() {
	    var el = document.activeElement;
	    var bcr;
	    if (el.tagName === 'TEXTAREA' ||
	        (el.tagName === 'INPUT' && el.getAttribute('type') === 'text')) {
	        var offset = __webpack_require__(1)(el, el.selectionEnd);
	        bcr = el.getBoundingClientRect();
	        return {
	            x: offset.left + bcr.left,
	            y: offset.top + bcr.top,
	            color: getColor(el)
	        };
	    }
	    var selection = window.getSelection();
	    if (selection.rangeCount) {
	        var range = selection.getRangeAt(0);
	        var startNode = range.startContainer;
	        if (startNode.nodeType === document.TEXT_NODE) {
	            startNode = startNode.parentNode;
	        }
	        bcr = range.getBoundingClientRect();
	        return {
	            x: bcr.left,
	            y: bcr.top,
	            color: getColor(startNode)
	        };
	    }
	    return { x: 0, y: 0, color: 'transparent' };
	}
	
	function createParticle(x, y, color) {
	    return {
	        x: x,
	        y: y,
	        alpha: 1,
	        color: color,
	        velocity: {
	            x: -1 + Math.random() * 2,
	            y: -3.5 + Math.random() * 2
	        }
	    };
	}
	
	function POWERMODE() {
	    { // spawn particles
	        var caret = getCaret();
	        var numParticles = 5 + Math.round(Math.random() * 10);
	        while (numParticles--) {
	            particles[particlePointer] = createParticle(caret.x, caret.y, caret.color);
	            particlePointer = (particlePointer + 1) % 500;
	        }
	    }
	    { // shake screen
	        if (POWERMODE.shake) {
	            var intensity = 1 + 2 * Math.random();
	            var x = intensity * (Math.random() > 0.5 ? -1 : 1);
	            var y = intensity * (Math.random() > 0.5 ? -1 : 1);
	            document.body.style.marginLeft = x + 'px';
	            document.body.style.marginTop = y + 'px';
	            setTimeout(function() {
	                document.body.style.marginLeft = '';
	                document.body.style.marginTop = '';
	            }, 75);
	        }
	    }
	    if(!rendering){
	        requestAnimationFrame(loop);
	    }
	};
	POWERMODE.colorful = false;
	
	function loop() {
	    rendering = true;
	    context.clearRect(0, 0, canvas.width, canvas.height);
	    var rendered = false;
	    var rect = canvas.getBoundingClientRect();
	    for (var i = 0; i < particles.length; ++i) {
	        var particle = particles[i];
	        if (particle.alpha <= 0.1) continue;
	        particle.velocity.y += 0.075;
	        particle.x += particle.velocity.x;
	        particle.y += particle.velocity.y;
	        particle.alpha *= 0.96;
	        context.globalAlpha = particle.alpha;
	        context.fillStyle = particle.color;
	        context.fillRect(
	            Math.round(particle.x - 1.5) - rect.left,
	            Math.round(particle.y - 1.5) - rect.top,
	            3, 3
	        );
	        rendered = true;
	    }
	    if(rendered){
	        requestAnimationFrame(loop);
	    }else{
	        rendering = false;
	    }
	}
	
	module.exports = POWERMODE;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

	/* jshint browser: true */
	
	(function () {
	
	// The properties that we copy into a mirrored div.
	// Note that some browsers, such as Firefox,
	// do not concatenate properties, i.e. padding-top, bottom etc. -> padding,
	// so we have to do every single property specifically.
	var properties = [
	  'direction',  // RTL support
	  'boxSizing',
	  'width',  // on Chrome and IE, exclude the scrollbar, so the mirror div wraps exactly as the textarea does
	  'height',
	  'overflowX',
	  'overflowY',  // copy the scrollbar for IE
	
	  'borderTopWidth',
	  'borderRightWidth',
	  'borderBottomWidth',
	  'borderLeftWidth',
	  'borderStyle',
	
	  'paddingTop',
	  'paddingRight',
	  'paddingBottom',
	  'paddingLeft',
	
	  // https://developer.mozilla.org/en-US/docs/Web/CSS/font
	  'fontStyle',
	  'fontVariant',
	  'fontWeight',
	  'fontStretch',
	  'fontSize',
	  'fontSizeAdjust',
	  'lineHeight',
	  'fontFamily',
	
	  'textAlign',
	  'textTransform',
	  'textIndent',
	  'textDecoration',  // might not make a difference, but better be safe
	
	  'letterSpacing',
	  'wordSpacing',
	
	  'tabSize',
	  'MozTabSize'
	
	];
	
	var isFirefox = window.mozInnerScreenX != null;
	
	function getCaretCoordinates(element, position, options) {
	
	  var debug = options && options.debug || false;
	  if (debug) {
	    var el = document.querySelector('#input-textarea-caret-position-mirror-div');
	    if ( el ) { el.parentNode.removeChild(el); }
	  }
	
	  // mirrored div
	  var div = document.createElement('div');
	  div.id = 'input-textarea-caret-position-mirror-div';
	  document.body.appendChild(div);
	
	  var style = div.style;
	  var computed = window.getComputedStyle? getComputedStyle(element) : element.currentStyle;  // currentStyle for IE < 9
	
	  // default textarea styles
	  style.whiteSpace = 'pre-wrap';
	  if (element.nodeName !== 'INPUT')
	    style.wordWrap = 'break-word';  // only for textarea-s
	
	  // position off-screen
	  style.position = 'absolute';  // required to return coordinates properly
	  if (!debug)
	    style.visibility = 'hidden';  // not 'display: none' because we want rendering
	
	  // transfer the element's properties to the div
	  properties.forEach(function (prop) {
	    style[prop] = computed[prop];
	  });
	
	  if (isFirefox) {
	    // Firefox lies about the overflow property for textareas: https://bugzilla.mozilla.org/show_bug.cgi?id=984275
	    if (element.scrollHeight > parseInt(computed.height))
	      style.overflowY = 'scroll';
	  } else {
	    style.overflow = 'hidden';  // for Chrome to not render a scrollbar; IE keeps overflowY = 'scroll'
	  }
	
	  div.textContent = element.value.substring(0, position);
	  // the second special handling for input type="text" vs textarea: spaces need to be replaced with non-breaking spaces - http://stackoverflow.com/a/13402035/1269037
	  if (element.nodeName === 'INPUT')
	    div.textContent = div.textContent.replace(/\s/g, "\u00a0");
	
	  var span = document.createElement('span');
	  // Wrapping must be replicated *exactly*, including when a long word gets
	  // onto the next line, with whitespace at the end of the line before (#7).
	  // The  *only* reliable way to do that is to copy the *entire* rest of the
	  // textarea's content into the <span> created at the caret position.
	  // for inputs, just '.' would be enough, but why bother?
	  span.textContent = element.value.substring(position) || '.';  // || because a completely empty faux span doesn't render at all
	  div.appendChild(span);
	
	  var coordinates = {
	    top: span.offsetTop + parseInt(computed['borderTopWidth']),
	    left: span.offsetLeft + parseInt(computed['borderLeftWidth'])
	  };
	
	  if (debug) {
	    span.style.backgroundColor = '#aaa';
	  } else {
	    document.body.removeChild(div);
	  }
	
	  return coordinates;
	}
	
	if (typeof module != "undefined" && typeof module.exports != "undefined") {
	  module.exports = getCaretCoordinates;
	} else {
	  window.getCaretCoordinates = getCaretCoordinates;
	}
	
	}());

/***/ })
/******/ ])
});
;
```
{% endspoiler %}



### 参考

1. [activate-power-mode](https://github.com/suyin-long/activate-power-mode)



## 新建文章后自动打开

新建`/myblog/scripts`文件夹,在文件夹里新建任意名称`.js`文件,填入下列代码

```js
var spawn = require('child_process').exec;

// Hexo 3 用户复制这段
hexo.on('new', function(data){
  spawn('start  "D:\Typora\Typora.exe" ' + data.path);
});
```

### 参考

1. [Hexo 添加文章时自动打开编辑器 | 苏寅 Blog (suyin-blog.club)](https://suyin-blog.club/2019/3KZMBAF/)
2. [Open markdown file after running hexo new? · Issue #1007 · hexojs/hexo (github.com)](https://github.com/hexojs/hexo/issues/1007)



## 标签云

使用命令行进行安装

```bash
npm install hexo-tag-cloud@^2.0.* --save 
```

编辑`/_data/sidebar.swig`,在合适的位置填入代码 

```html
<!--标签云 -->
{% if site.tags.length > 1 and theme.tag_cloud.enabled and not is_index %}
<script type="text/javascript" charset="utf-8" src="{{ url_for('/js/tagcloud.js') }}"></script>
<script type="text/javascript" charset="utf-8" src="{{ url_for('/js/tagcanvas.js') }}"></script>
<div class="widget-wrap">
	<!--<div style="font-family: 'comic sans ms', courier; font-size: 16px;">Tag Cloud</div>-->
    <div id="myCanvasContainer" class="widget tagcloud">
        <canvas width="250" height="250" id="resCanvas" style="width:100%">
            {{ list_tags() }}
        </canvas>
    </div>
</div>
{% endif %}
```

编辑 **主题配置文件 _config.yml,添加动态配置项**(复制到**`next.yml`**,方法2)

```yaml
# 标签云
tag_cloud:
  enabled: true
  textFont: Trebuchet MS, Helvetica
  textColor: '#333'
  textHeight: 25
  outlineColor: '#E2E1D1'
  maxSpeed: 0.5
  pauseOnSelected: true # true 意味着当选中对应 tag 时,停止转动 
```

### 参考

1. [站点配置更新 | Don Lex](https://donlex.cn/archives/undefined.html)
2. [Hexo博客Next主题建立标签云hexo-tag-cloud及效果展示_AomanHao的博客-CSDN博客](https://blog.csdn.net/Aoman_Hao/article/details/89416634)
3. [hexo-tag-cloud中文文档](https://github.com/D0n9X1n/hexo-tag-cloud/blob/master/README.ZH.md)



## 自动备份 Hexo 博客源文件

同样,在 **Hexo** 根目录的 **scripts** 文件夹下新建一个 js 文件，文件名随意取,,填入下列代码

```js
require('shelljs/global');

try {
	hexo.on('deployAfter', function() {//当deploy完成后执行备份
		run();
	});
} catch (e) {
	console.log("产生了一个错误<(￣3￣)> !，错误详情为：" + e.toString());
}

function run() {
	if (!which('git')) {
		echo('Sorry, this script requires git');
		exit(1);
	} else {
		echo("======================Auto Backup Begin===========================");
		cd('D:/Code/MyBlog');    //此处修改为Hexo根目录路径
		if (exec('git add --all').code !== 0) {
			echo('Error: Git add failed');
			exit(1);

		}
		if (exec('git commit -am "Form auto backup script\'s commit"').code !== 0) {
			echo('Error: Git commit failed');
			exit(1);

		}
		if (exec('git push origin source').code !== 0) {
			echo('Error: Git push failed');
			exit(1);

		}
		echo("==================Auto Backup Complete============================")
	}
}

```

**注意,修改代码*Hexo根目录路径*与*分支名***

接着,在命令行输入,安装 **shelljs** 模块

```bash
npm install --save shelljs
```



##  关闭畅言统计

**看着不爽**

找到`changyan.js`,找到`if post.comments`,更改为`if post.comments and theme.changyan.comment`

随后编辑 **主题配置文件 _config.yml**(复制到**`next.yml`**,方法2)

```yaml
# 畅言
changyan:
  enable: true
  appid: cyvs0PiIk
  appkey: a868a79f4480491e7870339ebcbcd8b7
  comment: false
  #post_meta_order: 0
```

其实不加也行

## Tag Plugins

{% cq %}世间所有的相遇，都是久别重逢{% endcq %}

{% note 点击显/隐内容 %}
世间所有的相遇，都是久别重逢
{% endnote %}



### 参考

1. [Tag Plugins | Hexo](https://hexo.io/docs/tag-plugins.html)
2. [内置标签 - NexT 使用文档 (iissnan.com)](http://theme-next.iissnan.com/tag-plugins.html)
3. [Hexo-NexT Tag 插件的使用 | 小丁的个人博客 (tding.top)](https://tding.top/archives/29bfe8c9.html)



## 首字下沉

编辑`style.styl`,添加

```css
// 首字下沉
.post-body>p:first-child::first-letter{
  float: left;
/* height: 32px;*/
  margin-top: 14px;
  margin-right: 6px;
  color: #555;
  font-size: 42px;
  line-height: 28px;
  font-style: normal;
  font-weight: 400;
  +mobile(){
    margin-top: 10px;
    margin-right: 4px;
    font-size: 26px;
    line-height: 20px;
  }
}
```





## 总结

1. /myblog/source文件
2. 1. js文件
   2. pace three
3. 编辑themes/next/languages/zh-CN.yml
4. **站点配置文件 _config.yml**
5. 编辑changyan.js
6. 26. 设置「文章置顶」
7. npm install hexo-symbols-count-time
8. npm install -save hexo-helper-live2d
9. npm install --save live2d-widget-model-wanko
10. npm install --save shelljs
11. npm install hexo-tag-cloud@^2.0.* --save 
12. spoiler插件文件夹
13. npm install hexo-sliding-spoiler --save



# 参考

1. [img 403的解决办法](https://blog.csdn.net/nookl/article/details/94217402)
2. [又见苍岚 ](https://www.zywvvd.com/)
3. [Hexo -13- 利用 Markdown 语法画 flowchart 流程图 | 又见苍岚 (zywvvd.com)](https://www.zywvvd.com/2020/11/23/hexo/13_flowchart/flowchart/)
4. [Hexo -10- 使用PicGo配合七牛云图床实现Markdown图像无痛管理 | 又见苍岚 (zywvvd.com)](https://www.zywvvd.com/2020/03/26/hexo/10_using_picgo/using-picgo/)
5. [Hexo-NexT 增加 canvas 粒子时钟 | 小丁的个人博客 (tding.top)](https://tding.top/archives/dd68b70.html)
6. [HTML5 Canvas实现会跳舞的时间动画 | HTML5资源教程 (html5tricks.com)](https://www.html5tricks.com/html5-canvas-dance-time.html)
7. [Hexo 加入豆瓣读书页面 | 小丁的个人博客 (tding.top)](https://tding.top/archives/c7ba3a41.html)
8. [Hexo-NexT 实现相册 | 小丁的个人博客 (tding.top)](https://tding.top/archives/607c3b85.html)
9. [Hexo NexT主题美化2.0 | Leaface (liaofuzhan.com)](http://www.liaofuzhan.com/posts/2114475547.html)
10. [hexo史上最全搭建教程_Fangzh的技术博客-CSDN博客_hexo](https://blog.csdn.net/sinat_37781304/article/details/82729029)
11. [Archive | ookamiAntD's Blog (yangbingdong.com)](https://yangbingdong.com/archives/page/3/)
12. [【搜索优化】Hexo-next百度和谷歌搜索优化 | Ehcoo](http://www.ehcoo.com/seo.html)
13. [打造个性超赞博客 Hexo + NexT + GitHub Pages 的超深度优化 | reuixiy (io-oi.me)](https://io-oi.me/tech/hexo-next-optimization/)
14. [Setting Up Image Storage | imgix Documentation](https://docs.imgix.com/setup/image-storage)



# 问题

1. 无法更换天气位置

2. 在文章标题下添加热门链接

3. 侧栏的滚动条隐藏

4. ~~长代码折叠~~

   使用**`<details><summary></summary></details>`**隐藏,如下例
   
   ~~~html
   <details>
   	<summary><strong>示例代码</strong></summary>
   	```python
   	//这里是示例代码
   	print("hello world")
   	```
   </details>
	~~~

   **效果展示**

   <details>
       <summary><strong>示例代码</strong></summary>
       ```python
       //这里是示例代码
       print("hello world")
       ```
   </details>
   {% spoiler "spoilercss" %}
   
   ```css
   .spoiler {
       margin: 5px 0;
       padding: 0 15px;
       border: 1px solid #fff);
   	border-left: 3px solid #64ceaa;
       position: relative;
       clear: both;
       border-radius: 3px;
   }
   
   .spoiler .spoiler-title {
       background: #fff;
       margin: 0 -15px;
       padding: 5px 15px;
       color: #000;
       font-weight: bold;
       font-size: 20px;
       display: block;
       cursor: pointer;
   }
   
   .spoiler .spoiler-title:before {
       font-weight: bold;
   }
   
   .spoiler.collapsed .spoiler-title:before {
       content: "▼ ";
   }
   
   .spoiler.expanded .spoiler-title:before {
       content: "▲ ";
   }
   
   .spoiler .spoiler-content {
       padding-top: 0;
       padding-bottom: 0;
       margin-top: 0;
       margin-bottom: 0;
       -moz-transition-duration: 0.3s;
       -webkit-transition-duration: 0.3s;
       -o-transition-duration: 0.3s;
       transition-duration: 0.3s;
       -moz-transition-timing-function: ease-in-out;
       -webkit-transition-timing-function: ease-in-out;
       -o-transition-timing-function: ease-in-out;
       transition-timing-function: ease-in-out;
   }
   
   .spoiler.collapsed .spoiler-content {
       overflow: hidden;
       max-height: 0;
   }
   
   .spoiler.expanded .spoiler-content {
       max-height: 3000px;
       overflow: hidden;
   }
   
   .spoiler .spoiler-content p:first-child {
       margin-top: 0 !important;
   }
   ```
   
   {% endspoiler %}


5. 启用谷歌日历
6. 无法更换音乐位置
7. 无法隐藏歌词
8. 为博客添加一个首页
9. `.styl`注释`/*图标的引用*/`
10. `.swig`注释`{# 雪花飘落特效 #}`
11. 所有的`hexo/source`内的js文件移到`theme/source`
12. lib文件夹也一样移到`theme/source`