#include <stdio.h>
#include "io.h"

double get_coefficient(const char* name) {
    double val;
    printf("Enter coefficient %s: ", name);
    scanf("%lf", &val);
    return val;
}
