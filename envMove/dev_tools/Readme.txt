1. 在所给的文件夹下包含3个文件,分别为：
    clang-format：clang-format命令，
    .clang-format：clang-format配置文件，
    clangformat.py：clangformat与vi的配置文件。

2. 首先将文件夹下的clang-format命令加入PATH：
    (cmd) export PATH=<clang-format命令所放置的位置>:$PATH
    这种方法在关闭终端之后就会消失，如果对etc/profile/进行操作可以防止这种情况的发生。

3. 将.clang-format放入自己用户的根目录：
   例如(cmd)：cp <.clang-format所在的目录> <自己工作环境的根目录下比如：~/>。

4. 在vi的配置文件.vimrc的末尾输入，map <C-K> :pyf <path-to-this-file>/clang-format.py<cr>和
    imap <C-K> <c-o>:pyf <path-to-this-file>/clang-format.py<cr>，其中<path-to-this-file>为clang-format.py的路径。

5.1 在vi下对代码进行格式化
    那么现在在vi下便可以通过Ctrl+k来对选中的内容进行格式化，如果要选中多行，
    可以通过visual模式下选择要格式化的内容,然后按下ctrl+k便可以对指定的内容进行格式化。

5.2 在cmd下对代码进行格式化
    clang-format默认情况下的命令格式为clang-format [options] [<file> ...]。
    在cmd下可以使用clang-format  *.cpp/*.h(例如(cmd:)clang-format test.h)可以对指定的文件进行格式化，
	但这个命令并不会真正的对文件进行修改，而是会通过标准输出，对格式化之后的格式进行预览。  
    在cmd下输入clang-format  –i  [<file>……](例如(cmd:)clang-format -i test.h test.cpp)会对指定的一个或多个文件进行格式化。
    在cmd下输入clang-format  –output-replacements-xml [<file>……]可是对修改的地方进行标准输出。

6. 备注
    也可以在cmd下输入clang-format –help来对查找更多的命令
    也可以通过http://clang.llvm.org/docs/ClangFormatStyleOptions.html
    与http://clang.llvm.org/docs/ClangFormat.html网页来查看更多的命令，
    以及对于.clang-format配置参数的意义或者以相似的方式配置emacs。
	如果有错误的地方或者疑问可以发送邮件到：shuanghong.dsh@alibaba-inc.com。