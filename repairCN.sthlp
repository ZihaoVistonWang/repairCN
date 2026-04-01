{smcl}
{* *! version 1.0.0 01apr2026}{...}

{title:Title}

{p2colset 5 20 22 2}{...}
{p2col:{hi:repairCN} {hline 2}}Fix encoding flag in XML-based .xls files exported by {cmd:outreg2}{p_end}
{p2colreset}{...}

{marker syntax}{...}
{title:Syntax}

{p 8 12 2}
{cmd:repairCN} {it:"path/to/filename.xls"}

{pstd}
The file path must be enclosed in double quotes.

{marker description}{...}
{title:Description}

{pstd}
{cmd:repairCN} addresses Chinese text garbling in spreadsheet files produced by
{cmd:outreg2}. Although these files use the {.xml} format internally, they are
often saved with an {.xls} extension and may contain
{cmd:encoding="US-ASCII"} in the XML header.

{pstd}
This command silently replaces that header string with
{cmd:encoding="UTF-8"} using {help filefilter}, then overwrites the original file.

{pstd}
Typical workflow:

{phang2}1. Run {cmd:outreg2} to export results to an {.xls} file.
{phang2}2. Run {cmd:repairCN} on that file.
{phang2}3. Open the file in Excel/WPS; Chinese characters should display correctly.

{marker examples}{...}
{title:Examples}

{phang}{cmd:. repairCN "result.xls"}
{phang}{cmd:. repairCN "doc/final/result.xls"}

{marker results}{...}
{title:Stored results}

{pstd}
{cmd:repairCN} does not return results in {cmd:r()}, {cmd:e()}, or {cmd:s()}.

{title:Exit codes}

{phang}{cmd:198} if file path is missing.
{phang}{cmd:601} if file is not found.

{marker author}{...}
{title:Author}

{pstd}
repairCN package.
