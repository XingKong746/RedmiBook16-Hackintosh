# RedmiBook16黑苹果

[**English**](https://github.com/XingKong746/RedmiBook16-Hackintosh/blob/master/en.md)

> 支持的笔记本[RedmiBook 16](https://www.mi.com/buy/detail?product_id=10000242&cfrom=search) _ _ [RedmiBook 14II](https://www.mi.com/buy/detail?product_id=10000241)

### 支持安装的macOS
- Catalina （[一些说明](#Catalina)）
- BigSur 全版本使用[`v8.5`](https://github.com/XingKong746/RedmiBook16-Hackintosh/releases/tag/v8.5)版本即可
- Monterey 使用最新的[EFI](https://github.com/XingKong746/RedmiBook16-Hackintosh/releases)即可

> 如果你发现此efi其他问题或有现有问题解决办法欢迎[lssues](https://github.com/XingKong746/RedmiBook16-Hackintosh/issues)或进[QQ](#qq交流群)群

## 电脑配置
| 规格   | 详细信息                                                      |
| ------ | ------------------------------------------------------------ |
| CPU    | i7 1065G7 / i5 1035G1                                        |
| 主板   | TIMI TM2003                                                  |
| 内存   | 16.00 GB ( 3200 MHz )                                        |
| 硬盘   | 三星 SAMSUNG MZNLH512HALU-00000                              |
| 显卡   | NVIDIA GeForce MX350 & 英特尔锐炬Plus & Intel(R) UHD Graphics |
| 显示器 | 奇美 CMN 32位真彩色 60Hz                                      |
| 声卡   | Realtek High Definition Audio（ALC256）                      |
| 网卡   | Intel(R) Wi-Fi 6 AX201 160MHz                                |

## 正常的
- 核显 英特尔锐炬Plus & Intel(R) UHD Graphics
- 核显加速
- 声卡 ALC256
- 网卡 AX201
- CPU变频 `i7 1065G7` & `i5 1035G1`
- 睡眠
- 屏幕亮度 最高亮度和Win一样并且开机后无需睡眠就是正常的
- USB 已定制USB驱动两个type-C和USB口均正常
- 3.5mm 耳机接口
- type-C 耳机接口
- 蓝牙 连接耳机，手机
- 3.5mm/type-C/蓝牙耳机麦克风
- 蓝牙键鼠（Monterey）
- 触控板
- 键盘
- `F1` `F2` `F3` `F9`快捷键
- 电池电量显示

## 不正常的
- 内置HDMI
- 内置麦克风

##
#### QQ交流群：
[722693584](https://jq.qq.com/?_wv=1027&k=eHYeqB52)
##

### Catalina
1. v9.0开始不再支持Catalina，若要使用请下载v9以前的版本
2. 并将Kexts里的[AirportItlwm.kext](https://github.com/OpenIntelWireless/itlwm/releases)换成Catalina的

#Credits
