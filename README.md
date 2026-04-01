<h1 align="center">
🛠️ repairCN
</h1>

<p align="center">
   | <b>Version:</b> 1.1.0 | <b>Author:</b> <a href="https://zihaowang.cn">Zihao Viston Wang</a> | <b>翻译:</b>
  <a href="https://gitee.com/ZihaoVistonWang/repairCN">中文版本</a> |
</p>

> repairCN is a small **Stata** utility for fixing Chinese text garbling in files exported by `outreg2`. It currently supports XML-based `.xls` / `.xml` files and `.rtf` files, and rewrites them in place.

## What it does

- For `.xls` and `.xml` files, repairCN uses `filefilter` to replace `encoding="US-ASCII"` with `encoding="UTF-8"` in the internal XML header.
- For `.rtf` files, repairCN uses Mata to convert UTF-8 text into Microsoft Word RTF `\u#?` escapes.
- The command overwrites the original file after conversion.

## Installation

- For Chinese users, you can install repairCN from Gitee:
    ```stata
    net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace
    ```
- For Global users, you can install repairCN from Github:
    ```stata
    net install repairCN, from("https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/") replace
    ```

## Examples

```stata
repairCN "filename.xls"
repairCN "path/to/filename.xls"
repairCN "filename.rtf"
repairCN "path/to/filename.rtf"
```

## Typical workflow

1. Run `outreg2` and export results to a file.
2. Run `repairCN` on that output file.
3. Open the file in Excel, WPS, or Word and verify that Chinese characters display correctly.

## Notes

- The command modifies the original file in place.
- If the file extension is not `.xls`, `.xml`, or `.rtf`, the command exits with an error.
- If the file path is missing or the file cannot be found, the command also exits with an error.

## Help file

Type `help repairCN` for the Stata help page.
