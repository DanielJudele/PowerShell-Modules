function Get-SiteContext{
    param (
        [Parameter(Mandatory=$true)]
        [string]$SiteUrl,
        [Parameter(Mandatory=$false)]
        [string]$Username,
        [Parameter(Mandatory=$false)]
        [securestring]$Password
    )
     
    try{
        if($PSBoundParameters.ContainsKey("Username")){
            $credentials = new-object -typename System.Management.Automation.PSCredential -argumentlist $Username, $Password
            Connect-PnPOnline -Url $SiteUrl -Credentials $credentials
            return Get-PnPContext
        }
        Connect-PnPOnline -Url $SiteUrl -UseWebLogin
    }catch{        
        Connect-PnPOnline -Url $SiteUrl -UseWebLogin
    }

    return Get-PnPContext

    <#
    .SYNOPSIS
        Gets site script from an existing SharePoint list.
    .DESCRIPTION
        The Get-CSPOListSiteScript returns site script from an existing SharePoint list.
    .PARAMETER SiteUrl
        The SharePoint site Url.
    .PARAMETER Username
    The Username.
    .PARAMETER Password
    The Password.
    #>
}