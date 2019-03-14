# posh-TeslaAPI

## Overview

This repo contains a PowerShell module for interacting with the Tesla API for a vehicle

### How To Use

you'll first need to create a connection using the same credentials you use to sign into
tesla.com and assign it to a var:

```powershell
$apiX = `
    Get-TeslaAPIConnection `
        -UserName 'email@aol.com' `
        -Password ( 'tesla.comPassword' | ConvertTo-SecureString -AsPlainText -Force )
```
from now on you can use this var for all other cmdlets, they accept the connection via the parameter '-TeslaX'

you can then either get a list of all cars on the account with only the connection var:

```powershell
Get-AllVehicles -TeslaX $apiX
```

or call any other cmdlet with the connection and the vehicles id ( note this is the id object NOT the vehicle_id you get back from Get-TeslaVehicle or Get-AllVehicles )

```powershell
Get-VehicleChargeState -TeslaX $apiX -VehicleId 123456789

Unlock-VehicleDoors -TeslaX $apiX -VehicleId 123456789
```

## TO-DO

need to implement all the POST operations that require a parameter, currently the only POST ops supported are 
boolean, i.e. Lock/Unlock, Honk Horn, Flash Lights

## How To Contribute

Fork this repo, make/test changes and issue a pull request.

## Tesla API Documentation

Official(?): https://www.teslaapi.io/

Unofficial : https://tesla-api.timdorr.com/
