# repairCN

- **version** 1.0.0
- **Description**: Resolves Chinese character encoding issues in .xls files exported by the -outreg2- command.
- **Mechanism**:   -outreg2- generates XML-based spreadsheets labeled as .xls. This command uses -filefilter- to silently locate and replace the internal string `encoding="US-ASCII"` with `encoding="UTF-8"`.
- **Syntax**:      repairCN "path/to/filename.xls"
- **Example**:     repairCN "filename.xls" or repairCN "path/to/filename.xls"

```stata
net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace
```
