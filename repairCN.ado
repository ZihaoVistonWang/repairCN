*! version 1.1.0  01apr2026
*! Title: repairCN
*! Description: Resolves Chinese character encoding issues (mojibake) 
*!              in both .xls and .rtf files exported by the -outreg2- command.
*! Mechanism:   For .xls, uses native -filefilter-.
*!              For .rtf, extracts raw UTF-8 bytes via Mata and mathematically 
*!              computes Unicode code points for MS Word RTF escapes (\uXXXX?).
*! Syntax:      repairCN "path/to/filename.xls"
*!              repairCN "path/to/filename.rtf"

capture program drop repairCN
program define repairCN
    version 14.0
    args file_path
    
    // 1. Check if the user provided a file path
    if `"`file_path'"' == "" {
        display as error "Error: Missing file path."
        display as error `"Example usage: repairCN "doc/final/result.rtf""'
        exit 198
    }

    // 2. Verify that the specified file exists
    capture confirm file `"`file_path'"'
    if _rc {
        display as error `"Error: File `file_path' not found."'
        exit 601
    }

    // 3. Extract the file extension
    local ext = substr(`"`file_path'"', strrpos(`"`file_path'"', "."), .)
    tempfile temp
    
    // ==========================================
    // Logic for .xls (XML based)
    // ==========================================
    if `"`ext'"' == ".xls" | `"`ext'"' == ".xml" {
        local search_str `"encoding="US-ASCII""'
        local replace_str `"encoding="UTF-8""'
        
        quietly filefilter `"`file_path'"' `"`temp'"', from(`"`search_str'"') to(`"`replace_str'"') replace
        quietly copy `"`temp'"' `"`file_path'"', replace
        
        display as result `"Fix applied: Converted XLS to UTF-8 encoding for `file_path'!"'
    }
    // ==========================================
    // Logic for .rtf (Rich Text Format)
    // ==========================================
    else if `"`ext'"' == ".rtf" {
        mata: fix_rtf_mata(`"`file_path'"', `"`temp'"')
        quietly copy `"`temp'"' `"`file_path'"', replace
        
        display as result `"Fix applied: Converted RTF to UTF-8 encoding for `file_path'!"'
    }
    // ==========================================
    // Unsupported formats
    // ==========================================
    else {
        display as error `"Error: Unsupported file type (`ext'). Please provide an .xls or .rtf file."'
        exit 198
    }
end

// =========================================================================
// Native Mata Engine for RTF processing 
// Manually decodes UTF-8 byte sequences into Unicode code points.
// =========================================================================
capture mata: mata drop fix_rtf_mata()
mata:
void fix_rtf_mata(string scalar in_file, string scalar out_file)
{
    real scalar fh_in, fh_out, i, len, blen, cp, rtf_cp
    string scalar line, new_line, char
    real rowvector bytes
    
    fh_in = fopen(in_file, "r")
    fh_out = fopen(out_file, "w")
    
    while ((line = fget(fh_in)) != J(0,0,"")) {
        // Fast skip: pure ASCII line
        if (strlen(line) == ustrlen(line)) {
            fput(fh_out, line)
            continue
        }
        
        new_line = ""
        len = ustrlen(line)
        
        for (i=1; i<=len; i++) {
            char = usubstr(line, i, 1)
            blen = strlen(char)
            
            if (blen == 1) {
                new_line = new_line + char
            }
            else {
                bytes = ascii(char)
                
                // Calculate Unicode code point
                if (blen == 2) {
                    cp = (bytes[1]-192)*64 + (bytes[2]-128)
                }
                else if (blen == 3) {
                    cp = (bytes[1]-224)*4096 + (bytes[2]-128)*64 + (bytes[3]-128)
                }
                else if (blen == 4) {
                    cp = (bytes[1]-240)*262144 + (bytes[2]-128)*4096 + (bytes[3]-128)*64 + (bytes[4]-128)
                }
                else {
                    cp = 63 
                }
                
                // Convert to signed 16-bit for MS Word RTF protocol
                if (cp > 32767) {
                    rtf_cp = cp - 65536
                }
                else {
                    rtf_cp = cp
                }
                
                new_line = new_line + "\u" + strofreal(rtf_cp) + "?"
            }
        }
        fput(fh_out, new_line)
    }
    
    fclose(fh_in)
    fclose(fh_out)
}
end