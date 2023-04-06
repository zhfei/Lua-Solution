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
-- table表，通过构造表达式来完成，创建一个空表{}, 它是一个关联数组，下标可以是数字，字符串
-- 开始下标是1
-- 长度可变，未初始化为nil
local tb = {}
print(type(tb))

tb2={"hello","world","jack",age="20"}
print(tb2)

key=2
tb2[key]="value"
tb2["key"]="__value"

for k,v in pairs(tb2) do 
    print(k .. "---" .. v)
end


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- thread 线程，在Lua里被称为协程，它和线程的区别是任意时刻只能有一个协程运行，当把它挂起(suspend)时才会暂停
-- 不同协程间可以共享全局变量


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
-- userdata 用户自定义数据，由C/C++创建的一种数据结构，通常是struct和指针存储到lua变量中。


