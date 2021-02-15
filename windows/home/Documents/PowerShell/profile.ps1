# Vars

$HOME_SRC = "$HOME\Source"
$HOME_PROJECTS = "$HOME\Projects"
$HOME_BIN = "$HOME\bin"

$SRC = $HOME_SRC
$PROJECTS = $HOME_PROJECTS

$DOTFILES = "$PROJECTS\windows\dotfiles"
$DOTFILES_PS1 = "$DOTFILES\windows\home\Documents\PowerShell"

# Library Paths

# $env:JAVA_HOME = "$HOME\AppData\Local\JetBrains\Toolbox\apps\AndroidStudio\ch-0\201.7042882\jre"
# $env:JAVA_HOME = "C:\Program Files\AdoptOpenJDK\jdk-8.0.282.8-hotspot\"
$env:JAVA_HOME = "C:\jdk\jdk-15.0.1"

$env:ANDROID_NDK_ROOT = "$HOME\AppData\Local\Android\Sdk\ndk-bundle"
# $env:ANDROID_NDK_ROOT = "$HOME\AppData\Local\Android\Ndk\android-ndk-r21e"
# $env:ANDROID_NDK_ROOT = "C:\Users\brian\AppData\Local\Android\Sdk\ndk\21.3.6528147"

$env:ANDROID_SDK_ROOT = "$HOME\AppData\Local\Android\Sdk"
$env:ANDROID_SDK_TOOLS = "$env:ANDROID_SDK_ROOT\tools"
$env:ANDROID_SDK_PLATFORM_TOOLS = "$env:ANDROID_SDK_ROOT\platform-tools"

$env:SHADERC_LIB_DIR = "C:\VulkanSDK\1.2.162.1\Lib"

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

add-path("C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\MSBuild\Current\Bin")
add-path("$env:JAVA_HOME\bin")
add-path("$env:ANDROID_SDK_PLATFORM_TOOLS")
add-path("$env:ANDROID_SDK_TOOLS\bin")
add-path("$HOME_BIN")

# Aliases
Set-Alias which get-command

Set-Alias o Invoke-Item

function ~ { Set-Location "$HOME" }
function dotfiles { Set-Location "$HOME\Projects\dotfiles" }
function p { Set-Location "$PROJECTS" }
function s { Set-Location "$SRC" }
function b { Set-Location "B:\" }
function g { Set-Location "B:\Godot" }

function c { Set-Location "C:\" }
function d { Set-Location "D:\" }

function activate ($name) {
    if ($PSBoundParameters.Count -ne 1) {
        Write-Host "usage: activate <venv name>"
    } else {
        & "$HOME\.venv\$name\Scripts\activate.ps1"
    }
}

# Load External Files
Import-Module -DisableNameChecking -name "$DOTFILES_PS1\BuildShortcuts"

# Done
Write-Output "Profile loaded ($PSCommandPath)"
