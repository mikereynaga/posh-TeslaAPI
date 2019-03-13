function Switch-TeslaState
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    $wake_url = "$( $TeslaX.baseURL )/api/1/vehicles/$( $VehicleID )/wake_up"

    try
    {
        ( ( Invoke-WebRequest `
            -Uri $wake_url `
            -Headers $TeslaX.authHeader `
            -Method Post `
            -ErrorAction Stop ).Content | ConvertFrom-Json ).response
    }
    catch
    {
        Write-Error $_.Exception.Message
    }
}