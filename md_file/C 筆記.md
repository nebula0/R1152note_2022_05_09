#C 
## concept
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

### Short-circuit evaluation
&& 跟 ||
https://zh.wikipedia.org/zh-tw/%E7%9F%AD%E8%B7%AF%E6%B1%82%E5%80%BC

### overflow
整數 4 位元組，32位元，$2^{31} -1 到 -2^{31}$，2147483647 ~ -2147483648。
![[Pasted image 20220606234922.png]]

## syntax

### if

```C

if (condition) {
	statement1;
	statement2;
} else if {
	statement3;
} else {
	statement4;
}
```

### conditional expressions

```C
(cond)? expression1 : expression2

# cond 為真，變數設為 expression1，否則是 expression2
```

ex
```C
int max = (i > j)? i : j;
```