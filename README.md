# ICOM Powershell Serialport Command Sender

Was built for ICOM radio but can be used for anything that accepts Hex Codes/Binary over Serial Port :pray:

Example of the script sending numbers over a serialport :tada:

![icom-cmd-example-script-env](https://user-images.githubusercontent.com/9837366/63654012-3a339380-c73a-11e9-8609-708ab608ad13.png)

## Known compatible targets

-   ICOM IC-7610
-   Anything over Serial Port (Arduino/etc...)

## Usage

#### Clicking 'Run with Powershell' in the File Explorer

You will get a prompt for the mandatory arguments.

Once filled in, the script will run.

Since the shell dissapears running it this way, don't expect to catch the response from the serial device!

![](https://user-images.githubusercontent.com/9837366/56464532-9152e180-63b1-11e9-91b7-8225660cf853.png)

#### Default ReadLine with just two arguments:

```powershell
.\icmd.ps1 COM4 'FE FE 94 E0 26 00 05 00 01 FD'
Waiting for device to respond...
---
FEFEFD
---
Port Closed
```

#### Force a timeout instead of reading response:

```powershell
.\icmd.ps1 COM4 'FE FE 94 E0 26 00 05 00 01 FD' -timeout 1000
Forcing a timeout!
Port Closed
```

_OR_

```powershell
.\icmd.ps1  -timeout 1000 COM4 'FE FE 94 E0 26 00 05 00 01 FD'
Forcing a timeout!
Port Closed
```

#### Chaining calls

You can write a powershell script that just calls this one!

The `icmdchain.ps1` has the template :smile:

```powershell
# no response
.\icmd.ps1  -timeout 1000 COM4 'FE FE 94 E0 26 00 05 00 01 FD'
# read response
.\icmd.ps1 COM4 'FE FE 94 E0 26 00 05 00 01 FD'
# no response
.\icmd.ps1  -timeout 1000 COM4 'FE FE 94 E0 26 00 05 00 01 FD'
# read response
.\icmd.ps1 COM4 'FE FE 94 E0 26 00 05 00 01 FD'
```

## Development

1. [RealTerm](https://sourceforge.net/projects/realterm/)
1. [com0com](https://sourceforge.net/projects/com0com/)

Please read the `CODE_OF_CONDUCT.md` file :pray:

I use [VSCode](https://code.visualstudio.com/) with two extensions for this project:

1. [Powershell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
1. [Editorconfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)

Please fork the project and make a Pull Request (PR) to contribute!

## Reading Materials

1. [HEX to BIN table](http://vlsm-calc.net/decbinhex.php)
1. [CI-V Reference Manual](http://www.icomamerica.com/en/support/kb/article.aspx?ArticleNumber=63AE624429)
1. [ICOM IC-7610 Reference Manual](http://www.icomamerica.com/en/downloads/default.aspx?Category=661)
1. [Old CT-17 Reference Manual with BASIC code blocks](http://www.icom.co.jp/world/support/download/manual/pdf/CT-17.pdf)
1. [Decimal Array to Binary `$port.Write/3`](https://social.technet.microsoft.com/Forums/office/en-US/c0cad62d-5e6d-47de-97a6-406f50025d7f/sendingreading-hex-data-to-a-serial-port-in-powershell?forum=winserverpowershell)
1. [System.IO.Ports.SerialPort.Write .NET API](https://msdn.microsoft.com/en-us/library/System.IO.Ports.SerialPort.Write.aspx)

**CI-V Manual Message Format Snippet**

![basic-message-format-icom](https://user-images.githubusercontent.com/9837366/43176722-9fef0936-8f8a-11e8-8ab1-22e65ffe0977.PNG)
