#Requires -Version 5.0
[cmdletbinding()]
param()

Write-Verbose $PSScriptRoot
Write-Verbose 'Import Classes in order because of dependencies'

$classList = New-Object System.Collections.Generic.List[System.Object]
foreach( $file in ( Get-ChildItem "$psscriptroot\classes\" ) )
{
    if( $file.Name.EndsWith( ".ps1" ) )
    {
        $classList.Add( $file.Name )
    }
}

foreach( $class in $classList )
{
    Write-Verbose " Class: $class"
    . "$psscriptroot\classes\$class"
}

Write-Verbose 'Import everything in sub folders folder'
foreach( $folder in @( 'data', 'private', 'public' ) )
{
    $root = Join-Path -Path $PSScriptRoot -ChildPath $folder
    if( Test-Path -Path $root )
    {
        Write-Verbose "processing folder $root"
        $files = Get-ChildItem -Path $root -Filter *.ps1 -Recurse

        # dot source each file
        $files | where-Object{ $_.name -NotLike '*.Tests.ps1'} | 
            ForEach-Object{ Write-Verbose $_.basename; . $_.FullName }
    }
}

Export-ModuleMember -function ( Get-ChildItem -Path "$PSScriptRoot\public\*.ps1" ).basename