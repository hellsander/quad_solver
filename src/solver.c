#include <math.h>
#include "solver.h"

int solve_quadratic(double a, double b, double c, double *x1, double *x2) {
    if (a == 0) return 0;
    double d = b * b - 4 * a * c;
    if (d > 0) {
        *x1 = (-b + sqrt(d)) / (2 * a);
        *x2 = (-b - sqrt(d)) / (2 * a);
        return 2;
    } else if (d == 0) {
        *x1 = -b / (2 * a);
        return 1;
    }
    return 0;
}
