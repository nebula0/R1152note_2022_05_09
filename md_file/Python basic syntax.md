#python
只列出部分，主要是拿來被[[R basic syntax(compair to python)]]引用

## Data Types
#### built-in data types
Text Type:`str`
Numeric Types:`int`, `float`, `complex`

Sequence Types:`list`, `tuple`, `range`

Mapping Type:`dict`

Set Types:`set`, `frozenset`

Boolean Type:`bool`

Binary Types:`bytes`, `bytearray`, `memoryview`

#### setting data type
`x = int(20)`

#### verify data type
`print(type(x))`

## Operator
- \+
- \-
- \*
- \/
- \*\* exponentiation
- \% modulus
- // integer division

## range
```python
x = range(1, 10)
for i in x:
	print(i)
print(type(x))

# 1
# 2
# 3
# 4
# 5
# 6
# 7
# 8
# 9
# <class 'range'>

range(10) 

# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

range(0, 30, 5)
# [0, 5, 10, 15, 20, 25]

range(0, -10, -1)
# [0, -1, -2, -3, -4, -5, -6, -7, -8, -9]
```
class 是'range'
含頭不含尾