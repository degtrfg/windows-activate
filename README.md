# Windows 数字许可激活工具

一键永久激活 Windows 10/11 系统，支持所有版本的数字许可激活。

## 🚀 快速使用

以管理员身份打开 PowerShell，复制运行以下命令：
irm https://mirror.ghproxy.com/https://raw.githubusercontent.com/degtrfg/windows-activate/main/activate.ps1|iex

## 📝 详细步骤

### 1. 准备工作
- 确保电脑已联网
- 暂时关闭杀毒软件
- 确保有管理员权限

### 2. 打开 PowerShell
- 方法1：右键开始菜单 -> Windows PowerShell (管理员)
- 方法2：Win + X -> Windows PowerShell (管理员)
- 方法3：搜索 PowerShell -> 右键以管理员身份运行

### 3. 执行激活
- 复制上述命令
- 在 PowerShell 中粘贴
- 按回车执行
- 等待激活完成

### 4. 验证激活
- 方法1：设置 -> 系统 -> 激活
- 方法2：运行 `slmgr /xpr`
- 方法3：运行 `slmgr /dlv`

## 💻 支持的系统版本

### Windows 11
- Windows 11 专业版
- Windows 11 企业版
- Windows 11 教育版
- Windows 11 家庭版
- 包括 21H2, 22H2, 23H2 等所有版本

### Windows 10
- Windows 10 专业版
- Windows 10 企业版
- Windows 10 教育版
- Windows 10 家庭版
- 包括 1903 到 23H2 的所有版本

### 特殊版本支持
- LTSC 2019/2021
- IoT Enterprise
- Server 2019/2022
- 多语言版本
- N 版本

## ✨ 主要特点

### 永久激活
- 数字许可证激活
- 重装系统自动激活
- 支持系统升级
- 无需产品密钥

### 安全可靠
- 不修改系统文件
- 不安装后台程序
- 使用官方激活通道
- 支持系统更新

### 简单易用
- 一键激活
- 全自动操作
- 无需人工干预
- 即时生效

### 完全免费
- 无需付费
- 无广告
- 开源代码
- 社区支持

## 🔧 备用激活方案

### 方案1：使用 fastgit 加速
irm raw.fastgit.org/degtrfg/windows-activate/main/activate.ps1|iex

### 方案2：使用 ghproxy 加速
irm https://mirror.ghproxy.com/https://raw.githubusercontent.com/degtrfg/windows-activate/main/activate.ps1|iex

### 方案3：直接访问 GitHub
irm raw.githubusercontent.com/degtrfg/windows-activate/main/activate.ps1|iex


### 方案4：本地运行
1. 下载 activate.ps1
2. 打开 PowerShell (管理员)
3. 进入脚本目录
4. 执行 `.\activate.ps1`

## ❓ 常见问题

### 激活相关
1. **激活失败怎么办？**
   - 检查网络连接
   - 尝试备用命令
   - 关闭杀毒软件
   - 确保管理员权限

2. **激活后重装系统？**
   - 自动激活
   - 无需任何操作
   - 保持永久激活

3. **支持升级系统吗？**
   - 完全支持升级
   - 保持激活状态
   - 无需重新激活

### 安全相关
1. **脚本安全吗？**
   - 开源代码
   - 无后门程序
   - 使用官方通道
   - 社区验证

2. **杀毒软件报警？**
   - 属于误报
   - 可临时关闭
   - 完成后开启
   - 不影响系统

### 技术相关
1. **如何检查激活状态？**
powershell
slmgr /xpr # 查看激活到期时间
slmgr /dlv # 查看详细许可证信息
slmgr /dli # 查看许可证信息

2. **如何查看系统版本？**
powershell
winver # 图形界面显示
systeminfo # 命令行显示


## 🛠️ 工作原理

### HWID 激活流程
1. 收集硬件信息
2. 生成数字指纹
3. 向微软服务器验证
4. 获取数字许可证
5. 激活系统

### 数据安全
- 不收集个人信息
- 不上传隐私数据
- 只与微软服务器通信
- 符合隐私政策

## ⚠️ 注意事项

### 运行环境
- Windows 10/11 系统
- 管理员权限
- 网络连接
- PowerShell 5.1+

### 使用建议
- 备份重要数据
- 关闭杀毒软件
- 保持网络稳定
- 等待激活完成

## 📞 技术支持

### 问题反馈
- 提交 Issues
- 详细描述问题
- 提供错误信息
- 说明系统环境

### 解决方案
- 查看常见问题
- 尝试备用命令
- 按步骤排查
- 社区互助

## 📜 免责声明

本工具：
- 仅供学习研究
- 使用者自担风险
- 遵守相关法规
- 尊重知识产权

## 📅 更新日志

### v1.0.0 (2024-03-xx)
- 初始版本发布
- 支持全系统版本
- 多种激活方式
- 完善使用文档
- 优化激活流程
- 添加故障排除
