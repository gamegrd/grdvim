--------------------------------
# 预览
![image](https://raw.githubusercontent.com/gamegrd/grdvim/master/screenshot/2.jpg?raw=true)

# 安装步骤

### 1. clone 到本地

```

git clone https://github.com/gamegrd/grdvim.git ~/.grdvim  
cd ~/.grdvim  
./install.sh  


sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"


```

### 2. 安装依赖包

* 在mac下使用系统剪切板需要安装
* brew install reattach-to-user-namespace

##### 2.1 系统依赖 # ctags, ag(the_silver_searcher)

```
# ubuntu
sudo apt-get install ctags
sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖
sudo apt-get install silversearcher-ag

# centos
 yum install python-devel.x86_64
 yum groupinstall 'Development Tools'
 rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
 yum install the_silver_searcher
 yum install cmake

# mac
brew install ctags
brew install the_silver_searcher
```

##### 2.2 使用Python

```
sudo pip install flake8 yapf
```

##### 2.3 如果使用Javascript(不需要的跳过)

```
# 安装jshint和jslint,用于javascript语法检查
# 需要nodejs支持,各个系统安装见文档 https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager

# ubuntu
apt-get install nodejs npm
npm install -g jslint
npm install jshint -g

# mac
brew install node
npm install jshint -g
npm install jslint -g
```


### 3. 安装

```
cd ~/.grdvim
sh -x install.sh
进入目录, 执行安装
# 会进入安装插件的列表，一安装是从github clone的，完全取决于网速, 之后会自动编译 YCM, 编译失败的话需要手动编译, 有问题见YCM文档
# 如果发现有插件安装失败 可以进入vim, 执行`:PlugInstall'
 

```

------------------------
------------------------

# 移除安装

```
cd ~ && rm -rf .vim .vimrc .vimrc.bundles && cd -
```



------------------------
------------------------

# 插件

### 选择安装插件集合

编辑vimrc.bundles中

```
" more options: ['json', 'nginx', 'golang', 'ruby', 'less', 'json', ]
let g:bundle_groups=['python', 'javascript', 'markdown', 'html', 'css', 'tmux', 'beta']
```

选定集合后, 使用插件管理工具进行安装/更新

### 插件管理


管理插件的命令

```
:PlugInstall     install                      安装插件
:PlugUpdate      install or update            更新插件
:PlugClean       remove plugin not in list    删除本地无用插件
:PlugUpgrade     Upgrade vim-plug itself      升级本身
:PlugStatus      Check the status of plugins  查看插件状态
```



### 插件列表

说明/演示/自定义快捷键等, 待处理

------------------------
------------------------


# 自定义快捷键

```
注意, 以下 '<Space>' 代表<leader>
1. 可以自己修改vimrc中配置，决定是否开启鼠标

set mouse-=a           " 鼠标暂不启用, 键盘党....
set mouse=a            " 开启鼠标

2. 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 如果不需要可以关掉
    好处：误删什么的，如果以前屏幕打开，可以找回....惨痛的经历

set t_ti= t_te=

3. 可以自己修改vimrc决定是否使用方向键进行上下左右移动，默认关闭，强迫自己用 hjkl，可以注解
hjkl  上下左右

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

4. 上排F功能键

F1 废弃这个键,防止调出系统帮助
F2 set nu/nonu,行号开关，用于鼠标复制代码用
F3 set list/nolist,显示可打印字符开关
F4 set wrap/nowrap,换行开关
F5 set paste/nopaste,粘贴模式paste_mode开关,用于有格式的代码粘贴
F6 syntax on/off,语法开关，关闭语法可以加快大文件的展示
F8 tagbar
F9 运行当前文件(quickrun)

5. 分屏移动

ctrl + j/k/h/l   进行上下左右窗口跳转,不需要ctrl+w+jkhl

6. 搜索
<space> 空格，进入搜索状态
/       同上
<Space>/      去除匹配高亮

(交换了#/* 号键功能, 更符合直觉, 其实是离左手更近)
#       正向查找光标下的词
*       反向查找光标下的词

优化搜索保证结果在屏幕中间

7. tab操作
ctrl+t 新建一个tab

(hjkl)
<Space>th    切第1个tab
<Space>tl    切最后一个tab
<Space>tj    下一个tab
<Space>tk    前一个tab

<Space>tn    下一个tab(next)
<Space>tp    前一个tab(previous)

<Space>td    关闭tab
<Space>te    tabedit
<Space>tm    tabm

<Space>1     切第1个tab
<Space>2     切第2个tab
...
<Space>9     切第9个tab
<Space>0     切最后一个tab

<Space>tt 最近使用两个tab之间切换
(可修改配置位 ctrl+o,  但是ctrl+o/i为系统光标相关快捷键, 故不采用)

8. buffer操作(不建议, 建议使用ctrlspace插件来操作)
[b    前一个buffer
]b    后一个buffer
<-    前一个buffer
->    后一个buffer


9. 按键修改
Y         =y$   复制到行尾
U         =Ctrl-r
<Space>sa       select all,全选
<Space>v        选中段落
kj        代替<Esc>，不用到角落去按esc了


ctrl+n    相对/绝对行号切换
<enter>   normal模式下回车选中当前项
<Space>e        打开NERDTree

更多细节优化:
    1. j/k 对于换行展示移动更友好
    2. HL 修改成 ^$, 更方便在同行移动
    3. ; 修改成 : ，一键进入命令行模式，不需要按shift
    4. 命令行模式 ctrl+a/e 到开始结尾
    5. <和> 代码缩进后自动再次选中, 方便连续多次缩进, esc退出
    6. 对py文件，保存自动去行尾空白，打开自动加行首代码
    7. 'w!!'强制保存, 即使readonly
    8. 去掉错误输入提示
    9. 交换\`和', '能跳转到准确行列位置
    10. python/ruby 等, 保存时自动去行尾空白
    11. 统一所有分屏打开的操作位v/s[nerdtree/ctrlspace] (特殊ctrlp ctrl+v/x)
    12. '<Space>zz' 代码折叠toggle
    13. python使用"""添加docstring会自动补全三引号
    14. Python使用#进行注释时, 自动缩进
```

6.折叠

     1.1折叠的方式有六种
          manual:以标准的vim结构定义折叠跨越的范围，类似移动命令
          indent:折叠与折叠的层次，对应于文本的缩排与shiftwidth选项值
          expr:以正则表达式定义折叠
          syntax:折叠对应于文件所用的程序语言语义
          diff：以两个文件的差异定义折叠
          marker:以文件定义的标记指定折叠边界
     1.2折叠命令
          所有的折叠相关命令都以“z”开始，常用折叠命令如下：
          zA：递归切换折叠状态
          zC：递归关闭折叠状态
          zD：递归删除折叠
          zE：去除所有折叠
          zf：创建折叠（只计算看得见的行）
          countzF：创建包含count行的折叠（只计算看得见的行）
          zM：设置foldlevel选项为0
          zN，zn：设置（zN）或复位（zn）foldenable选项
          zo：递归打开折叠
          za：切换一个折叠的状态
          zc：关闭一个折叠
          zd：删除一个折叠
          zi：切换foldenable选项的值
          zk，zj：移动光标到下一个折叠开始的地方或相反方向
          zm，zr：递减或递增foldlevel选项的值
          zo：打开一个折叠
          zM:递归关闭所有折叠
          zR:递归打开所有折叠
     1.3常用折叠设置
          :set foldcolumn=n  ：设置折叠状态列宽度（左边框）
          :set foldmethod=(六种方式的任意一种）：设置折叠模式
          :set foldlevel=n ：设置显示的折叠层次，小余等于n的将被显示
     1.4对于折叠的操作都是对折叠内的所有内容生效

7. NERDTree
    ?: 快速帮助文档
    o: 打开一个目录或者打开文件，创建的是buffer，也可以用来打开书签
    go: 打开一个文件，但是光标仍然留在NERDTree，创建的是buffer
    t: 打开一个文件，创建的是Tab，对书签同样生效
    T: 打开一个文件，但是光标仍然留在NERDTree，创建的是Tab，对书签同样生效
    i: 水平分割创建文件的窗口，创建的是buffer
    gi: 水平分割创建文件的窗口，但是光标仍然留在NERDTree
    s: 垂直分割创建文件的窗口，创建的是buffer
    gs: 和gi，go类似
    x: 收起当前打开的目录
    X: 收起所有打开的目录
    e: 以文件管理的方式打开选中的目录
    D: 删除书签
    P: 大写，跳转到当前根路径
    p: 小写，跳转到光标所在的上一级路径
    K: 跳转到第一个子路径
    J: 跳转到最后一个子路径
    <C-j>和<C-k>: 在同级目录和文件间移动，忽略子目录和子文件
    C: 将根路径设置为光标所在的目录
    u: 设置上级目录为根路径
    U: 设置上级目录为跟路径，但是维持原来目录打开的状态
    r: 刷新光标所在的目录
    R: 刷新当前根路径
    I: 显示或者不显示隐藏文件
    f: 打开和关闭文件过滤器
    q: 关闭NERDTree
    A: 全屏显示NERDTree，或者关闭全屏



8. Neovim 
    是能使用 vim 的配置文件的，如果有 vim 的配置，直接软链接就好：

    $(~) ln -s ~/.vim .config/nvim
    $(~) ln -s ~/.vimrc .config/nvim/init.vim
    如果没有 vim 的配置文件，但想 vim 和 nvim 使用同一个配置，也按上面的方法配置就行。
    　　有时 neovim 的某些指令在 vim 中是不能使用的, 所以可使用 has('nvim') 来判断当前使用的版本：

    if has('nvim')
        ...
    endif
    如果想 nvim 单独使用一个配置，那就在 .config 下创建配置文件就行：

    $(~) mkdir .config/nvim
    $(~) touch .config/nvim/init.vim
    2.2 插件管理

    能在 neovim 中使用的插件管理工具有不少，这里介绍的是 vim-plug 。
    　　安装方法很简单，只要一条命令：

    $ curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


