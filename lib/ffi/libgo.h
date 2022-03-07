struct JsResult {
   char* result;
   int len;
   int err;
};

struct JsResult RunJs(char* input);

void FreeResult(struct JsResult result);