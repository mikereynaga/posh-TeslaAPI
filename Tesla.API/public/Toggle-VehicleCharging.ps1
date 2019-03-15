function Open-ChargePort
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint charge_port_door_open
}

function Close-ChargePort
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint charge_port_door_close
}

function Start-Charging
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint charge_start
}

function Stop-Charging
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint charge_stop
}
function Set-MaxChargeLimit
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint charge_max_range
}

function Set-StandardChargeLimit
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [psobject]$TeslaX,
        [Parameter( Mandatory=$true )]
        [long]$VehicleID
    )

    Set-NoParams -TeslaX $TeslaX -VehicleID $VehicleID -EndPoint charge_standard
}

Export-ModuleMember Set-MaxChargeLimit,Set-StandardChargeLimit,Open-ChargePort,Close-ChargePort,Start-Charging,Stop-Charging