#include<stdio.h>
#include"hello.h"

int main() {
	int a = getNum();
	printf("a:%d\n", a);
	char* cs[] = {"one", "two", "three"};
	char* c = getChar(cs, 3);
	printf("res char: %s\n", c);
	return 0;
}
