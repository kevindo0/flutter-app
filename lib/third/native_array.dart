import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

// 对应C中的IntArray结构体
class IntArray extends Struct {
  external Pointer<Int32> data;

  @Int32()
  external int length;
}

typedef NativeCreateIntArray = Pointer<IntArray> Function();
typedef FFICreateIntArray = Pointer<IntArray> Function();

typedef NativeGetMaxInt = Int32 Function(Pointer<Int32>, Int32);
typedef FFIGetMaxInt = int Function(Pointer<Int32>, int);

DynamicLibrary dl = Platform.isAndroid
    ? DynamicLibrary.open("libnative_add.so")
    : DynamicLibrary.process();

class NativeArray {

  static FFICreateIntArray? createIntArray;
  static FFIGetMaxInt? getMaxInt;

  // 初始化函数
  static init() {
    createIntArray = dl.lookupFunction<NativeCreateIntArray, FFICreateIntArray>("createIntArray");
    getMaxInt = dl.lookupFunction<NativeGetMaxInt, FFIGetMaxInt>("getMaxInt");
  }

  late Pointer<IntArray> pIntArray;
  late IntArray array;

  NativeArray() {
    pIntArray = createIntArray!();
    array = pIntArray.ref;
  }

  void print1() {
    print("createIntArray: ${createIntArray}");
  }

  void show() {
    for (int i = 0; i < array.length; i ++) {
      print("intArray[$i]=${array.data[i]}");
    }
    //获取数组中的最大值
    int max = getMaxInt!(array.data, array.length);
    print("max of intArray=$max");
  }

  void free() {
    calloc.free(pIntArray);
    calloc.free(array.data);
  }
}

// NativeArray.init();
// var n = NativeArray();
// n.show();
// n.free();
