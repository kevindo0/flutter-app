package main

/*
#include<stdlib.h>
struct JsResult {
   char* result;
   int len;
   int err;
};
*/
import "C"
import (
   "github.com/robertkrimen/otto"
   "unsafe"
)

func main() {
}

type JsResult C.struct_JsResult

//export RunJs
func RunJs(input *C.char) JsResult {
   res := C.GoString(input) // *C.char -> string

   vm := otto.New()
   result, err := vm.Run(res)
   if err != nil {
      errMsg := err.Error()
      return JsResult{
         result: (*C.char)(C.CString(errMsg)),
         err:    1,
         len:    C.int(len(errMsg)),
      }
   }

   str := result.String()
   return JsResult{
      result: (*C.char)(C.CString(str)), // string -> *C.char
      err:    0,
      len:    C.int(len(str)),
   }
}

//export FreeResult
func FreeResult(result JsResult)  {
   C.free(unsafe.Pointer(result.result))
}

