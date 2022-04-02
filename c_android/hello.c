#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include"hello.h"

int getNum(){
	return 12345;
}

char *getChar(char *cs[], int n) {
	for (int i = 0; i < n; i++) {
		printf("%d: %s\n", i, cs[i]);
	}
	if (n == 0) {
		return "hello1";
	} else if (n < 3) {
		return cs[0];
	} else {
		return cs[n-1];
	}
}

char* join(char *a, char *b) {
	char *c = (char *) malloc(strlen(a) + strlen(b) + 1);
	char *temp = c;
	while (*a != '\0') {
		*c++ = *a++;
	}
	while ((*c++ = *b++) != '\0') {
		;
	}
	// 返回值是局部malloc申请的指针变量，需在函数调用结束后free之
	return temp;
}
