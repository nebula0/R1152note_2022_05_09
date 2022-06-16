#C 

### gcd

```C
#include <stdio.h>
int main(){
int mod, i, j;

scanf("%d%d", &i, &j);
while ((i % j) != 0){
    mod = i%j;
    i = j;
    j = mod;
}
printf("%d", j);

}
```


