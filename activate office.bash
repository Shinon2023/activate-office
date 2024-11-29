#!/bin/bash

# Navigate to the directory
cd "/c/Program Files/Microsoft Office/Office16"

# Run the command and capture the output
output=$(cmd.exe /c "script ossp.vbs /dstatus")

# Extract the line containing "SKU ID"
sku_id=$(echo "$output" | grep "SKU ID:")

# Display the SKU ID
echo "Extracted SKU ID:"
echo "$sku_id"

# Prevent the command prompt from closing
read -p "Press any key to exit..."
