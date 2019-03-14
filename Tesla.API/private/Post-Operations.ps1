function Set-NoParams
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID,
        [Parameter( Mandatory=$true )]
        [CarOp]$EndPoint
    )

    $post_url = "$( $TeslaX.vehiclesURL )/$( $VehicleID )/command/$( $Endpoint )"

    try
    {
        # Does the car have to be awake?
        $operation = Invoke-WebRequest `
            -Uri $post_url `
            -Headers $TeslaX.authHeader `
            -Method Post `
            -ErrorAction Stop
    }
    catch
    {
        Write-Error $_.Exception.Message
        return $null
    }

    if( $operation.StatusCode -eq 200 )
    {
        return $true
    }
    return $false
}