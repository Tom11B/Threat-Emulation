<# 
	Powershell fileless execution test, This script creates a registry entry in the local users classes hive and executes it. 
	The payload for this script is harmless but the functionality mimics the obfuscation and execution of a real base 64 encoded payload.
	Written by: Thomas Peterson 03/2019 
#>
Clear-Host
try
{
  New-Item -Path "HKCU:\Software\classes\" -Name 'Testing' -Force -ErrorAction Stop | Out-Null
  New-ItemProperty -Path "HKCU:\Software\classes\Testing" -Name 'TEST' -PropertyType 'String' -Value "W1N5c3RlbS5SZWZsZWN0aW9uLkFzc2VtYmx5XTo6TG9hZFdpdGhQYXJ0aWFsTmFtZSgnU3lzdGVtLldpbmRvd3MuRm9ybXMnKSB8IE91dC1OdWxsIDtbU3lzdGVtLldpbmRvd3MuRm9ybXMuTWVzc2FnZUJveF06OlNob3coJ0V4ZWN1dGlvbiBUZXN0IFN1Y2Vzc2Z1bCEnLCdFeHBsb2l0Jyk=" -Force -ErrorAction Stop | Out-Null
}
catch 
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null ;[System.Windows.Forms.MessageBox]::Show("Unable to write to the registry, exploit failed.","Registry") | Out-Null
	Break
}

try
{
	Invoke-Expression ([Text.Encoding]::ASCII.GetString([Convert]::FromBase64String((Get-ItemProperty 'HKCU:\Software\Classes\Testing').TEST))) -ErrorAction Stop | Out-Null 
	Remove-Item -Path "HKCU:\Software\classes\Testing" -Recurse -Force -ErrorAction SilentlyContinue | Out-Null
}
catch
{
	[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") | Out-Null ;[System.Windows.Forms.MessageBox]::Show("Unable to execute test script, exploit failed.","Registry") | Out-Null
	Break
}
