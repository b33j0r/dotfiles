$SRC_ROOT_GODOT = "$SRC\godot\godot"
$GODOT_VERSION = "3.2.4.rc"

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
    $ndk_platform = "android-22"
    
    Foreach ($android_arch in $ANDROID_ARCHS)
    {
      Measure-Command {
        scons platform=android target=$target android_arch=$android_arch ndk_platform=$ndk_platform -j 16 | Out-Default
      }
    }

    pushd platform/android/java
      .\gradlew generateGodotTemplates
    popd

    cp ".\bin\*.apk" "$env:APPDATA\Godot\templates\$GODOT_VERSION"

  popd
}

function build-android-keystore {
  keytool -keyalg RSA -genkeypair -alias androiddebugkey -keypass android -keystore debug.keystore -storepass android -dname "CN=Android Debug,O=Android,C=US" -validity 9999
}
