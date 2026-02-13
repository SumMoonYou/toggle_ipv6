# Toggle IPv6 脚本

一个简单的 Bash 脚本，用于在 Linux 系统中切换 IPv6 的启用或禁用状态。

## 特性

- **切换 IPv6**：通过一个命令在启用和禁用 IPv6 之间切换。
- **简洁高效**：自动检查当前 IPv6 状态并根据需要切换。

## 安装

```
bash -c "$(curl -L https://raw.githubusercontent.com/SumMoonYou/toggle_ipv6/main/toggle_ipv6.sh?t=$(date +%s))" @ install
```

脚本会检查当前 IPv6 状态。如果 IPv6 已启用，则禁用它；如果 IPv6 已禁用，则启用它。

### 示例：

```
$ ./toggle_ipv6.sh
当前 IPv6 已启用，正在禁用 IPv6...
禁用 IPv6...
IPv6 已禁用.
```

如果 IPv6 已禁用，脚本会输出：

```
$ ./toggle_ipv6.sh
当前 IPv6 已禁用，正在启用 IPv6...
启用 IPv6...
IPv6 已启用.
```

## 工作原理

脚本通过 `sysctl` 命令检查当前的 IPv6 状态。根据当前状态，脚本会通过修改 `sysctl` 设置来启用或禁用 IPv6。

### 禁用 IPv6：

- `net.ipv6.conf.all.disable_ipv6=1`
- `net.ipv6.conf.default.disable_ipv6=1`
- `net.ipv6.conf.lo.disable_ipv6=1`

### 启用 IPv6：

- `net.ipv6.conf.all.disable_ipv6=0`
- `net.ipv6.conf.default.disable_ipv6=0`
- `net.ipv6.conf.lo.disable_ipv6=0`
