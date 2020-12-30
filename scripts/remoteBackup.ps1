<#
.Synopsis
    Backup script utilising wbadmin to remotely backup Windows 10 systems.
.DESCRIPTION AND NOTES
    "Enable-PSRemoting -Force" needs to be run on the PC's to be backed up before this script can be run.
#>

#Script Name: RemoteBackup
#Creator: Matt Jones
#Date: 30/12/2020
#Updated: N/A
#References, if any: N/A

#Variables
$Credential = Get-Credential
$Computers = "PC155", "PC1000"

Write-Output "Starting remote connections to " $Computers

foreach ($Computer in $Computers) {
    Invoke-Command -ComputerName $Computer -Credential $Credential -ScriptBlock {
        wbadmin.exe start backup -backupTarget\\pc188\ -include:C: -allCritical -quiet -user:$Credential.UserName -password:$Credential.Password
    }
}
