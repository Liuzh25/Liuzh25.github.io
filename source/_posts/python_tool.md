---
title: python_tool
categories:
  - [兴趣,编程语言,python]
tags:
  - python
  - note
date: 2021-05-25 21:22:59
password:
top:
---

# 装饰器

<!-- more -->

## 储备知识

1. 可变参数`*args`,`**kwargs`

   ```python
   def wrapper(*args, **kwargs):  # wrapper()<==>index()
       index(*args, **kwargs)
   ```

2. 名称空间与作用域

   名称空间的"嵌套关系"是在函数定义阶段,即检测语法的时候确定的

3. 函数对象

   - 函数可以作为参数传入另外一个函数 
   - 函数的返回值可以是一个函数

4. 函数的嵌套定义

5. 闭包函数



## 装饰器

**装饰器**就是在**不修改**被装饰对象**源代码和调用方式**的前提下为被装饰对象**添加额外的功能**

- "装饰"代指为被装饰对象添加新的功能
- "器"代指器具/工具
- 装饰器与被装饰的对象均可以是任意可调用对象。可调用对象有函数，方法或者类
- 装饰器经常用于有切面需求的场景，比如：插入日志、性能测试、事务处理、缓存、权限校验等应用场景，装饰器是解决这类问题的绝佳设计，
- 有了装饰器，就可以抽离出大量与函数功能本身无关的雷同代码并继续重用。



## 无参装饰器

> ```python
> import time
> 
> def outter(func):  # 装饰器
>      def wrapper(*args, **kwargs为):  # *args, **kwargs为源文件提供可拓展参数
>          start = time.time
>          res = func(*args, **kwargs)  # func提高装饰器重用率
>          stop = time.time
>          return res  # 添加返回值
>  	return wrapper  # 使wrapper能够被全局调用
> 
> @outter # 语法糖 index = outter(index)
> def index(x, y, z):  # 源程序
>      time.sleep(3)
>      print('index %s %s %s' %(x, y, z))
>      return 123
> 
> # def outter(func):  # 装饰器
> #  def wrapper(*args, **kwargs为):  # *args, **kwargs为源文件提供可拓展参数
> #      start = time.time
> #      res = func(*args, **kwargs)  # func提高装饰器重用率
> #      stop = time.time
> #      return res  # 添加返回值
> #  return wrapper  # 使wrapper能够被全局调用
> 
> 
> # index = outter(index)  # 重新赋值index函数,确保函数调用方式不变
> index(1, 2, 3)
> ```

思路:

- 直接在index上改.**改变源代码**
- 创建新函数封装index函数与新功能.**不改变源代码,改变调用方式(降低代码冗余,并为index提供可拓展参数)**
- 将新函数改为闭包函数.**不改变源代码,不改变调用方式(写活闭包函数传入程序)**
- 进一步伪装闭包函数与原函数相同.**(添加返回值)**
- 简化代码.**(为装饰器增加语法糖,将装饰器提到最前面,保证语法糖的引用)**

装饰器在保持与源代码**提供相同功能的基础**上,为源代码**添加了新功能**,提供了**可拓展的参数**,还提升了自身的**重用率**



## 语法糖

- `@name`无括号,等价于`func = name(func)`
- `@name()`有括号,等价于`f1 = name()` => `func = f1(func)`



## 无参装饰器模板

> ```python
> def outter(func):
>  def wrapper(*args, **kwargs):
>      # 1. 调用原函数
>      # 2. 为其增加新功能
>      res = func(*args, **kwargs)
>      return res
>  return wrapper
> 
> @outter
> def func(a, b):
>     pass
> 	return abc
> ```



## 有参装饰器

- 由于语法糖的@的限制,outter函数只能有一个参数,并且该参数只用来接受被装饰对象的内存地址.

- 而wrapper函数的参数由原函数控制,无法改变.
- 因此, 需要第三层嵌套关系来为装饰器增加的功能提供参数

> ```python
> def auth(db_type)
> 	def outter(func):  # 装饰器
>         # 需要参数db_type
>         def wrapper(*args, **kwargs为):  # *args, **kwargs为源文件提供可拓展参数
>             if db_type == "abc"  # 需要参数db_type
>             	pass
>     	return wrapper  # 使wrapper能够被全局调用
>     return outter
> 
> @auth(db_type)  # 等价于@outter
> # @outter # 语法糖 index = outter(index)
> def index(x, y, z):  # 源程序
>     time.sleep(3)
>     print('index %s %s %s' %(x, y, z))
>     return 123
> 
> 
> index(1, 2, 3)
> ```

思路:

-  func=outter(func)  ==>  outter=auth(db_type),func=outter(func)
- @outter  ==>  @auth(db_type)



## 有参装饰器模板

> ```python
> def auth(db_type)
>     def outter(func):
>          def wrapper(*args, **kwargs):
>              # 1. 调用原函数
>              # 2. 为其增加新功能
>              res = func(*args, **kwargs)
>              return res
>          return wrapper
> 	return outter
> 
> 
> @auth(db_type)  # 等价于@outter
> def func(a, b):
>     pass
> 	return abc
> ```



## 总结

1. 开放封闭原则
   - **对扩展是开放的，而对修改是封闭的**
   - 软件包含的所有功能的源代码以及调用方式，都应该避免修改
   - 对于上线后的软件，新需求或者变化又层出不穷，我们必须为程序提供扩展的可能性
   
2. 多个装饰器语法糖,顺序从下往上使用装饰器

3. 为装饰器内嵌函数`wrapper`添加装饰器`wraps`,使函数`wrapper`的属性等于原函数的属性

   ```python
   from functools import wraps  # 引用wraps 
   
   def outter(func):
       @wraps(func)  # 加括号并添加原函数
       def wrapper(*args, **kwargs):
           pass
       # wrapper.__name__ = 原函数.__name__
       # wrapper.__doc__ = 原函数.__doc__
       # ...
       return wrapper
   ```

4. 有参装饰器小知识:

   - 使用语法糖的优势是本来每次调用函数都要在调用前添加一行index=auth(db_type)(index),现在将这行代码放在函数体里

   - 第二层不行是因为要用语法糖,而语法糖有这么个固定语法.第三层其实和语法糖没关系了,它不受语法糖的语法的限制

   - 为什么语法糖参数有限制?我觉得是因为语法糖每个原函数都要写,而装饰器只用写一次.如果有参装饰器用的多,确实语法糖无限制好,但估计是无参装饰器用的多





# 迭代器



## 迭代器

**迭代器**即用来**迭代取值的工具**，而迭代是重复反馈过程的活动，其目的通常是为了逼近所需的目标或结果，每一次**对过程的重复**称为一次“迭代”，而**每一次迭代得到的结果会作为下一次迭代的初始值**,单纯的**重复并不是迭代**,例遍历

通过索引的方式进行迭代取值，实现简单，但仅适用于序列类型：字符串，列表，元组。对于没有索引的字典、集合等非序列类型，必须找到一种**不依赖索引来进行迭代取值的方式**，这就用到了迭代器。



## 可迭代对象(Iterable)

**内置有`__iter__`方法的对象**都是可迭代对象，**字符串、列表、元组、字典、集合、打开的文件**都是可迭代对象

**迭代取值:**

> ```python
> # i = obj.__iter__()
> i = iter(obj)  # i 是迭代器对象(Iterator),print(obj.__iter__().__next__())将只取第一个值
> # print(i.__next__())
> print(next(i))
> print(next(i))
> ```



## 迭代器对象

调用obj.**iter**()方法返回的结果就是一个**迭代器对象(Iterator)**。迭代器对象是内置有**iter**和**next**方法的对象，**打开的文件本身就是一个迭代器对象**，执行**迭代器对象.iter()方法得到的仍然是迭代器本身**，而执行**迭代器.next()方法就会计算出迭代器中的下一个值**。



## 总结

1.  `i` 是**迭代器对象(Iterator)**, `print(obj.__iter__().__next__())`将只取第一个值

2. 调用obj.**iter**()方法返回的结果就是一个**迭代器对象(Iterator)**。执行**迭代器对象.iter()方法得到的仍然是迭代器本身**，而执行**迭代器.next()方法就会计算出迭代器中的下一个值**

3. 当**取完值时再次执行**`next(i)`将抛出`StopIteration`异常

   ```python
   while True:
       try:  # try/except语句用来检测try语句块中的错误，从而让except语句捕获异常信息并处理。
           print(next(i))
       except StopIteration:
           break
   ```

4. **try的工作原理**是，当开始一个try语句后，python就在当前程序的上下文中作标记，这样当异常出现时就可以回到这里，try子句先执行，接下来会发生什么依赖于执行时是否出现异常。
   - 如果当try后的语句执行时**发生异常**，python就**跳回到try并执行第一个匹配该异常的except子句**，异常处理完毕，控制流就通过整个try语句（除非在处理异常时又引发新的异常）。
   - 如果当try后的语句执行时**发生异常**，python却**没有匹配的except子句，异常将被递交到上层的try，或者到程序的最上层（这样将结束程序，并打印默认的出错信息）**。
   - 如果在try子句执行时**没有发生异常**，python将**执行else语句后的语句（如果有else的话）**，然后控制流通过整个try语句。

