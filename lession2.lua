-- 基本数据类型

--[[
Lua有8种数据类型： nil, boolean, number, string, function, userdata, thread,  table


    userdata：自定义数据格式
    thread： 协程
    table： 表，字典
]]--

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- nil 表示没有任何值，同时对于全局变量和table具有删除的作用, nil用作比较时需要加""
print(hello)
tb={key1="key11", key2="key22","keykey"}
for k, v in pairs(tb) do 
print(k .. "-" .. v)
end
print("--------------")
tb.key2=nil
for k, v in pairs(tb) do 
print(k .. "-" .. v)
end

print(type(X))
print(type(X)==nil)
print(type(X)=="nil") -- true

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- number 只有一种double的双精度number类型
num=10
num=22.2


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- string 中单引号，双引号,单个字符，多个字符都表示字符串
-- 转义\ \n, \t
-- 表示一块字符串[[]]
-- 数字字符串做算术运算时，lua会转成数字运算 如：“3”+4 = 7
-- 字符串连接使用 ..
-- 字符串长度计算用#， 如：#“hello”  = 5
str='hell'
str='world'
print(str)
str2='ab\nc\td\tfjkl[[ddddd]]'
print(str2)

doc=[[
    <html>
        <head></head>
        <body></body>
    </html>
]]
print(doc)

num = "10"+3
print(num)

print('段落' .. "hhhhh")
str22="何洛洛"
print(#str22)
print(#"hello,world")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- boolean中只有nil和false表示假， 0和''也是真
a=0
if a then
    print('真')
else
    print('假')
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

-- function, 是一等公民，和数字，字符串一样属于基本类型，可以做参数，返回值
-- 可以当匿名函数传递
print(type(print)) -- function

function func1(num)
    if num == 0 then
        return 1
    else
        return num*10
    end
end
print(func1(50))
func2=func1
print(func2(30))

function func3(tab,func)
    for key, value in pairs(tab) do
        print(func(key, value))
    end
end
tab3={name="jack", age=30, "hello", "beijing"}
func3(tab3, function (k,v)
    return k .. "====" .. v
end)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- table表，通过构造表达式来完成，创建一个空表{}, 它可以认为是一个关联数组，下标可以是数字，字符串
-- 开始下标是1
-- 长度可变，未初始化为nil
-- lua也是通过table来解决模块，包，对象的。
-- table表数据存储在堆上，它是一个引用类型。
-- table套table {'age',{}, 'name'}
-- lua文件本身全局作用域也是一个table, 名字叫_G, 在lua中使用的tabel,其实是_G.table，在lua文件中定义的全局变量其实就是_G这个table中的key

local tb = {}
print(type(tb))

tb1={"a","b","c",[5]="f"}  -- 下标是1,2,3的数组, 可以指定下标设置值

tb2 = {name="jack", ['age']=20} -- 下标是name, age的字典。

tb2={"hello","world","jack",age="20"}
print(tb2)

key=2
tb2[key]="value"
tb2["key"]="__value"

for k,v in pairs(tb2) do 
    print(k .. "---" .. v)
end

--[[

数组链接，把tb2的数组域部分进行链接，数组域部分：从1开始直到遇到nil或key-value字典为止，这之间的部分称为数组域
table.concat(tb2)

]]--
print(table.concat(tb2))
print(table.insert(tb2,2,"666"))
print(table.remove(tb2))
table.sort(tb2,function (a,b)
    return a < b
end)

--[[

table嵌套，模仿类

]]--
stu = {}
class = {Class = 1, Grade = 1}
stu.ClassInfo = class
for key, value in pairs(stu) do
    print(key ,value)
end


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- thread 线程，在Lua里被称为协程，它和线程的区别是任意时刻只能有一个协程运行，当把它挂起(suspend)时才会暂停
-- 不同协程间可以共享全局变量


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- userdata 用户自定义数据，由C/C++创建的一种数据结构，通常是struct和指针存储到lua变量中。
-- 专门和lua宿主机打交道的，userdata可以将C数据存放在lua变量中，在lua中通常用作赋值和相等比较。

