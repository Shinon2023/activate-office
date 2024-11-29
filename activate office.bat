@echo off

:: Navigate to the directory
cd "C:\Program Files\Microsoft Office\Office16"

:: Run the command and capture output into a temporary file
cscript ospp.vbs /dstatus > output.txt

:: Wait for 10 seconds
timeout /t 10 /nobreak > nul

:: Extract the line containing "SKU ID" and save it to a variable
for /f "tokens=* delims=" %%A in ('findstr "SKU ID:" output.txt') do (
    set "sku_id=%%A"
)

:: Clean the extracted SKU ID to remove unnecessary text
for /f "tokens=2 delims=:" %%B in ("%sku_id%") do (
    set "sku_id=%%B"
)
set "sku_id=%sku_id:~1%"

:: Display the extracted SKU ID
echo Extracted SKU ID:
echo %sku_id%

:: Run OSPPREAM.exe with the extracted SKU ID
echo Running OSPPREAM.exe with SKU ID...
OSPPREAM.exe %sku_id%

:: Cleanup temporary file
del output.txt

:: Prevent the terminal from closing
echo.
echo Task completed. Press any key to exit...
pause
