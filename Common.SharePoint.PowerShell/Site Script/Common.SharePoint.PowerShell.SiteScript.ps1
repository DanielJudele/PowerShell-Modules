function Get-CSPOListSiteScript{
    param (
        [Parameter(Mandatory=$true)]
        [string]$ListUrl
    )

    return Get-SPOSiteScriptFromList -ListUrl $ListUrl

    <#
    .SYNOPSIS
        Gets site script from an existing SharePoint list.
    .DESCRIPTION
        The Get-CSPOListSiteScript returns site script from an existing SharePoint list.
    .PARAMETER ListUrl
        The SharePoint list Url.
    #>
}

function Get-CSPOSiteScriptAllProperties{
    param (
        [Parameter(Mandatory=$true)]
        [string]$Title
    )
    $siteScript = Get-CSPOSiteScriptByTitle -Title $Title

    if(!$siteScript){
        "Throw `"$Title`" site script could not be found."
    }

    return (Get-SPOSiteScript $siteScript.Id)

    <#
    .SYNOPSIS
        Gets all details of the site script by title.
    .DESCRIPTION
        The Get-CSPOSiteScriptAllProperties returns all the properties of the site script. The title of the script is used to retrieve the site script from tenant.
    .PARAMETER Title
        The title of the site script.
    #>
}

function Get-CSPOSiteScriptByTitle{
    param (
        [Parameter(Mandatory=$true)]
        [string]$Title
    )
    
    return (Get-SPOSiteScript | Where-Object {$_.Title -eq $Title})

    <#
    .SYNOPSIS
        Gets the site script by title.
    .DESCRIPTION
        The Get-SiteScriptByTitle is trying to find the site script using the title.
    .PARAMETER Title
        The title of the site script.
    #>
}

function Get-CSPOSiteScriptId {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Title
    )

    return Get-SPOSiteScript | Where-Object {$_.Title -eq $Title} | Select-Object -First 1 Id

     <#
    .SYNOPSIS
        Gets the site script Id by title.
    .DESCRIPTION
        The Get-CSPOSiteScriptId is trying to find the site script using the title and returns the Id. If there are more site scripts with the same title, returns the Id of the first site script.
    .PARAMETER Title
        The title of the site script.
    #>
}

function Set-CSPOSiteScriptContent {
	param (
        [Parameter(Mandatory=$true)]
        [string]$Title,
        [Parameter(Mandatory=$true)]
        [string]$Path
    )
    
    $content = Get-Content $Path -Raw

    $siteScript = Get-SPOSiteScript | Where-Object {$_.Title -eq $Title}
       
    if($siteScript){        
        Set-SPOSiteScript -Identity $siteScript.Id -Content $content | Out-Null
    }else{
        Add-SPOSiteScript -Title $Title -Content $content
    }

    <#
    .SYNOPSIS
        Updates the content of the site script found by title. If the site script doesn't exists, creates a new site script with the title and content specified as parameter.
    .DESCRIPTION
        The Get-CSPOSiteScriptContent updates the content of the site script found by title. If the site script doesn't exists, creates a new site script with the title and content specified as parameter.
    .PARAMETER Title
        The title of the site script.
    .PARAMETER Path
        The file path which contains the content of the site script.
    #>
}