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

### Switch case

```C
switch (flag) {
	case 1:
		statement1;
		break;
	case 2: case 3: 
		statement2;
		break;
		
	case n:
		statementn;
		break;
	default:
		default_statement;
}

```
- 不加 break 可以 compile，但會發生可怕的事情!!!
- flag 只能是變數不能是算式
- case 只能是常數不能是算式 
- 可以把 case 串起來
- default 可加可不加 處理例外狀況方便
- 放在 main 裡面時，會有 warning return type defaults to ‘int’ [-Wreturn-type][這裡](https://blog.moli.rocks/2016/12/15/why-should-main-return-in-c/)有解釋，不太懂
	- main 變成 int main，仍然可以 return 非 int 的東西，會有warning
等價於
```C
if (flag == 1){
statement1;} else if (flag == 2){
statement2;} else if (flag == n) {
statementn} else {
default_statement;
}
```

### define
```C
# define ADD 0
```
不知道他跟declare的差別在哪 之後再看

### while
```C
while (condotion) {
	//code to be execute
}
```

#### do while
```C
do {  
  _// code block to be executed_}  
while (_condition_);
```
不論 while 條件對錯都會執行一次，如果條件對就跟一般 while 行為一樣

### for
```C


```