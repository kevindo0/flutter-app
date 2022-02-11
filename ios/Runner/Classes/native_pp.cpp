#define DART_API extern "C" __attribute__((visibility("default"))) __attribute__((used))

DART_API const char *greetString() {
    return "Hello from Native\0";
}

typedef struct {
    const char *name;
    int age;
    float height;
    double weight;
} Person;

//声明一个全局变量
DART_API Person g_alice{"Alice\n", 18, 170.0, 100.0};

//create函数，用于构建一个Person结构体
DART_API Person createPerson(const char *name, int age, float height, double weight) {
    return Person{name, age, height, weight};
}
