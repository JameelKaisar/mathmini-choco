#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mathmini.h"

int main(int argc, char *argv[]) {
    if (argc != 4) {
        printf("Usage: %s <add/sub> <a> <b>\n", argv[0]);
        return 1;
    }

    char *opr = argv[1];
    int a = atoi(argv[2]);
    int b = atoi(argv[3]);

    if (strcmp(opr, "add") == 0) {
        printf("add(%d, %d) = %d\n", a, b, add(a, b));
    } else if (strcmp(opr, "sub") == 0) {
        printf("sub(%d, %d) = %d\n", a, b, sub(a, b));
    } else {
        printf("Usage: %s <add/sub> <a> <b>\n", argv[0]);
        return 1;
    }

    return 0;
}
