<#
.Synopsis
    Short description
.DESCRIPTION
    Long description
.EXAMPLE
    Example of how to use this cmdlet
.EXAMPLE
    Another example of how to use this cmdlet
#>

#Script Name
#Creator
#Date
#Updated
#References, if any

#Variables
$Credential = Get-Credential

#Parameters
[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    [string[]]
    $ComputerNames
)
#Enter Tasks Below as Remarks

#WBAdmin backup script for running on remote PCs and replacing the previous backup taken on the date seven days previous.

#test Write-Output $ComputerNames

foreach ($ComputerNames in $ComputerNames) {
    Invoke-Command -ScriptBlock {
        wbadmin.exe start backup -backupTarget\\pc188\ -include:C: -allCritical -quiet #Create a variable for the backup location to alter it for each computer name
    }
}