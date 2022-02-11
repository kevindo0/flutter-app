#include <stdint.h>

extern "C" __attribute__((visibility("default"))) __attribute__((used))
int32_t native_add(int32_t x, int32_t y) {
    return x + y;
}

uint8_t first = 209;

int8_t int8 = -108;
uint8_t uint8 = 208;

int16_t int16 = -10016;
uint16_t uint16 = 20016;

int32_t int32 = -10032;
uint32_t uint32 = 20032;

int64_t int64 = -1000064;
uint64_t uint64 = 2000064;

float float32 = 3.1415;
double double64 = 2.17284949;
