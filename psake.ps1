# PSake makes variables declared here available in other scriptblocks
# Init some things
Properties {
    # Find the build folder based on build system
        $ProjectRoot = $ENV:BHProjectPath
        if(-not $ProjectRoot)
        {
            $ProjectRoot = $PSScriptRoot
        }

    $Timestamp = Get-date -uformat "%Y%m%d-%H%M%S"
    $PSVersion = $PSVersionTable.PSVersion.Major
    $TestFile = "TestResults_PS$PSVersion`_$TimeStamp.xml"
    $lines = '----------------------------------------------------------------------'

    $Verbose = @{}
    if($ENV:BHCommitMessage -match "!verbose")
    {
        $Verbose = @{Verbose = $True}
    }
}

Task Default -Depends Deploy

Task Init {
    $lines
    Set-Location $ProjectRoot
    "Build System Details:"
    Get-Item ENV:BH* | Format-List
    "`n"
}

Task Build -Depends Init {
    $lines

    $public_files = @()

    $public_files = `
        Get-ChildItem ".\Tesla.API\Public\*.ps1" | `
            Where-Object{ $_.name -notmatch 'Tests'} | `
            Select-Object basename,fullname
    
    $functions = New-Object System.Collections.Generic.List[system.object]
    
    foreach( $public_file in $public_files )
    {
        $lastline = Get-Content $public_file.FullName -tail 1
        if( $lastline.StartsWith( "Export-ModuleMember" ) )
        {
            $functions_to_export = $lastline.Split( " " )[1]
            foreach( $function_to_export in $functions_to_export.Split( "," ) )
            {
                $functions.Add( $function_to_export )
            }
    
        }
        else
        {
            $functions.Add( $public_file.basename )
        }
    }

    # Load the module, read the exported functions, update the psd1 FunctionsToExport
    Set-ModuleFunctions -Name $env:BHPSModuleManifest -FunctionsToExport $functions

    # Bump the module version
    $version = [version] (Step-Version (Get-Metadata -Path $env:BHPSModuleManifest))
    Write-Host "Using version: $version"
    
    Update-Metadata -Path $env:BHPSModuleManifest -PropertyName ModuleVersion -Value $version
}

Task Deploy -Depends Build {
    $lines

    # Gate deployment
    if(
        $ENV:BHBuildSystem -ne 'Unknown' -and
        $ENV:BHBranchName -eq "master" -and
        $ENV:BHCommitMessage -match '!deploy'
    )
    {
        $Params = @{
            Path = $ProjectRoot
            Force = $true
        }

        Invoke-PSDeploy @Verbose @Params
    }
    else
    {
        "Skipping deployment: To deploy, ensure that...`n" +
        "`t* You are in a known build system (Current: $ENV:BHBuildSystem)`n" +
        "`t* You are committing to the master branch (Current: $ENV:BHBranchName) `n" +
        "`t* Your commit message includes !deploy (Current: $ENV:BHCommitMessage)"
    }
}
