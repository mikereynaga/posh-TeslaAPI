function Get-TeslaAPIConnection
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

    $TeslaX = `
        Get-TeslaConnection `
            -UserName $UserName `
            -Password $Password `
            -AuthToken $AuthToken

    $TeslaX
}