*! version 1.0.0
*! Title: repairCN
*! Description: Resolves Chinese character encoding issues in .xls files 
*!              exported by the -outreg2- command.
*! Mechanism:   -outreg2- generates XML-based spreadsheets labeled as .xls. 
*!              This command uses -filefilter- to silently locate and replace 
*!              the internal string `encoding="US-ASCII"` with `encoding="UTF-8"`.
*! Syntax:      repairCN "path/to/filename.xls"
*! Example:     repairCN "filename.xls" or repairCN "path/to/filename.xls"
capture program drop repairCN
program define repairCN
    // Accept the first argument as the file path
    args file_path
    
    // 1. Check if the user provided a file path
    if `"`file_path'"' == "" {
        display as error "Error: Missing file path."
        display as error `"Example usage: repairCN "doc/final/result.xls""'
        exit 198
    }

    // 2. Verify that the specified file exists in the current working directory or absolute path
    capture confirm file `"`file_path'"'
    if _rc {
        display as error `"Error: File `file_path' not found. Please check the path or filename."'
        exit 601
    }

    // 3. Define the target strings for replacement (using compound double quotes)
    local search_str `"encoding="US-ASCII""'
    local replace_str `"encoding="UTF-8""'

    // 4. Generate a temporary file managed by Stata (automatically deleted upon script completion)
    tempfile temp
    
    // 5. Execute the string replacement and save the output to the temporary file
    quietly filefilter `"`file_path'"' `"`temp'"', from(`"`search_str'"') to(`"`replace_str'"') replace
    
    // 6. Overwrite the original file with the modified temporary file
    quietly copy `"`temp'"' `"`file_path'"', replace
    
    // Output success message
    display as result `"Fix applied: Successfully converted `file_path' to UTF-8 encoding!"'
end