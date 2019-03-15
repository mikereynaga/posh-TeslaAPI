function Lock-VehicleDoors
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint door_lock
}

function Unlock-VehicleDoors
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint door_unlock
}

function Start-FlashLights
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint flash_lights
}

Export-ModuleMember Lock-VehicleDoors,Unlock-VehicleDoors,Start-FlashLights