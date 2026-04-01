<h1 align="center">
🛠️ repairCN
</h1>

<p align="center">
   | <b>Version:</b> 1.1.0 | <b>Author:</b> <a href="https://zihaowang.cn">Zihao Viston Wang</a> | <b>Language:</b>
  <a href="https://gitee.com/ZihaoVistonWang/repairCN">中文版</a> |
</p>

![Example](example.png)

> [!NOTE]
> `repairCN` is a lightweight **Stata** command designed to fix Chinese character encoding issues in files exported by `outreg2`. It currently supports `.xls` / `.xml` (XML format) and `.rtf` files, and performs fixes directly on the original file.

> [!CAUTION]
> This tool is currently in an **experimental development** stage. If you encounter any bugs while using it, feel free to send feedback to [hi@zihaowang.cn](mailto:hi@zihaowang.cn)!

## Installation

**All users** can install from GitHub:
```stata
net install repairCN, from("https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/") replace
```

**Chinese users** are recommended to install from Gitee (faster):
```stata
net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace
```

## Usage Example

After your last `outreg2` output command, add the `repairCN` fix command. 

*Of course, you can also use it independently to repair files that were previously generated*.

```stata
**# xls example, rtf works the same way
// Your regression 1
outreg2 using "path/to/filename.xls", replace
...
// Your regression n
outreg2 using "path/to/filename.xls", append
repairCN "path/to/filename.xls"  // Fix on the last line
```

## Notes

- ⚠️ This command modifies the original file directly. It's recommended to backup important data beforehand
- Only supports `.xls`, `.xml`, and `.rtf` formats. Other formats will result in an error
- An error will occur if the file path is incorrect or the file doesn't exist

## More Help

Type `help repairCN` in the Stata command window to view detailed documentation.
