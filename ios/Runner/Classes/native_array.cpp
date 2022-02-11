//
// Created by 杜超 on 2022/2/11.
//
#include <stdio.h>
#include <mm_malloc.h>
#include <cstring>

#define DART_API extern "C" __attribute__((visibility("default"))) __attribute__((used))

// 定义IntArray结构体
typedef struct {
    int32_t *data;
    int32_t length;
} IntArray;

DART_API IntArray *createIntArray() {
    IntArray *result = (IntArray *) malloc(sizeof(IntArray));
    result -> length = 5;
    result -> data = (int32_t *) malloc(result -> length * sizeof(int32_t));
    for (int i = 0; i < result -> length; i++) {
        result -> data[i] = i * 2;
    }
    return result;
}

DART_API int32_t getMaxInt(const int32_t *intArray, int32_t length) {
    int32_t max = intArray[0];
    for (int i = 1; i < length; i++) {
        if (intArray[i] > max) {
            max = intArray[i];
        }
    }
    return max;
}

// int main() {
//     IntArray *a = createIntArray();
//     int32_t max = getMaxInt(a -> data, 5);
//     printf("%d, max: %d\n", a -> length, max);
//     free(a -> data);
//     free(a);
// }

