function New-ResourceGroup {
    [cmdletbinding(SupportsShouldProcess)]

    param (
        [parameter(Mandatory)]
        [string]$RGName,

        [parameter(Mandatory)]
        [string]$Location
    )

    $params = @{
        'Name' = $RGName
        'Location' = $Location
    }
    if ($PSCmdlet.ShouldProcess('location')) {
    New-AzResourceGroup @params
    }
}

