function Get-VehicleState
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    ( Get-AllData -TeslaX $TeslaX -VehicleID $VehicleID ).vehicle_state
}