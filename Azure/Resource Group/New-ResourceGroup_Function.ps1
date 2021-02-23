function New-ResourceGroup {
    [cmdletbinding()]

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

    New-AzResourceGroup @params
}

