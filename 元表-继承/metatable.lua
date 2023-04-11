table_a = {name="jack"}

table_b = {}

table_c = {__index = table_a}

-- 使用元表模拟继承
-- 先访问table_b中的name， 当table_b中没有这个key时，那么lua就会去他的元表中寻找__index键，如果__index包含一个表格，Lua会从这个表格中查找相应的键。

-- 设置元表时，如果__table_c这个key已经存在，那么就会设置失败。
table_d = setmetatable(table_b, table_c)
table_meta_b = getmetatable(table_b)

print(table_d.name)


-- 如果__index包含一个函数的话，lua就会调用这个函数，table和键会作为参数传递给函数。
mytable = setmetatable({key1 = "value1"}, {__index = function (table, key)
    if key == "key2" then
        return "metatable value"
    else
        return nil
    end
end})