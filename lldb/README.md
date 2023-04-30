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
breakpoint [vmaddr]	        # b 对内存地址下断点
continue	                # c 程序继续执行
print object                # po 常用于查看对象信息
breakpoint set -n [symbol]  # 给某函数下断点,可以连用形成断点组 breakpoint set -n "[类名 SEL]" -n "[类名 SEL]" ...
breakpoint list             # 查看当前断点列表
image list	                # 列出所有加载的模块
image list -o -f [module]	# 只列出输入模块名信息
thread backtrace	        # bt 查看当前调用栈

### memory read
memory read 简写 x
Command Options Usage:
size指定内存块（block/item）的大小，默认为1byte。
-s(--size)：The size in bytes to use when displaying with the selected format.
count指定内存块（block/item）的个数，可配合起始地址使用。
-c(--count)：The number of total items to display.
format指定内容显示格式，格式符同print：c-char，s-string，d-decimal，x-hex。
-f(--format)：Specify a format to be used for display.
--outfile : 把读取到的数据输出

#### 起始地址到结束地址
memory read [start vmaddr] [end vmaddr]
如:
memory read 0x104e7d620 0x104e7d680
#### 起始地址 + 内存块count
memory read [start vmaddr] -c [byte count]
如:
memory read 0x104e7d620 -c 0x60
#### 起始地址 + 内存块size + 内存块count（dump hex format）
memory read [start vmaddr] -s [block size] -c [block count] -f [form]
如:
memory read 0x1008ad620 -s 16 -c 0x6 -f x
#### --outfile 输出读取到的数据
memory read [start vmaddr] -c [byte count] --outfile [path]
如:
memory read 0x1008ad620 -c 0x60 --outfile /tmp/mem.txt

### memory write
#### 起始地址 + 内存块size + 数据
memory write [start vmaddr] -s [block size] [hex string]
如:
memory write 0x10015d620 -s 0x4 0x10203040
