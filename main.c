/*
 * Recursively computes Fibonacci numbers.
 * CSC 225, Assignment 6
 * Given code, Winter '24.
 * TODO: Complete this file.
 */
#include "fib.h"
#include <stdio.h>

int main(int argc, char *argv[])
{
    int x, y;
    printf("Enter an integer: ");
    scanf("%d", &x);
    y = fib(x);
    printf("f(%d) = %d\n", x, y);
    return 0;
}
