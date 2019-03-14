function Get-TeslaAPIToken
{
    [cmdletbinding()]
    param(
        [Parameter( Mandatory=$true )]
        [string]$UserName,
        [Parameter( Mandatory=$true )]
        [SecureString]$Password,
        [Parameter( Mandatory=$true )]
        [string]$ClientID,
        [Parameter( Mandatory=$true )]
        [string]$ClientSecret,
        [Parameter( Mandatory=$true )]
        [string]$URL
    )

    $clear_text_pw = Get-ClearTextPW -Password $Password

    $request_body = @{
        "grant_type"    = "password";
        "client_id"     = $ClientID;
        "client_secret" = $ClientSecret;
        "email"         = $UserName;
        "password"      = $clear_text_pw;
    }

    
    try
    {
        $content_return = Invoke-WebRequest `
            -Uri "$( $URL )/oauth/token?grant_type=password" `
            -Headers @{ "Content-Type" = "application/json"; } `
            -Body ( $request_body | ConvertTo-Json ) `
            -Method Post `
            -ErrorAction Stop

        Clear-Variable Password,clear_text_pw
        Remove-Variable Password,clear_text_pw
    }
    catch
    {
        Write-Error $_.Exception.Message
        return $null
    }

    if( $content_return.StatusCode -ne 200 )
    {
        Write-Error "Error getting token from api"
        return $null
    }

    ( $content_return.Content | ConvertFrom-Json ).access_token
}