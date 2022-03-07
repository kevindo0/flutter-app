// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Bindings to `headers/libgo.h`.
class NativeLibrary {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NativeLibrary(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NativeLibrary.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  JsResult RunJs(
    ffi.Pointer<ffi.Int8> input,
  ) {
    return _RunJs(
      input,
    );
  }

  late final _RunJsPtr =
      _lookup<ffi.NativeFunction<JsResult Function(ffi.Pointer<ffi.Int8>)>>(
          'RunJs');
  late final _RunJs =
      _RunJsPtr.asFunction<JsResult Function(ffi.Pointer<ffi.Int8>)>();

  void FreeResult(
    JsResult result,
  ) {
    return _FreeResult(
      result,
    );
  }

  late final _FreeResultPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(JsResult)>>('FreeResult');
  late final _FreeResult = _FreeResultPtr.asFunction<void Function(JsResult)>();
}

class JsResult extends ffi.Struct {
  external ffi.Pointer<ffi.Int8> result;

  @ffi.Int32()
  external int len;

  @ffi.Int32()
  external int err;
}