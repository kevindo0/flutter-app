import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

typedef NativeGreetingString = Pointer<Int8> Function();

typedef FFIGreetingString = Pointer<Int8> Function();

class NativeAdd {
  static String _libName = "libnative_add.so";
  // 内部构造方法，可避免外部暴露构造函数，进行实例化
  NativeAdd._internal();

  static add(int a, int b) {
    int Function(int x, int y) nativeAddFunc;
    var nativeAddLib = Platform.isAndroid
        ? DynamicLibrary.open("libnative_add.so")
        : DynamicLibrary.process();
    // nativeAddFunc = nativeAddLib
    //     .lookup<NativeFunction<Int32 Function(Int32, Int32)>>("native_add")
    //     .asFunction();
    nativeAddFunc = nativeAddLib
        .lookupFunction<Int32 Function(Int32, Int32), int Function(int, int)>("native_add");
    return nativeAddFunc(a, b);
  }

  static int first() {
    var nativeApi = Platform.isAndroid
        ? DynamicLibrary.open("libnative_add.so")
        : DynamicLibrary.process();
    Pointer<Uint8> first  = nativeApi.lookup<Uint8>("first");

    // Pointer<Int8> int8 = nativeApi.lookup<Int8>("int8");
    // Pointer<Uint8> uint8 = nativeApi.lookup<Uint8>("uint8");
    // Pointer<Int16> int16 = nativeApi.lookup<Int16>("int16");
    // Pointer<Uint16> uint16 = nativeApi.lookup<Uint16>("uint16");
    // Pointer<Int32> int32 = nativeApi.lookup<Int32>("int32");
    // Pointer<Uint32> uint32 = nativeApi.lookup<Uint32>("uint32");
    // Pointer<Int64> int64 = nativeApi.lookup<Int64>("int64");
    // Pointer<Uint64> uint64 = nativeApi.lookup<Uint64>("uint64");
    // Pointer<Float> float32 = nativeApi.lookup<Float>("float32");
    // Pointer<Double> double64 = nativeApi.lookup<Double>("double64");
    //
    // print("int8=${int8.value}");
    // print("uint8=${uint8.value}");
    // print("int16=${int16.value}");
    // print("uint16=${uint16.value}");
    // print("int32=${int32.value}");
    // print("uint32=${uint32.value}");
    // print("int64=${int64.value}");
    // print("uint64=${uint64.value}");
    // print("float32=${float32.value}");
    // print("double64=${double64.value}");

    return first.value;
  }

  static hello() {
    var nativeApi = Platform.isAndroid
        ? DynamicLibrary.open("libnative_add.so")
        : DynamicLibrary.process();
    final void Function() hello = nativeApi
        .lookup<NativeFunction<Void Function()>>("hello_world")
        .asFunction();
    hello();
  }

  static String greetStr() {
    var nativeApi = Platform.isAndroid
        ? DynamicLibrary.open(_libName)
        : DynamicLibrary.process();
    Pointer<Int8> Function() greetFun = nativeApi
      .lookupFunction<NativeGreetingString, FFIGreetingString>("greetString");
    Pointer<Int8> result = greetFun();
    String greetString = result.cast<Utf8>().toDartString();
    print("greetString: ${greetString}");
    return greetString;
  }
}


