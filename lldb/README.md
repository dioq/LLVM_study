# lldb调试

## 打开lldb 并附加到指定进程
lldb                        # 打开lldb				        
### 调试本地进程
process attach --pid [pid]	# 附加到本地进程
### 调试远程进程
process connect connect://<host>:<port>
如:
process connect connect://127.0.0.1:8090

## 调试命令
b [vmaddr]	                # breakpoint 对内存地址下断点
c	                        # continue 程序继续执行
po                          # print object 常用于查看对象信息
breakpoint set -n [symbol]  # 给某函数下断点,可以连用形成断点组 breakpoint set -n "[类名 SEL]" -n "[类名 SEL]" ...
breakpoint list             # 查看当前断点列表
image list	                # 列出所有加载的模块
image list -o -f [module]	# 只列出输入模块名信息
bt	                        # thread backtrace 查看当前调用栈



禁用(启用)某一组(某一个)断点
breakpoint disable(enable)  组号(编号)
禁用某一个断点
breakpoint delete  编号	        
删除某一组断点
breakpoint delete  组号	        
删除所有断点
breakpoint delete	            
全局方法断点,工程所有该方法都会下断点
breakpoint set --selectore 方法名	
给.m实现文件某个方法下断点
brepoint set --file 文件名.m --selector 方法名	
遍历整个工程，含该字串的方法、函数都会下断点
breakpoint set -r 字符串	
某标号断点过后执行相应命令，以Done结束，类似于Xcode界面Edit breakpoint
breakpoint command add 标号	
列出断点过后执行的命令
breakpoint command list 标号	
删除断点过后执行的命令
breakpoint command delete	
暂停程序
process interrput	
up	查看上一个调用函数
down	查看下一个调用函数
frame variable	查看函数参数
frame select 标号	查看指定调用函数
dis -a $pc	反汇编指定地址,此处为pc寄存器对应地址
thread info	输出当前线程信息
b trace -c xxx	满足某个条件后中断
target stop-hook add -o "frame variable"	断点进入后默认做的操作,这里是打印参数
help 指令	查看指令信息

n	将子函数整体一步执行，源码级别
s	跳进子函数一步一步执行，源码级别
ni	跳到下一条指令,汇编级别
si	跳到当前指令内部，汇编级别
finish	返回上层调用栈
thread return	不再执行往下代码，直接从当前调用栈返回一个值
register read	读取所有寄存器值
register read $x0	读取x0寄存器值
register write $x1 10	修改x1寄存器的值为10
p/x	以十六进制形式读取值，读取的对象可以很多
watchpoint set variable p->_name	给属性添加内存断点，属性改变时会触发断点，可以看到属性的新旧值，类似KVO效果
watchpoint set expression 变量内存地址	效果同上

大部分命令可以缩写，这里列出部分几个，可以多尝试缩写，用多了就自然记住了:

breakpoint :br、b
list:li
delete:del
disable:dis
enable:ena
