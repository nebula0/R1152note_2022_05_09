#python 
#set
https://cloud.tencent.com/developer/article/1705131
### 交集
```python
#方法一:
a=[2,3,4,5]
b=[2,5,8]
tmp = [val for val in a if val in b]
print(tmp)
#[2, 5]

#方法二 比方法一快很多！
print list(set(a).intersection(set(b)))
```
### 聯集
```python
#方法一: 
print(list(set(a+b))) 

#方法二 比方法一快很多！ 
print(list(set(a).union(set(b))))
```
### 差集
```python
#方法一:
tmp = [val for val in b if val not in a] # b中有而a中没有的 
print(tmp)

#方法二 比方法一快很多！
print list(set(b).difference(set(a))) # b中有而a中没有的      非常高效！
```

### 交集聯集差集
```python
s = set([3,5,9,10,20,40])      #创建一个数值集合 
t = set([3,5,9,1,7,29,81])      #创建一个数值集合 

a = t | s          # t 和 s的并集 ,等价于t.union(s)
b = t & s          # t 和 s的交集 ,等价于t.intersection(s) 
c = t - s          # 求差集（项在t中，但不在s中）  ,等价于t.difference(s) 
d = t ^ s          # 对称差集（项在t或s中，但不会同时出现在二者中）,等价于t.symmetric_difference(s)
```