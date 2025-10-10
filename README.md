# RedmiBook16黑苹果
支持的笔记本`RedmiBook16`、`RedmiBook14II`

### 支持安装的macOS 10.15~26
> 安装macOS需要在BIOS中关闭安全启动
- Catalina
- BigSur
- Monterey
- Ventura
- Sonoma
- Sequoia
- Tahoe

> 如果你有此efi现有问题解决办法欢迎[lssues](https://github.com/XingKong746/RedmiBook16-Hackintosh/issues)

## 我的配置
| 硬件 | 详情                                                                                                                                                |
| ---- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| 主板 | TIMI TM2003 (V34F2) - 3482 for Intel 495 Series                                                                                                     |
| CPU  | Intel(R) Core(TM) i5-1035G1 (8) @ 3.60 GHz<br/>L1 Cache: 4x48.00 KiB (D), 4x32.00 KiB (I)<br/>L2 Cache: 4x512.00 KiB (U)<br/>L3 Cache: 6.00 MiB (U) |
| GPU  | Intel Iris Plus Graphics G1 (Ice Lake) (32) @ 1.05 GHz<br/>NVIDIA GeForce MX350 (2.00 GiB)                                                          |
| 内存 | Samsung DDR4-3200 16G                                                                                                                               |
| 网卡 | Intel(R) Wi-Fi 6 AX201 160MHz (Bluetooth 5.2)                                                                                                       |
| 声卡 | Realtek High Definition Audio ALC256                                                                                                                |
| 硬盘 | SAMSUNG MZNLH512HALU-00000 (PM881)                                                                                                                  |
| 显示 | CMN1608 1920x1080 px @ 60 Hz - 360x200 mm (16.21 inches, 135.87 ppi)                                                                                |
| 电池 | R14B01W                                                                                                                                             |
| 输入 | AT Translated Set 2 keyboard<br/>ETPS/2 Elantech Touchpad<br/>ELAN2309:00 04F3:3182 Mouse<br/>ELAN2309:00 04F3:3182 Touchpad                        |
| TPM  | TPM 2.0 Device                                                                                                                                      |

### 一些高级BIOS配置项
| BIOS配置项                | 位置         | 变量 | 目标                |
| ----------------------- | ----------- | ----- | --------------- |
| CFG Lock                    | CpuSetup | 0x43 | 0x0: Disabled |
| DVMT Pre-Allocated  | SaSetup    | 0xA4 | 0x5: 160M      |
| DVMT Total Gfx Mem | SaSetup    | 0xA5 | 0x3: MAX       |
| VT-d                           | SaSetup    | 0xA7 | 0x0: Disabled |
| State After G3             | PchSetup | 0x1B  | 0x0: S0 State  |
- 推荐更改这些配置，不懂的请忽略，胡乱修改严重可导致BIOS损坏
- 要恢复原始BIOS配置，直接更新官方BIOS就行了

<sub>提供有偿远程服务安装双系统单macOS指定版本重装Windows。我的QQ：3301394538</sub>

## 正常的
- 核显 加速
- 声卡 ALC256
- 网卡 AX201
- CPU变频
- 睡眠
- 屏幕亮度 最高亮度和Win一样并且开机后无需睡眠就是正常的
- USB 已定制USB驱动两个type-C和USB口均正常 (支持26)
- 3.5mm 耳机接口
- type-C 耳机接口
- 蓝牙 连接耳机，手机、键鼠<sup>13↓</sup>
- 3.5mm/type-C/蓝牙耳机麦克风
- 触控板
- 键盘
- `F1` `F2` `F3` `F9`快捷键
- 电池电量显示

## 不正常的
- HDMI DP
- 内置麦克风
- MX350：不支持

##

#### 推荐开机后执行操作
- 允许任何来源
```bash
sudo spctl --master-disable
```
- 开启有线网络下的Airdrop支持
```bash
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1
sudo killall sharingd
```

# 感谢
- [Acidanthera](https://github.com/acidanthera) 团队，以及其维护的 [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg)，和 [Lilu](https://github.com/acidanthera/Lilu)，[VirtualSMC](https://github.com/acidanthera/VirtualSMC)，[AppleALC](https://github.com/acidanthera/AppleALC)，[VoodooPS2](https://github.com/acidanthera/VoodooPS2)，[WhateverGreen](https://github.com/acidanthera/WhateverGreen)，[BlueToolFixup](https://github.com/acidanthera/BrcmPatchRAM) 等众多内核扩展
- [OpenIntelWireless](https://github.com/OpenIntelWireless) 团队，以及其维护的 [itlwm](https://github.com/OpenIntelWireless/itlwm)，[IntelBluetoothFirmware](https://github.com/OpenIntelWireless/IntelBluetoothFirmware)
- [VoodooI2C](https://github.com/VoodooI2C/VoodooI2C)
- [RehabMan](https://github.com/RehabMan) 的 [OS-X-USB-Inject-All](https://github.com/RehabMan/OS-X-USB-Inject-All)
- [daliansky](https://github.com/daliansky) 更新的 [OS-X-USB-Inject-All](https://github.com/daliansky/OS-X-USB-Inject-All) 和 [黑果小兵的部落阁](https://blog.daliansky.net/) 提供的教程和镜像下载
- [Xjn´s Blog](https://blog.xjn819.com)
- Apple 的 macOS
- 以及[我](https://github.com/XingKong746)


