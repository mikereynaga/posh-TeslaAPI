function Get-TeslaVehicle
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    try
    {
        $vehicle = `
            ( ( Invoke-WebRequest `
                -Headers $TeslaX.authHeader `
                -Uri "$( $TeslaX.vehiclesURL )/$( $VehicleID )" `
                -Method Get `
                -ErrorAction Stop ).Content | ConvertFrom-Json ).response
    }
    catch
    {
        Write-Error $_.Exception.Message
        return $null
    }

    $return_vehicle = 
        New-TeslaVehicle `
            -ID $vehicle.id `
            -VehicleID $vehicle.vehicle_id `
            -VIN $vehicle.vin `
            -DisplayName $vehicle.display_name `
            -OptionCodes $vehicle.option_codes `
            -State $vehicle.state `
            -InService $vehicle.in_service

    $return_vehicle
}