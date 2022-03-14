### 1、c1
<b>主题</b>: 添加版本号和配置头文件  
当 CMake 配置这个头文件的时候，@Tutorial_VERSION_MAJOR@ 和 @ Tutorial_VERSION_MINOR@ 就会用CMakeLists.txt 文件中对应的值替换。

```bash
gcc c1.cpp
mkdir build && cd build
cmake ..
make
```

### 2、demo2
