import 'dart:ffi';
import 'dart:io';

class NativeAdd {
  static String _libName = "libnative_add.so";
  // 内部构造方法，可避免外部暴露构造函数，进行实例化
  NativeAdd._internal();

  static add(int a, int b) {
    int Function(int x, int y) nativeAddFunc;
    var nativeAddLib = Platform.isAndroid
        ? DynamicLibrary.open("libnative_add.so")
        : DynamicLibrary.process();
    nativeAddFunc = nativeAddLib
        .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
        .asFunction();
    return nativeAddFunc(a, b);
  }
}


