#python #pandas 
https://pandas.pydata.org/docs/user_guide/indexing.html
有有很多很多方式 下面主要寫`loc`，需要會再補充
## .loc
- primary **label based**
- 裡面可放
- - Series `s.loc[indexer]`
- DataFrame `df.loc[row_indexer,column_indexer]`
- example 只抓出indexing的部分 看不懂在去[網站](https://pandas.pydata.org/docs/user_guide/indexing.html#indexing-label)上看
普通index
```python

s1.loc['c':] = 0 # 一個series，c以後的變0

df1.loc[['a', 'b', 'd'], :]

df1.loc['a'] > 0

df1.loc[:, df1.loc['a'] > 0]
```
mask
```python
mask = pd.array([True, False, True, False, pd.NA, False], dtype="boolean")

In [52]: mask
Out[52]: 
<BooleanArray>
[True, False, True, False, <NA>, False]
Length: 6, dtype: boolean

In [53]: df1[mask]
Out[53]: 
 A         B         C         D
a  0.132003 -0.827317 -0.076467 -1.187678
c  1.024180  0.569605  0.875906 -2.211372

```
抓抓一個值
```
# this is also equivalent to ``df1.at['a','A']``
In [54]: df1.loc['a', 'A']
Out[54]: 0.13200317033032932
```
function
```python
df1['A'].loc[lambda s: s > 0]
```
## .iloc
- primary position based
-  略

## []
略

