# Overview

messing around with the Tesla API

https://www.teslaapi.io/

Unofficial: https://tesla-api.timdorr.com/

How-To-Use

first create a tesla connection with your creds for the tesla site:

$api_connection = Get-TeslaAPIConnection -UserName "user" -Password ( "pass" | ConvertTo-SecureString -AsPlainText -Force )

then pass that connection, either by itseld to get all vehicles on an account:

Get-AllVehicles -TeslaX $api_connection

or with a vehicle ID to all the other Get cmdlets:

Get-VehicleChargeState -TeslaX $api_connection -VehicleID 123456789456
