-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 循环
-- Lua有3种循环方式，while, for, repeat...until
-- break:结束当前循环，开始执行下一条指令。goto:跳到某一个标签指令的地方。return从函数返回一个结果，一个函数自然结束会有一个默认return
--[[

for 初始值, 小于值, 步长（每次加多少，可以省略，默认为1） do
for i = 1, 10, 1 do
end

注意：for后三个表达式只会被计算一次，在循环开始前；局部变量只能在语句块内有效；在循环过程中不能修改局部变量i

]]--


for i = 1, 10, 1 do
    print(i)
end

--[[

范型for循环, ipairs(t)系统函数，对数组遍历，打印数组t的所有值，非数组部分不管，遇到挖坑的nil结束，ipairs()函数的返回值是多个个值
for index, value in ipairs(t) do
end

注意：打印table中的每一对key,value

]]--

t={name="jack", age=20, "hello"}
for index, value in ipairs(t) do
    
end

--[[

范型for循环, pairs(t)系统函数，对字典遍历，局部变量是key,value, pairs()函数的返回值是多个个值
for key, value in pairs(t) do
end

注意：打印table中的每一对key,value

]]--
for key, value in pairs(t) do
    
end


while false do
    print('hello,死循环')
end
 
 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 流程控制
-- Lua认为 false和nil为假， true和非nil为真
if 0 then
     
end
 
if 0 then
 
elseif nil then
 
end
 
 
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 函数
-- 函数是对语句和表达式的抽象，Lua提供了很多内置的函数
-- 函数前可以使用作用域修饰符修饰，如使用local定义局部函数，默认是全局函数
-- 函数返回值可以支持返回多个，多个值用,隔开
-- 函数支持可变参数
-- select('#',...)返回可变参数的长度
-- select(n, ...)返回从起点n开始，到结束位置的所有参数列表
 
--[[
optional_function_scope function function_name( argument1, argument2, argument3..., argumentn)
    function_body
    return result_params_comma_separated
end
 
]]--
 
function max(num1, num2)
    if num1>num2 then
        return true
    else
        return false
    end
end
 
-- 闭包参数
local function add(num1, num2, funcPrint) -- 闭包参数
    res1 = num1+num2
    res2 = num1*num2
    funcPrint(res1,res2)
end
 
add(10,20,function (v1,v2)
    print(v1 .. "--" .. v2)
end)
 
 
s,e = string.find("www.runoob.com", "runoob") -- 多返回值
print(s .. "|" .. e)
 
-- 可变参数
function add1(...)
    local a = 0
    for i, v in ipairs({...}) do  -- {...}变长参数组成的数组
        a = a+v
    end
    return a
end
 
print(add1(20,309,5))
 
function average(...)
    res = 0
    local arg={...}
    for i, v in ipairs(arg) do
        res = res + v
    end
    -- return res/#arg  -- 总和/数组个数
    return res/select("#",...)  -- select("#",...)可以获取可变参数个数
 
end
print("平均值：" .. average(20,80,100))
 
local function pp(fmt, ...) -- 以固定参数开头的可变参数
    return io.write(string.format(fmt,...))
end
pp("%d,%d \n",1,2)
 
 
do  -- 局部作用域
    function foo(...)
        for i = 1, select("#",...) do
            local arg = select(i, ...); -- arg被赋值右边列表的第一个值，其他都丢弃了
            print(arg)
        end
    end
    foo(1,2,3,5)
end