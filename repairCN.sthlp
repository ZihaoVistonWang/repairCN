{smcl}
{* *! version 1.1.0 01apr2026}{...}

{title:Title}

{p2colset 5 20 22 2}{...}
{p2col:{hi:repairCN} {hline 2}}Fix encoding issues in {.xls} and {.rtf} files exported by {cmd:outreg2}{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 12 2}
{cmd:repairCN} {it:"path/to/filename.xls"} 

{p 8 12 2}
{cmd:repairCN} {it:"path/to/filename.rtf"}

{pstd}
The file path must be enclosed in double quotes.

{marker description}{...}
{title:Description}

{pstd}
{cmd:repairCN} addresses Chinese text garbling in spreadsheet files produced by
{cmd:outreg2}. For {.xls} files, it updates the internal XML header from
{cmd:encoding="US-ASCII"} to {cmd:encoding="UTF-8"}. For {.rtf} files, it
rewrites UTF-8 text into the {cmd:\u#?} escape form used by Microsoft Word.

{pstd}
For {.xls} files, the command uses {help filefilter}; for {.rtf} files, it uses
Mata to decode the text and write the converted file back in place.

{pstd}
Typical workflow:

{phang2}1. Run {cmd:outreg2} to export results to an {.xls} file.
{phang2}2. Run {cmd:repairCN} on that file.
{phang2}3. Open the file in Excel/WPS; Chinese characters should display correctly.

{pstd}
For RTF output, use the same command after {cmd:outreg2} writes the {.rtf} file.

{marker installation}{...}
{title:Installation}

{pstd}
For users in China (faster download):
{phang2}{cmd:. net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace}

{pstd}
For global users:
{phang2}{cmd:. net install repairCN, from("https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/") replace}

{marker examples}{...}
{title:Examples}

{phang}{cmd:. repairCN "result.xls"}
{phang}{cmd:. repairCN "doc/final/result.xls"}
{phang}{cmd:. repairCN "result.rtf"}
{phang}{cmd:. repairCN "doc/final/result.rtf"}

{marker results}{...}
{title:Stored results}

{pstd}
{cmd:repairCN} does not return results in {cmd:r()}, {cmd:e()}, or {cmd:s()}.

{title:Exit codes}

{phang}{cmd:198} if file path is missing.
{phang}{cmd:601} if file is not found.
{phang}{cmd:198} if the file extension is not {.xls}, {.xml}, or {.rtf}.

{marker author}{...}
{title:Author}

{pstd}
Zihao Viston Wang{break}
Personal website: {browse "https://zihaowang.cn":zihaowang.cn}{break}
Email: {browse "mailto:hi@zihaowang.cn":hi@zihaowang.cn}

{pstd}
{browse "https://github.com/ZihaoVistonWang/repairCN":GitHub Repository}{break}
{browse "https://gitee.com/ZihaoVistonWang/repairCN":Gitee Repository (镜像)}

{pstd}
repairCN package.
