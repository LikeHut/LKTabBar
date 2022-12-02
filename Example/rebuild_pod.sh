#!/bin/sh
# 重新打包Pod，方便测试

# 删除原来的Pod并打印
rm -rfv Pods
rm -rfv Podfile.lock

# 安装Pods
pod install
