import 'libgo.h.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'dart:ffi';

class FFi {
  FFi._();

  final _native = NativeLibrary(DynamicLibrary.open('libgo.so'));

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
}
