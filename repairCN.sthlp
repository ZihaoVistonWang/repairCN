{smcl}
{* *! version 1.1.0 01apr2026}{...}
{vieweralsosee "[R] outreg2" "help outreg2"}{...}
{vieweralsosee "[M-0] Mata" "help mata"}{...}
{viewerjumpto "Syntax" "repairCN##syntax"}{...}
{viewerjumpto "Description" "repairCN##description"}{...}
{viewerjumpto "Installation" "repairCN##installation"}{...}
{viewerjumpto "Examples" "repairCN##examples"}{...}
{viewerjumpto "Author" "repairCN##author"}{...}

{title:Introduction/介绍}

{p2colset 5 15 17 2}{...}
{p2col:{hi:repairCN} {hline 2}}Fix Chinese encoding issues in {cmd:.xls} and {cmd:.rtf} files exported by {cmd:outreg2}.{break}修复{cmd:outreg2}导出的{cmd:.xls}和{cmd:.rtf}文件中，中文乱码问题。{p_end} 
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax/语法}

{p 8 17 2}
{cmd:repairCN} {it:"filename.xls"}

{p 8 17 2}
{cmd:repairCN} {it:"filename.rtf"}

{pstd}
{hi:Note/注意:} The file path {it:must} be enclosed in double quotes if it contains spaces or special characters.{break}如果文件路径包含空格或特殊字符，{it:必须}用双引号括起来。

{marker description}{...}
{title:Description/功能说明}

{pstd}
{cmd:repairCN} resolves the "mojibake" (garbled text) issue for Chinese characters in files produced by the {cmd:outreg2} command.{break}
{cmd:repairCN} 解决 {cmd:outreg2} 命令导出文件中的中文"乱码"问题。

{pstd}
For {cmd:.xls} files (which are actually XML-based), it changes the internal encoding declaration from {cmd:US-ASCII} to {cmd:UTF-8}.{break}
对于 {cmd:.xls} 文件（实际为 XML 格式），将内部编码声明从 {cmd:US-ASCII} 更改为 {cmd:UTF-8}。

{pstd}
For {cmd:.rtf} files, it uses a native {help mata} engine to mathematically convert UTF-8 characters into the {cmd:\u#?} Unicode escape sequences required by Microsoft Word for proper display.{break}
对于 {cmd:.rtf} 文件，使用 {help mata} 引擎将 UTF-8 字符数学转换为 Microsoft Word 显示所需的 {cmd:\u#?} Unicode 转义序列。

{pstd}
{hi:Workflow/使用流程:}

{phang2}1. Export your results using {cmd:outreg2, excel} or {cmd:outreg2, rtf}.{p_end}
{p 12 16 2}使用 {cmd:outreg2, excel} 或 {cmd:outreg2, rtf} 导出结果。{p_end}
{phang2}2. Run {cmd:repairCN "your_file_name.xls/rtf"}.{p_end}
{p 12 16 2}运行 {cmd:repairCN "your_file_name.xls/rtf"}。{p_end}
{phang2}3. Open the file in Excel or Word; Chinese characters will now display correctly.{p_end}
{p 12 16 2}在 Excel 或 Word 中打开文件，中文字符将正确显示。{p_end}

{marker installation}{...}
{title:Installation/安装方法}

{pstd}
For users in China (Gitee Mirror)/国内用户（Gitee 镜像）:{break}
{stata `". net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace"' }

{pstd}
For global users (GitHub)/海外用户（GitHub）:{break}
{stata `". net install repairCN, from("https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/") replace"' }

{marker examples}{...}
{title:Examples/使用示例}

{phang}{cmd:. repairCN "filename.xls"}{p_end}
{phang}{cmd:. repairCN "path/to/filename.rtf"}{p_end}

{marker author}{...}
{title:Author/作者}

{pstd}
{hi:Zihao Viston Wang (王梓豪)}

{p2colset 5 24 26 2}{...}
{p2col :Affiliation/单位}Northwestern A&F University (NWAFU){p_end}
{p2col :}西北农林科技大学{p_end}

{p2col :Website/主页}{browse "https://zihaowang.cn":zihaowang.cn}{p_end}
{p2col :Email/邮箱}{browse "mailto:hi@zihaowang.cn":hi@zihaowang.cn}{p_end}

{p2col :Code/源码}{browse "https://github.com/ZihaoVistonWang/repairCN":GitHub Repository}{p_end}
{p2col :}{browse "https://gitee.com/ZihaoVistonWang/repairCN":Gitee Mirror (镜像仓库)}{p_end}
{p2colreset}{...}

{pstd}
If you find this tool helpful, please star the repository or cite it in your research.{break}
如果您觉得这个工具对您有帮助，请在 GitHub/Gitee 上点亮 Star 或在您的研究中引用。