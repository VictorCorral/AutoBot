﻿function Get-Help {
<#
.SYNOPSIS
    Retrieves information about a website.
.DESCRIPTION
    Retrieves information about a website.
.PARAMETER Url
    URL of the website to test access to.
.PARAMETER UseDefaultCredentials
    Use the currently authenticated user's credentials
.PARAMETER Proxy
    Used to connect via a proxy
.PARAMETER TimeOut
    Timeout to connect to site, in milliseconds
.PARAMETER Credential
    Provide alternate credentials
.NOTES
    Name: Get-Help
    Author: Lloyd Holman
    DateCreated: 2011/11/09
.EXAMPLE
    Get-Help
Description
------------
Returns a list of names of all *.psm1 PowerShell Modules in the AutoBot\Scripts folder

#>

Begin {
    #Set TimeStamp prior to attempting connection
    $then = get-date
    }
Process {
    Try {
        #Make connection to gather response from site
        $dir = Get-ChildItem "C:\Development\AutoBot\trunk\build\Scripts" -recurse
		$fileList = $dir | Where {$_.extension -eq ".psm1"}
		$fileList | Format-Table name | Out-String
        }
    Catch {
        }
    }
End {
    #Display Report
    #New-Object PSObject -property $fileList
    }
}
