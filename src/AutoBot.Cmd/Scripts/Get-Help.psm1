﻿function Get-Help {
<#
.SYNOPSIS
    Details all available AutoBot commands.
.DESCRIPTION
    Returns a list of names of all *.psm1 PowerShell Modules in the AutoBot\Scripts folder and optionally gives
	detailed help on a given script
.NOTES
    Name: Get-Help
    Author: Lloyd Holman
    DateCreated: 2011/11/09
.EXAMPLE
    Get-Help
Description
------------
Returns a list of names of all *.psm1 PowerShell Modules in the AutoBot\Scripts folder
.EXAMPLE
    Get-Help Set-Profile
Description
------------
Returns PowerShell native get-help detail for the Set-Profile AutoBot script module

#>
[cmdletbinding()]
    Param(
        [Parameter(
            Mandatory = $False )]
            [string]$modulename
        )
Begin {
		
    }
Process {
			
			Try 
			{
				If ($modulename -ne "")
				{
					#Write-Output "$modulename provided"
					If ($modulename -ne "Get-Help")
					{
						Microsoft.PowerShell.Core\Import-Module ".\Scripts\$modulename.psm1"
						$result = Microsoft.PowerShell.Core\Get-Help $moduleName
					}
					
				}
				else	
				{
					$result = "Word!  I have the following scripts installed and ready to run.`r`n `r`n"	
					$result += Get-ChildItem -recurse -exclude get-help.psm1 `
					| Where {$_.extension -eq ".psm1"} `
					|% {(Split-Path $_.name -leaf).ToString().TrimStart().Replace(".psm1", "`r`n")}
					$result += "`r`nFor information about running an installed script use get-help <scriptname> `r`ne.g. `"@AutoBot get-help set-profile.`" `r`nFind more scripts at https://github.com/lholman/AutoBot-Scripts/tree/master/src/Scripts" 
				}
			}
			Catch [Exception] {
				Write-Host $_.Exception.ToString()
			}
    }
End {
		return $result | Out-String
    }
}

