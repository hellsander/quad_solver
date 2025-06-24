#include <stdio.h>
#include <stdlib.h>
#include "solver.h"
#include "io.h"

int main(int argc, char *argv[]) {
    double a, b, c;
    if (argc >= 4) {
        a = atof(argv[1]);
        b = atof(argv[2]);
        c = atof(argv[3]);
    } else {
        if (argc >= 2) a = atof(argv[1]); else a = get_coefficient("a");
        if (argc >= 3) b = atof(argv[2]); else b = get_coefficient("b");
        c = get_coefficient("c");
    }

    double x1, x2;
    int result = solve_quadratic(a, b, c, &x1, &x2);

    switch(result) {
        case 2:
            printf("2 real roots: x1 = %.2f, x2 = %.2f\n", x1, x2);
            return 0;
        case 1:
            printf("1 real root: x = %.2f\n", x1);
            return 1;
        default:
            printf("No real roots.\n");
            return -1;
    }
}
