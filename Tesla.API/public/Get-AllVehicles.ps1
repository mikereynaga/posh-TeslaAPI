function Get-AllVehicles
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX
    )

    $all_vehicles = @()

    try
    {
        $vehicles = `
            Invoke-WebRequest `
                -Headers $TeslaX.authHeader `
                -Uri $TeslaX.vehiclesURL `
                -Method Get `
                -ErrorAction Stop
    }
    catch
    {
        Write-Error $_.Exception.Message
        return $null
    }

    foreach( $vehicle in ( ( $vehicles.Content ) | ConvertFrom-Json ).response )
    {
        $all_vehicles += `
            New-TeslaVehicle `
                -ID $vehicle.id `
                -VehicleID $vehicle.vehicle_id `
                -VIN $vehicle.vin `
                -DisplayName $vehicle.display_name `
                -OptionCodes $vehicle.option_codes `
                -State $vehicle.state `
                -InService $vehicle.in_service
    }

    $all_vehicles
}