/* lab6: part (a) emulating a for loop */

#include <stdio.h>

int main() {
    int c, i, m, n;
    printf("Enter an integer value for m: ");
    scanf("%d", &m);

    printf("Enter an integer value for n: ");
    scanf("%d", &n);

    printf("Enter an integer value for c: ");
    scanf("%d", &c);

    /*emulated for loop belongs here*/
    printf("\nEmulated for loop\n");

    goto L0;
L0:
    i = m;
    goto L1;
L1:
    i += c;
    if  (i < n) {
        printf("%d ", i);
        goto L1;
    } else {
        goto L3;
    }
L3:

    printf("\n\nDone\n");

    return 0;
}
