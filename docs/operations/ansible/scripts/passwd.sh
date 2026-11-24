#!/bin/bash

# ansible -m shell -a 'echo karakal | sudo passwd --stdin karakal' centos
# ansible -m shell -a 'echo karakal | sudo passwd --stdin hadoop'  centos
# ansible -m shell -a 'echo karakal | sudo passwd --stdin capture' centos
# ansible -m shell -a 'echo karakal | sudo passwd --stdin devops'  centos

# 注意: 因为有些服务器没有对应的用户, 返回信息的颜色是红色, 忽略即可
# 不要根据颜色判断状态, 根据文字提示判断命令是否执行成功
ansible -m shell -a 'for i in karakal hadoop capture devops; do echo karakal | sudo passwd --stdin $i; done' centos
