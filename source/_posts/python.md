---
title: 函数
categories:
  - [兴趣,编程语言,python]
tags:
  - python
  - note
date: 2021-05-19 08:45:07
password:
top: 100
---

# 函数的参数



## 形参与实参

**形参:** 相当于**变量名**,定义的参数

**实参: **相当于**变量值**,传入的值

**赋值: **在调用时,将**实参**的**内存地址**绑定给**形参**

**形参只能在函数体内使用**

**绑定关系只在调用时生效**

**形式: **

```python
func(int("1"), fuc(1,2), a = 1, 2)  # 实参: 值
```



## 参数分类

**位置形参: **直接定义的**变量名**, 必须**传值**

**位置实参: **按**顺序**与形参一一对应

**关键字实参: **按key =value与形参对应

位置实参与关键字实参混用: 1. 位置实参必须放在关键字实参之前;2. 不能重复传值

**默认形参:** 直接定义的变量名并**赋值**,可以不传值, 用于**被多次使用的实参**,一般不推荐**可变类型**(函数的返回值应符合期望,不应受其他代码的影响)

位置形参与默认形参混用: 1. 位置形参必须放在默认形参之前

**可变长度的位置参数: **

1.  `*`**保存溢出的位置实参**为**元组类型**并**赋值**给`*`后面的**可被for循环的数据类型**,规范使用`args`作为变量名,例 **相加**

```python
def sum(*args):  # args = (1, 2, 3, 4, 5)
	res = 0
	for item in args:
		res += item
	print(res)
    
    
sum(1, 2, 3, 4, 5)
```

2. `*`**拆分**`*`后面的**可被for循环的数据类型**为**位置实参**并**赋值**给**溢出的位置形参**,例

```python
def func(x, y, z)
	print(x, y,z)
	
	
l = [1, 2, 3]
func(*l)  # x, y, z = l
```

3. `*`**拆分**`*`后面的**可被for循环的数据类型**为**位置实参**,**保存溢出的位置实参**为**元组类型**并**赋值**给`*`后面的**可被for循环的数据类型**并**赋值**给**溢出的位置形参**,例

**可变长度的关键字参数: **

1. `**`**保存溢出的关键字实参**为**字典类型**并**赋值**给`**`后面的**字典类型**,规范使用`kwargs`作为变量名,例 **用户数据**

2. `**`**拆分**`**`后面的**字典类型**为**关键字实参**并**赋值**给**溢出的默认形参**,例

```python
def func(x, y, z)
	print(x, y,z)
	
	
l = {'x': 1, 'y': 2, 'z': 3}  # 字典`:`
func(*l)  # x, y, z = l.key
func(**l)  # x, y, z = l.value
```



# 总结

1. **python**中**所有的传递**都是**内存地址的传递**,即**引用传递**

2. 默认形参的赋值不使用可变类型,应赋值为None,然后在函数体内定义为可变类型

   ```python
   def dunc(x, y, z, l = None)
   	if l is None:
           l = []
           l.append(x)
           l.append(y)
           l.append(z)
           print(l)
   ```

   
