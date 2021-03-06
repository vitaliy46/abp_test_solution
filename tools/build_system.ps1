function Get-ScriptDirectory
{
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}
$module = Get-ScriptDirectory
$module = $module + "\Invoke-MsBuild.psm1"
Import-Module -Name $module

function Build-Project
{
    param(
        [string]$solutionOrProjectPath,
        [string]$target,
        [string]$configuration
    )
    $parameters = "/t:" + $target + " /p:Configuration=" + $configuration
    return Invoke-MsBuild -Path $solutionOrProjectPath -MsBuildParameters $parameters
}

$solutions = @(
    "..\sources\framework\sources\URISH.Framework.sln",
    "..\sources\modules\Urish.Core\sources\Urish.Core.sln",
    "..\sources\modules\Urish.General\sources\Urish.General.sln",
    "..\sources\modules\Urish.Security\Sources\Urish.Security.sln",
    "..\sources\modules\Urish.Importer\sources\Urish.Integration.sln",
    "..\sources\modules\Urish.EHR\sources\uRISH.EHR.sln",
    "..\sources\modules\Urish.RoadAccidents\sources\RoadAccidents.sln",
    "..\sources\URISH.Runtime.sln"
)

$scriptPath = Get-ScriptDirectory

$enumer = $solutions.GetEnumerator()
for($i=0; $i -le $solutions.Count;){
    $path = $solutions[$i]
    $fullPath = [System.IO.Path]::Combine($scriptPath, $path)
    Write-Host ====== Build $path ==============================  -foregroundcolor "white"
    $result = Build-Project ([System.IO.Path]::GetFullPath($fullPath)) "Build" "Debug"
    if($result){
        Write-Host ====== SUCCESS ":-)" ============================== -foregroundcolor "green"
        $i++
    }
    else {
        Write-Host ====== FAILED ":-(((((" ============================== -foregroundcolor "red"
        Write-Host "Esc - exit, Enter - continue, R - repeat" -foregroundcolor "yellow"
        while($true){
            $key = [System.Console]::ReadKey($true).Key
            Write-Host $key
            if($key -eq [System.ConsoleKey]::Escape){
                $i = 9999
                break
            } elseif($key -eq [System.ConsoleKey]::Enter) {
                $i++
                break
            } elseif($key -eq [System.ConsoleKey]::R) {
                break
            }
        }
    }
    Write-Host =================================================  -foregroundcolor "white"
    Write-Host 
    Write-Host 
    Write-Host 
}

Write-Host Build process complete!!! Press any key.
$exit = [System.Console]::ReadKey($true)

