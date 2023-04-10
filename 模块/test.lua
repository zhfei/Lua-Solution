local m = require("模块.module")

m:foo()
m.foo2()

-- lua模块的加载机制
-- 对应自定义的模块，requier加载要按目录加载。对应加载系统的模块，lua有它自己的加载策略，lua在启动时会从系统的环境变量中把lua环境变量赋值到_G.package.path中，lua从这个路径中查询系统模块。
print(_G.package.path)
