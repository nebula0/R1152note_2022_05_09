
### declare variable
關於在 function 外這樣
```c
#include <stdio.h>

int i = 0;
int i = 2;
```
會出事`error: redefinition of 'i'|`
的解釋
https://localcoder.org/why-global-variable-redefinition-is-not-allowed