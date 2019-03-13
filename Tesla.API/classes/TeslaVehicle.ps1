enum carState
{
    online;
    offline;
    asleep;
}


class TeslaVehicle
{
    [long]$id
    [int]$vehicle_id
    [string]$vin
    [string]$display_name
    [carState]$state
    [bool]$in_service
    [array]$option_codes
}

function New-TeslaVehicle
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [long]$ID,
        [Parameter( Mandatory=$true )]
        [int]$VehicleID,
        [Parameter( Mandatory=$true )]
        [string]$VIN,
        [Parameter( Mandatory=$true )]
        [string]$DisplayName,
        [Parameter( Mandatory=$true )]
        [carState]$State,
        [Parameter( Mandatory=$true )]
        [bool]$InService,
        [Parameter( Mandatory=$true )]
        [array]$OptionCodes
    )

    $return_car = [TeslaVehicle]::new()
    $return_car.display_name = $DisplayName
    $return_car.id = $ID
    $return_car.in_service = $InService
    $return_car.option_codes = $OptionCodes
    $return_car.state = $State
    $return_car.vehicle_id = $VehicleID
    $return_car.vin = $VIN

    $return_car
}