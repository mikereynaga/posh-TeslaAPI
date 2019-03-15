class TeslaConnection
{
    [string]$Token
    [string]$baseURL
    [string]$vehiclesURL
    [hashtable]$authHeader
}

function Get-TeslaConnection
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true  )]
        [string]$UserName,
        [Parameter( Mandatory=$false )]
        [SecureString]$Password,
        [Parameter( Mandatory=$false )]
        [string]$AuthToken
    )

    if( !( $Password ) -and !( $AuthToken ) )
    {
        Throw "Must supply either an account password or a valid bearer token"
    }

    $api_vars = ( Get-Content ( Join-Path $MyInvocation.MyCommand.Module.ModuleBase "\data\module_data.json" ) | ConvertFrom-Json )
    if( [string]::IsNullOrEmpty( $AuthToken ) )
    {
        $auth_token = `
            Get-TeslaAPIToken `
                -UserName $UserName `
                -Password $Password `
                -ClientID $api_vars.client_id `
                -ClientSecret $api_vars.client_secret `
                -URL $api_vars.base_url
    }
    else
    {
        $auth_token = $AuthToken
    }

    $new_connection = [TeslaConnection]::new()
    $new_connection.baseURL = $api_vars.base_url
    $new_connection.vehiclesURL = $api_vars.base_url + $api_vars.api_vehicles
    $new_connection.Token = $auth_token
    $new_connection.authHeader = @{
        "Authorization" = "Bearer $( $auth_token )";
    }

    $new_connection
}