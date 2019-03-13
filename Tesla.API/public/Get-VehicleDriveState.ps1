function Get-VehicleDriveState
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [TeslaConnection]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    ( Get-AllData -TeslaX $TeslaX -VehicleID $VehicleID ).drive_state
}