
module = {}

module.constant = "定义一个模块常量"

function module:foo()
    print("模块中的函数" .. self.constant)
end

local function goo()
    print("模块中的私有方法：" .. "goo")
end

function module.foo2()
    print("foo2" .. module.constant)
end


return module

