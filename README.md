# repairCN

- **version** 0.1
- **Description**: Resolves Chinese character encoding issues in .xls files exported by the -outreg2- command.         
- **Mechanism**:   -outreg2- generates XML-based spreadsheets labeled as .xls. This command uses -filefilter- to silently locate and replace the internal string `encoding="US-ASCII"` with `encoding="UTF-8"`.
- **Syntax**:      repairCN "path/to/filename.xls"
- **Example**:     repairCN "filename.xls" or repairCN "path/to/filename.xls"
