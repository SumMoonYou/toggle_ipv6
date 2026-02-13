#!/bin/bash

# 获取当前 IPv6 状态
ipv6_status=$(sysctl net.ipv6.conf.all.disable_ipv6 | awk '{print $3}')

# 关闭 IPv6
disable_ipv6() {
  echo "禁用 IPv6..."
  sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
  sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
  sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1
  echo "IPv6 已禁用."
}

# 启用 IPv6
enable_ipv6() {
  echo "启用 IPv6..."
  sudo sysctl -w net.ipv6.conf.all.disable_ipv6=0
  sudo sysctl -w net.ipv6.conf.default.disable_ipv6=0
  sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=0
  echo "IPv6 已启用."
}

# 检查当前 IPv6 状态并切换
if [ "$ipv6_status" -eq 1 ]; then
  echo "当前 IPv6 已禁用，正在启用 IPv6..."
  enable_ipv6
else
  echo "当前 IPv6 已启用，正在禁用 IPv6..."
  disable_ipv6
fi
