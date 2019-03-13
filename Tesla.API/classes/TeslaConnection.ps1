class TeslaConnection
{
    [string]$Token
    [string]$baseURL
    [hashtable]$authHeader
}

function Get-TeslaConnection
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true  )]
        [string]$UserName,
        [Parameter( Mandatory=$true  )]
        [SecureString]$Password,
        [Parameter( Mandatory=$false )]
        [string]$AuthToken
    )

    $api_vars = ( Get-Content ".\Tesla.API\data\module_data.json" | ConvertFrom-Json )
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
    $new_connection.Token = $auth_token
    $new_connection.authHeader = @{
        "Authorization" = "Bearer $( $auth_token )";
    }

    $new_connection
}