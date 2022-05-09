#python 
[Python 工具箱 (1) - 專案必備 Pipenv](https://medium.com/citycoddee/python-%E5%B7%A5%E5%85%B7%E7%AE%B1-1-%E5%B0%88%E6%A1%88%E5%BF%85%E5%82%99-pipenv-a517e292f6c)
這篇好

[EY＊研究院](https://dotblogs.com.tw/Eyelash/2021/02/02/153519)


[Python 工具箱 (1) - 專案必備 Pipenv](https://medium.com/citycoddee/python-%E5%B7%A5%E5%85%B7%E7%AE%B1-1-%E5%B0%88%E6%A1%88%E5%BF%85%E5%82%99-pipenv-a517e292f6c)

  

## pipenv

  

建立特定版本的虛擬環境

  

```python

pipenv install --python 3.6.5

```

  

```python

pipenv --three

```

  

找不到就貼路徑

  

```python

pipenv --python /usr/local/opt/python@3.8/bin/python3

```

  

建立完之後會出現pipfile跟piplock(為什麼我沒有piplock)，虛擬環境會另外放在很奇怪的地方他會跟你講 記得選擇直譯器(?

  

以我的電腦而言是在`C:\Users\USER\.virtualenvs`

  

載套件

  

```python

pipenv install <package name>

```

  

進入環境

  

```python

pipenv shell

```

#python
