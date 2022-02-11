import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

class Person extends Struct {
  external Pointer<Utf8> name;

  @Int32()
  external int age;

  @Float()
  external double height;

  @Double()
  external double weight;
}

typedef Native_createPerson = Person Function(
    Pointer<Utf8> name, Int32 age, Float height, Double weight);

typedef FFI_createPerson = Person Function(
    Pointer<Utf8> name, int age, double height, double weight);

class NativePP {
  static const _libName = "libnative_add.so";

  static getStruct() {
    DynamicLibrary nativeApi = Platform.isAndroid
        ? DynamicLibrary.open(_libName)
        : DynamicLibrary.process();

    //查找全局变量
    final Pointer<Person> pAlice = nativeApi.lookup<Person>("g_alice");
    final Person alice = pAlice.ref; //获取指针所指向的对象

    //打印数据
    print("alice.name=${alice.name.toDartString()}");
    print("alice.age=${alice.age}");
    print("alice.height=${alice.height}");
    print("alice.weight=${alice.weight}");

    //查找createPerson函数
    FFI_createPerson createFunc = nativeApi
        .lookupFunction<Native_createPerson, FFI_createPerson>("createPerson");

    //创建Person
    final Pointer<Utf8> nativeName = "Abigail".toNativeUtf8();
    Person abigail = createFunc(nativeName, 20, 180.0, 120.0);

    //toNativeUtf8创建的对象需要释放
    calloc.free(nativeName);

    //打印
    print("abigail.name=${abigail.name.toDartString()}");
    print("abigail.age=${abigail.age}");
    print("abigail.height=${abigail.height}");
    print("abigail.weight=${abigail.weight}");
  }
}