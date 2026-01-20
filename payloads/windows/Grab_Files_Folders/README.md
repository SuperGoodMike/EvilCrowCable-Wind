# Security Audit Payload - Evil Crow Cable

This project contains payload scripts for the Evil Crow Cable to perform security audits. It can find specific files or folders (e.g., `flag.txt`, `passwords.xlsx`), zip them, and exfiltrate them via **HTTP POST** (Webhooks) or **Email** (SMTP).

### Configuration Tips

*   **Capture a Folder:** To capture a folder named "Secret", just add it to the list: `$t=@("flag.txt", "Secret")`. The script will zip the folder and all its contents.
*   **Target Specific Location:** To capture *everything* in `C:\Users\Target\Documents`, set the path `$p="C:\Users\Target"` and the target `$t="Documents"`.
*   **Wildcards:** You can use wildcards like `*password*` to match files like `password_list.txt` or folders like `old_passwords`.

## Troubleshooting

- **payload_http.txt**: HTTP-based payload (Recommended).
- **payload.txt**: Email-based payload (Legacy/Specific use).
- **http_logic.ps1**: Readable logic for the HTTP payload.
- **exfil_logic.ps1**: Readable logic for the Email payload.

## 1. Choose Your Exfiltration Method

### OPTION A: HTTP Exfiltration (Recommended)
**Use this if:** You can use an external webhook (like Webhook.site) or have a web listener.
**Payload File:** `payload_http.txt`

#### Step 1: Setup Listener
1.  Go to [webhook.site](https://webhook.site).
2.  Copy your **Unique URL** (e.g., `https://webhook.site/0000...`).
3.  Keep the tab open.

#### Step 2: Configure Payload
1.  Open `payload_http.txt`.
2.  Find: `https://webhook.site/YOUR_UNIQUE_ID`
3.  **Replace** `YOUR_UNIQUE_ID` with your actual ID from Step 1.
4.  (Optional) Edit `$p="C:\"` to change the search path.
5.  Save the file.

#### Step 3: Deploy & Run
1.  Upload `payload_http.txt` to the device.
2.  Run the payload (or set up AutoExec).
3.  Go to Webhook.site, click the new **POST**, and download `loot.zip` from the **Files** section.

---

### OPTION B: Email Exfiltration
**Use this if:** You have an internal SMTP relay (no auth required) or credentials.
**Payload File:** `payload.txt`

#### Step 1: Configure Payload
1.  Open `payload.txt`.
2.  Edit `YOUR_EMAIL@EXAMPLE.COM` to the recipient.
3.  Edit `smtp.example.com` to the SMTP server.
4.  (Optional) Edit `$p="C:\"` to change the search path.
5.  Save the file.

#### Step 2: Deploy & Run
1.  Upload `payload.txt` to the device.
2.  Run the payload.
3.  Check your email for the attachment.

---
