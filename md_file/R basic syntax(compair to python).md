#R

ref:[R Tutorial (w3schools.com)](https://www.w3schools.com/r/default.asp)
這個檔案主要是擔心學了R會跟python搞混，以及作為忘記R語法時的工具


## R版本
```r
R.version
```
[ref](https://www.delftstack.com/zh-tw/howto/r/check-version-of-r/)



## comments
```R
# this is a comment
```
R好像沒多行註解?

## Variable
#### assign
```R
name <- Jhon
name

```
可以直接輸變數的名稱會跑出東西，R的特色
`=`也可以用在assign 但有時會不相容

#### paste
```R
text <- "supernova"

paste("R is , text")

# [1] "R is awesome"
```
看起來`paste()`是python的`join()`加上`print()`

####  `+`
```R
num1 <- 5  
num2 <- 10  
  
num1 + num2
```
`+`可以用在numeric object的相加，字串不行。
python可以這樣:`print("HI" + "OO")`

#### Multiple Variable
```R
var1 <- var2 <- var3 <- "Orange"

var1
var2
var3
# [1] "Orange"  
# [1] "Orange"  
# [1] "Orange"
```
python好像不行
#### Variable names
跟python似乎差不多

## Data types
參考[[Python basic syntax#Data Types]]
#### built-in data types
- `numeric` 10, 3.3
- `integer` 1L, 55L, L宣告他是整數 
- `complex` 9 +3i(虛數!?)
- `character` 就是`str`
- `logical` TRUE or FALS

#### setting data type
```
# numeric  
x <- 10.5  
class(x)  
  
# integer  
x <- 1000L  
class(x)  
  
# complex  
x <- 9i + 3  
class(x)  
  
# character/string  
x <- "R is exciting"  
class(x)  
  
# logical/boolean  
x <- TRUE  
class(x)
```
看看起來是看塞什麼東進去就是什麼
#### verify data type
`class(x)`

## Numbers
- `numeric
- `integer`
- `complex`

## Math 
#### built-in math function
- `max()`
- `min()`
- `sqrt()`
- `abs()`
- `ceiling()`
	- 無條件進入
- `floor()`
	- 無條件捨去

## String
單引號跟雙引都可
#### cat
```R
str <- "Lorem ipsum dolor sit amet,
consectetur adipiscing elit,
sed do eiusmod tempor incididunt
ut labore et dolore magna aliqua."
str
print(str)
cat(str)

# [1] "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\nsed do eiusmod tempor incididunt\nut labore et dolore magna aliqua."
# [1] "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit,\nsed do eiusmod tempor incididunt\nut labore et dolore magna aliqua."
# Lorem ipsum dolor sit amet,
# consectetur adipiscing elit,
# sed do eiusmod tempor incididunt
# ut labore et dolore magna aliqua.

```
直接在terminal輸變數名稱或print(變數) 換行都會直接出現escape的 character(?!)
用`cat()`才會出現換行 有點神奇

#### nchar
```R
str <- "Hello world"

nchar(str)
# [1] 12
```
空格escape算兩個character嗎

#### grepl
```R
str <- "Hello World!"

grepl("H", str)
grepl("Hello", str)
grepl("X", str)

# [1] TRUE  
# [1] TRUE  
# [1] FALSE
```
找找字元，回傳bool

## logical
跟python好像差不多 略

## Operater
#### Arithmetic Operators
- \+
- \-
- \*
- /
- ^ exponent
- \%\% modules(remainder)
- %/%(integer divition)
[[Python basic syntax#Operator]]

#### Assignment Operators
```R
my_var <- 3  
  
my_var <<- 3  
  
3 -> my_var  
  
3 ->> my_var  
  
my_var # print my_var
```
變數名還可以寫在右邊嗎

#### Comparison Operater
跟py一樣

#### Logical Operator
- 不懂&& 跟&、|| 跟|的差別
- ! not

#### Miscellaneous Operators
- :
```R
x<-1:10
x
class(x)


# [1]  1  2  3  4  5  6  7  8  9 10
# [1] "integer"
```
類似[[Python basic syntax#range]]的東西
但有一些重要差異(0_0；)
- class是整數
- 包含頭尾

## If...Else
#### if
```R
a <- 33  
b <- 200  
  
if (b > a) {  
 print("b is greater than a")  
}
# [1] "b is greater than a"
```

#### else if
```R
if (b > a) {  
 print("b is greater than a")  
} else if (a == b) {  
 print("a and b are equal")  
} else {  
 print("a is greater than b")  
}
```
python的`elif`

## While loop
#### while
```R
i <- 1
while(i < 6){
print(i)
i <- i + 1
}
# [1] 1  
# [1] 2  
# [1] 3  
# [1] 4  
# [1] 5
```
#### break
```R
i <- 1  
while (i < 6) {  
 print(i)  
 i <- i + 1  
 if (i == 4) {  
 break  
 }  
}
```
python也是break
#### next
```R
i <- 0  
while (i < 6) {  
 i <- i + 1  
 if (i == 3) {  
 next  
 }  
 print(i)  
}
```
python是continue

## For loop
```R
for (x in 1:10){
	print(x)
}
```

## Function
 