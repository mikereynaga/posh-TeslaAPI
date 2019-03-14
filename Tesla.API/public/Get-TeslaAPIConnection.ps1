function Get-TeslaAPIConnection
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

    $TeslaX = `
        Get-TeslaConnection `
            -UserName $UserName `
            -Password $Password `
            -AuthToken $AuthToken

    $TeslaX
}