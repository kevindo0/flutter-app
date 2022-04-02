ANDROID_NDK_HOME=/Users/kkdu/Library/Android/sdk/ndk/21.1.6352462

GCC=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/x86_64-linux-android21-clang

GOOS=$ANDROID_NDK_HOME/platforms/android-21/arch-x86_64
INCLUDE=$ANDROID_NDK_HOME/sysroot/usr/include
EABI=$ANDROID_NDK_HOME/sysroot/usr/include/arm-linux-androideabi

CFLG="--sysroot=$GOOS -isystem $INCLUDE -isystem $EABI"

echo $GCC
echo $CFLG

$GCC $CFLG -fPIC -shared hello.c -o libhello.so

