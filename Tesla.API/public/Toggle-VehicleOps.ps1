function Lock-VehicleDoors
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint door_lock
}

function Start-FlashLights
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint flash_lights
}

function Start-HornkHonk
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint honk_horn
}

function Unlock-VehicleDoors
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint door_unlock
}

Export-ModuleMember Lock-VehicleDoors,Start-FlashLights,Start-HornkHonk,Unlock-VehicleDoors