$SRC_ROOT_GODOT = "$SRC\godot\godot"

function build-godot($suffix = "") {
  if ($suffix) {
    $suffix = "-$suffix"
  }

  pushd "$SRC_ROOT_GODOT$suffix"
    git pull

    Measure-Command { scons -j 16 | Out-Default }
  popd
}

function build-godot-templates($target="release_debug", $suffix = "") {
  if ($suffix) {
    $suffix = "-$suffix"
  }

  pushd "$SRC_ROOT_GODOT$suffix"

    # git pull

    $ANDROID_ARCHS = "armv7", "arm64v8", "x86", "x86_64"
    Foreach ($android_arch in $ANDROID_ARCHS)
    {
      Measure-Command {
        scons platform=android target=$target android_arch=$android_arch -j 16 | Out-Default
      }
    }

    pushd platform/android/java
      .\gradlew generateGodotTemplates
    popd

  popd
}

function build-foo {
  Write-Output "foobar!"
}
