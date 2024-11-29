@echo off

:: Navigate to the directory
cd "C:\Program Files\Microsoft Office\Office16"

:: Run the command and capture output into a temporary file
cscript ossp.vbs /dstatus > output.txt

:: Wait for 10 seconds
timeout /t 10 /nobreak > nul

:: Extract the line containing "SKU ID" and save it to a variable
for /f "tokens=* delims=" %%A in ('findstr "SKU ID:" output.txt') do (
    set "sku_id=%%A"
)

:: Display the extracted SKU ID
echo Extracted SKU ID:
echo %sku_id%

:: Cleanup temporary file
del output.txt

:: Prevent the command prompt from closing
pause
