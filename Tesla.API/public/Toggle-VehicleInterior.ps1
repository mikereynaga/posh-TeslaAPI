function Start-HornkHonk
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint honk_horn
}

function Start-HVACSystem
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint auto_conditioning_start
}

function Stop-HVACSystem
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint auto_conditioning_stop
}

function Get-CalendarEvents
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint upcoming_calendar_entries
}

function Reset-ValetPin
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint reset_valet_pin
}

function Enable-SpeedLimit
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint speed_limit_activate
}

function Disable-SpeedLimit
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint speed_limit_deactivate
}

function Clear-SpeedLimitPin
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint speed_limit_clear_pin
}


Export-ModuleMember Start-HornkHonk,Start-HVACSystem,Stop-HVACSystem,Get-CalendarEvents,Reset-ValetPin,Enable-SpeedLimit,Disable-SpeedLimit,Clear-SpeedLimitPin