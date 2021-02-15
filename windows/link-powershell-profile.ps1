
$profile_src = "$PSScriptRoot/home/Documents/PowerShell/profile.ps1"
Write-Output "Profile path: $profile_src"

$profile_dest_ps = "$HOME/Documents/PowerShell/profile.ps1"
$profile_dest_ps2 = "$HOME/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
$profile_dest_wps = "$HOME/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1"

function install-profile($dest) {
    if (-not (Test-Path $dest)) {
        New-Item -Path $dest -ItemType SymbolicLink -Value $profile_src | Out-Null
        Write-Output "Profile installed: $dest"
    } else {
        Write-Warning -Message "Profile already installed: $dest"
    }
}

install-profile($profile_dest_ps)
install-profile($profile_dest_ps2)
install-profile($profile_dest_wps)
