$profile_relative = "Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"
$profile_src = "$PSScriptRoot/home/$profile_relative"
$profile_dest = "$HOME/$profile_relative"

if (-not (Test-Path $profile_dest)) {
    New-Item -Path $profile_dest -ItemType SymbolicLink -Value $profile_src | Out-Null
    Write-Output "Profile installed"
} else {
    Write-Warning -Message "Already installed"
}
