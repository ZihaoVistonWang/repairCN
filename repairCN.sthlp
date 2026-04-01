{smcl}
{* *! version 1.1.0 01apr2026}{...}
{vieweralsosee "[R] outreg2" "help outreg2"}{...}
{vieweralsosee "[M-0] Mata" "help mata"}{...}
{viewerjumpto "Syntax" "repairCN##syntax"}{...}
{viewerjumpto "Description" "repairCN##description"}{...}
{viewerjumpto "Installation" "repairCN##installation"}{...}
{viewerjumpto "Examples" "repairCN##examples"}{...}
{viewerjumpto "Author" "repairCN##author"}{...}

{title:Title}

{p2colset 5 15 17 2}{...}
{p2col:{hi:repairCN} {hline 2}}Fix Chinese encoding issues in {cmd:.xls} and {cmd:.rtf} files exported by {cmd:outreg2}{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmd:repairCN} {it:"filename.xls"}

{p 8 17 2}
{cmd:repairCN} {it:"filename.rtf"}

{pstd}
{hi:Note:} The file path {it:must} be enclosed in double quotes if it contains spaces or special characters.

{marker description}{...}
{title:Description}

{pstd}
{cmd:repairCN} resolves the "mojibake" (garbled text) issue for Chinese characters in files produced by the {cmd:outreg2} command. 

{pstd}
For {cmd:.xls} files (which are actually XML-based), it changes the internal encoding declaration from {cmd:US-ASCII} to {cmd:UTF-8}.

{pstd}
For {cmd:.rtf} files, it uses a native {help mata} engine to mathematically convert UTF-8 characters into the {cmd:\u#?} Unicode escape sequences required by Microsoft Word for proper display.

{pstd}
{hi:Workflow:}

{phang2}1. Export your results using {cmd:outreg2, excel} or {cmd:outreg2, rtf}.{p_end}
{phang2}2. Run {cmd:repairCN "your_file_name.xls/rtf"}.{p_end}
{phang2}3. Open the file in Excel or Word; Chinese characters will now display correctly.{p_end}

{marker installation}{...}
{title:Installation}

{pstd}
For users in China (Gitee Mirror):{break}
{stata `". net install repairCN, from(\"https://gitee.com/ZihaoVistonWang/repairCN/raw/main/\") replace"' }

{pstd}
For global users (GitHub):{break}
{stata `". net install repairCN, from(\"https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/\") replace"' }

{marker examples}{...}
{title:Examples}

{phang}{cmd:. repairCN "result.xls"}{p_end}
{phang}{cmd:. repairCN "doc/final/robustness.rtf"}{p_end}

{marker author}{...}
{title:Author}

{pstd}
Zihao Viston Wang{break}
Website: {browse "https://zihaowang.cn"}{break}
Email: {browse "mailto:hi@zihaowang.cn":hi@zihaowang.cn}

{pstd}
{browse "https://github.com/ZihaoVistonWang/repairCN":GitHub Repository} | {browse "https://gitee.com/ZihaoVistonWang/repairCN":Gitee Mirror}