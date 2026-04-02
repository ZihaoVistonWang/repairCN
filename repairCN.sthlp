{smcl}
{* *! version 1.1.0 01apr2026}{...}
{vieweralsosee "[R] outreg2" "help outreg2"}{...}
{vieweralsosee "[M-0] Mata" "help mata"}{...}
{viewerjumpto "Introduction" "repairCN##intro"}{...}
{viewerjumpto "Examples" "repairCN##examples"}{...}
{viewerjumpto "Remarks" "repairCN##remarks"}{...}
{viewerjumpto "Installation" "repairCN##installation"}{...}
{viewerjumpto "Author" "repairCN##author"}{...}

{marker intro}{...}
{title:Introduction/介绍}

{p2colset 5 15 17 2}{...}
{p2col:{hi:repairCN} {hline 2}}Fix Chinese encoding in {cmd:outreg2} exports (.xls/.rtf){break}修复 {cmd:outreg2} 导出文件的中文编码问题{p_end} 
{p2colreset}{...}

{marker examples}{...}
{title:Examples/使用示例}

{pstd}
Use after your last {cmd:outreg2} output. The following is an example of {cmd:xls}, and the same is true for {cmd:rtf}{break}
在最后一行 {cmd:outreg2} 输出后使用，下面为 {cmd:xls} 的示例，{cmd:rtf} 同理：

{phang}{cmd:. outreg2 using "filename.xls", replace}{p_end}
{phang}{cmd:. ...}{p_end}
{phang}{cmd:. outreg2 using "filename.xls", append}{p_end}
{phang}{cmd:. repairCN "filename.xls"}{p_end}

{pstd}
{hi:Note/注意:} The file path {it:must} be enclosed in double quotes if it contains spaces or special characters.{break}如果文件路径包含空格或特殊字符，{it:必须}用双引号括起来。


{marker remarks}{...}
{title:Remarks/注意事项}

{phang}
{hi:Warning:} This command modifies files in place. Backup important data first.{p_end}
{phang}
{hi:警告：} 此命令直接修改原文件，请先备份重要数据。{p_end}

{phang}
Only supports {cmd:.xls}, {cmd:.xml}, and {cmd:.rtf} formats.{p_end}
{phang}
仅支持 {cmd:.xls}、{cmd:.xml} 和 {cmd:.rtf} 格式。{p_end}

{marker installation}{...}
{title:Installation/安装}

{pstd}
Users in China (Gitee):{break}
国内用户（Gitee）:{break}
{stata `". net install repairCN, from("https://gitee.com/ZihaoVistonWang/repairCN/raw/main/") replace"' }

{pstd}
International users (GitHub):{break}
海外用户（GitHub）:{break}
{stata `". net install repairCN, from("https://raw.githubusercontent.com/ZihaoVistonWang/repairCN/main/") replace"' }

{marker author}{...}
{title:Author/作者}

{hline 65}

{p2colset 5 20 22 2}{...}
{p2col :{bf:Name/姓名}}{hi:Zihao Viston Wang}{p_end}
{p2col :}王梓豪{p_end}

{p2col :{bf:Affiliation/单位}}Northwestern A&F University (NWAFU){p_end}
{p2col :}西北农林科技大学{p_end}

{p2col :{bf:Website/主页}}{browse "https://zihaowang.cn":zihaowang.cn}{p_end}
{p2col :{bf:Email/邮箱}}{browse "mailto:hi@zihaowang.cn":hi@zihaowang.cn}{p_end}

{p2col :{bf:Repository/源码}}{browse "https://github.com/ZihaoVistonWang/repairCN":GitHub}{p_end}
{p2col :}{browse "https://gitee.com/ZihaoVistonWang/repairCN":Gitee (镜像)}{p_end}
{p2colreset}{...}

{hline 65}

{pstd}
If helpful, please star the repo or cite in your research.{break}
如有帮助，请在 GitHub/Gitee 点亮 Star 或在研究中引用。