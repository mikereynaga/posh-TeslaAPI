function Get-AllData
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    $data_url = "$( $TeslaX.baseURL )/api/1/vehicles/$( $VehicleID )/data"

    if( ( Get-TeslaVehicle -TeslaX $TeslaX -VehicleID $VehicleID ).State -eq [carState]::asleep )
    {
        Switch-TeslaState -TeslaX $TeslaX -VehicleID $VehicleID
    }

    try
    {
        ( ( Invoke-WebRequest `
            -Uri $data_url `
            -Headers $TeslaX.authHeader `
            -Method Get `
            -ErrorAction Stop ).Content | ConvertFrom-Json ).response
    }
    catch
    {
        Write-Error $_.Exception.Message
        return $null
    }
}