import 'libgo.h.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';

class FFi {
  FFi._();

  final _native = NativeLibrary(DynamicLibrary.open('libpsi_sdk_so.so'));

  static final FFi _instant = FFi._();

  factory FFi() => _instant;

  String runJs(String input) {
    // input
    final raw = input.codeUnits;
    final buffer = ffi.malloc.allocate<Int8>(raw.length + 1);
    buffer.asTypedList(raw.length + 1)
      ..setAll(0, raw)
      ..[raw.length] = 0;

    final result = _native.RunJs(buffer);

    final message = String.fromCharCodes(result.result.asTypedList(result.len));
    final error = result.err;

    // free
    ffi.malloc.free(buffer);
    _native.FreeResult(result);

    // if (error != 0) throw Exception(message);
    return message;
  }

  void ApiCgotest() {
    _native.api_cgotest();
  }

  void RunPsi() {
    final taskNo = stringToPointer("no132");
    final ipport = stringToPointer("192.168.0.4:6000");

    final myStrings = ['asdf', 'fsda'];
    List<Pointer<Int8>> myPointers = myStrings.map((e) => stringToPointer(e)).toList();
    final Pointer<Pointer<Int8>> buffer = ffi.malloc.allocate(myStrings.length);
    for (int i = 0; i < myStrings.length; i++) {
      buffer[i] = myPointers[i];
      print(myStrings[i]);
    }

    final ApiRes a = _native.api_run_psi_mem(taskNo, 0, 0, ipport, 5, buffer, 2, 0);
    print(a.m_code);
    print(pointerToString(a.m_err));
    ffi.malloc.free(taskNo);
    ffi.malloc.free(ipport);
    ffi.malloc.free(buffer);
    myPointers.forEach(ffi.malloc.free);
  }

  Pointer<Int8> stringToPointer(String str) {
    final raw = str.codeUnits;
    final buffer = ffi.malloc.allocate<Int8>(raw.length + 1);
    buffer.asTypedList(raw.length + 1)
      ..setAll(0, raw)
      ..[raw.length] = 0;
    return buffer;
  }

  String pointerToString(Pointer<Int8> pointer) {
    return pointer.cast<ffi.Utf8>().toDartString();
  }
}
