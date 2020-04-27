if (!(Get-Module -Name Microsoft.Online.SharePoint.PowerShell -ListAvailable)) {
    Install-Module -Name Microsoft.Online.SharePoint.PowerShell  -Confirm
}

if (!(Get-Module -Name SharePointPnPPowerShellOnline -ListAvailable)) {
    Install-Module -Name SharePointPnPPowerShellOnline  -Confirm
}

Import-Module Microsoft.Online.SharePoint.PowerShell
Import-Module SharePointPnPPowerShellOnline

."$PSScriptRoot\Site Script\*.ps1"
."$PSScriptRoot\Context\*.ps1"

Export-ModuleMember -Function *