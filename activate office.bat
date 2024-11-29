@echo off
:: Navigate to the directory
cd "C:\Program Files\Microsoft Office\Office16"

:: Run the command and capture the output
for /f "tokens=* delims=" %%A in ('script ossp.vbs /dstatus') do (
    set "output=%%A"
)

:: Extract the line containing "SKU ID"
echo %output% | findstr "SKU ID:" > temp.txt

:: Read the extracted SKU ID from the temp file
set /p sku_id=<temp.txt

:: Display the SKU ID
echo Extracted SKU ID:
echo %sku_id%

:: Cleanup temporary file
del temp.txt

:: Prevent the command prompt from closing
pause
