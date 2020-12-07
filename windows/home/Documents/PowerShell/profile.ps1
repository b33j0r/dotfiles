# Profile Management
function sync-profile () {
    & $profile
}

function edit-profile () {
    Invoke-Item $profile
}

# Utilities
function symlink ($existingTarget, $newLink) {
    if ($PSBoundParameters.Count -ne 2) {
        Write-Host "usage: symlink existingTarget newLink"
    } else {
        New-Item -Path $newLink -ItemType SymbolicLink -Value $existingTarget
    }
}

# Path
function add-path ($path) {
    $env:Path = $path + ";" + $env:Path;
}

add-path("$HOME\.bin")
add-path("C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin")


# Aliases
Set-Alias which get-command

Set-Alias o Invoke-Item

function ~ { Set-Location "C:\Users\brian" }
function dotfiles { Set-Location "C:\Users\brian\Projects\dotfiles" }
function p { Set-Location "C:\Users\brian\Projects" }
function s { Set-Location "C:\src" }
function b { Set-Location "B:\" }
function c { Set-Location "C:\" }
function d { Set-Location "D:\" }


# Done
Set-Location $HOME
Write-Output "Profile loaded ($PSCommandPath)"
