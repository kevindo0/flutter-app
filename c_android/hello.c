#include<stdio.h>
#include"hello.h"
int getNum(){
	return 12345;
}

char* getChar(char* cs[], int n) {
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

