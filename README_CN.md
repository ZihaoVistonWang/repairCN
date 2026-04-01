<h1 align="center">
🛠️ repairCN
</h1>

<p align="center">
   | <b>版本：</b> 1.1.0 | <b>作者：</b> <a href="https://zihaowang.cn">Zihao Viston Wang</a> | <b>语言：</b>
  <a href="https://github.com/ZihaoVistonWang/repairCN">English</a> |
</p>

> repairCN 是一款轻量级 **Stata** 命令，专门用于修复 `outreg2` 导出文件中的中文乱码问题。目前支持 `.xls` / `.xml`（XML 格式）和 `.rtf` 文件，直接在原文件基础上进行修复。

## 功能特点

- **针对 `.xls` 和 `.xml` 文件**：通过 `filefilter` 命令将 XML 头部的编码声明从 `encoding="US-ASCII"` 改为 `encoding="UTF-8"`
- **针对 `.rtf` 文件**：使用 Mata 将 UTF-8 编码的中文转换为 Microsoft Word RTF 格式的 `\u#?` 转义序列
- 转换完成后将直接覆盖原文件

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

```stata
repairCN "filename.xls"
repairCN "path/to/filename.xls"
repairCN "filename.rtf"
repairCN "path/to/filename.rtf"
```

## 使用流程

1. 使用 `outreg2` 导出回归结果
2. 对输出文件执行 `repairCN` 修复
3. 用 Excel、WPS 或 Word 打开文件，确认中文显示正常

## 注意事项

- ⚠️ 此命令会直接修改原文件，建议提前备份重要数据
- 仅支持 `.xls`、`.xml` 和 `.rtf` 格式，其他格式会报错
- 文件路径错误或文件不存在时会报错

## 更多帮助

在 Stata 命令窗口输入 `help repairCN` 可查看详细帮助文档。