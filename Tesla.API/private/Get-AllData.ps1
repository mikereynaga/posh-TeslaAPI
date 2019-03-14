function Get-AllData
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    $data_url = "$( $TeslaX.vehiclesURL )/$( $VehicleID )/data"

    if( ( Get-TeslaVehicle -TeslaX $TeslaX -VehicleID $VehicleID ).State -eq [carState]::asleep )
    {
        Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint wake_up
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