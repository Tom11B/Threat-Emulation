function New-Eicar {

    [CmdletBinding()] Param(
        [ValidateScript({Test-Path $_ -PathType 'Container'})] 
        [string] 
        $Path = "$env:USERPROFILE\Desktop"
        )            
            [string] $FilePath = (Join-Path $Path eicar.com)
            #Base64 of Eicar string
            [string] $EncodedEicar = 'WDVPIVAlQEFQWzRcUFpYNTQoUF4pN0NDKTd9JEVJQ0FSLVNUQU5EQVJELUFOVElWSVJVUy1URVNULUZJTEUhJEgrSCo='

            If (!(Test-Path -Path $FilePath)) {

                Try {
                    [byte[]] $EicarBytes = [System.Convert]::FromBase64String($EncodedEicar)
                    [string] $Eicar = [System.Text.Encoding]::UTF8.GetString($EicarBytes)
                    Set-Content -Value $Eicar -Encoding ascii -Path $FilePath -Force 
                }

                Catch {
                    Write-Warning "Eicar.com file couldn't be created. Either permissions or AV prevented file creation."
                }
            }
            
            Else {
                Write-Warning "Eicar.com already exists!"
            }

}
New-Eicar