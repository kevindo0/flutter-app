### 跨平台编译
```bash
cmake .. \
  -DCMAKE_SYSTEM_NAME=Android \
  -DCMAKE_SYSTEM_VERSION=21 \
  -DCMAKE_ANDROID_ARCH_ABI=x86_64 \
  -DCMAKE_ANDROID_NDK=/data/android-ndk-r23b \
  -DCMAKE_ANDROID_STL_TYPE=c++_shared

set(CMAKE_SYSTEM_NAME Android)
set(CMAKE_SYSTEM_VERSION 21)
set(CMAKE_ANDROID_ARCH_ABI x86_64)
set(CMAKE_ANDROID_NDK /data/android-ndk-r23b)
set(CMAKE_ANDROID_STL_TYPE c++_shared)
```

[cmake使用教程](https://juejin.cn/post/6844903565803126798)