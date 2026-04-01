<h1 align="center">
🛠️ repairCN
</h1>

<p align="center">
   | <b>版本：</b> 1.1.0 | <b>作者：</b> <a href="https://zihaowang.cn">王梓豪</a> | <b>语言：</b>
  <a href="https://github.com/ZihaoVistonWang/repairCN">English</a> |
</p>

![Example](example.png)

> [!NOTE]
> `repairCN` 是一款轻量级 **Stata** 命令，专门用于修复 `outreg2` 导出文件中的中文乱码问题。目前支持 `.xls` / `.xml` 和 `.rtf` 文件，直接在原文件基础上进行修复。

> [!CAUTION]
> 目前该工具仍处于**开发实验**阶段，若使用期间发现bug，欢迎及时发送邮件至[hi@zihaowang.cn](mailto:hi@zihaowang.cn)进行反馈！

## 安装

**国内用户**推荐从 Gitee 安装（速度更快）：
```stata
net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace
```

**海外用户**可从 GitHub 安装：
```stata
net install repairCN, from("https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/") replace
```

## 使用示例
在你的最后一行`outreg2`结果输出命令后，添加`repairCN`修复命令。

*当然你也可以单独用它来修复之前已经生成的文件。*

```stata
**# xls示例，rtf同理
// 你的回归1
outreg2 using "path/to/filename.xls", replace
...
// 你的回归n
outreg2 using "path/to/filename.xls", append
repairCN "path/to/filename.xls"  //最后一行进行修复
```

## 注意事项

- ⚠️ 此命令会直接修改原文件，建议提前备份重要数据
- 仅支持 `.xls`、`.xml` 和 `.rtf` 格式，其他格式会报错
- 文件路径错误或文件不存在时会报错

## 更多帮助

在 Stata 命令窗口输入 `help repairCN` 可查看详细帮助文档。
