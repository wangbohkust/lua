-- dofile, loadfile, load
dofile("C:\\Users\\wang818\\Desktop\\lua_selflearning_basic.lua")

f= loadfile("C:\\Users\\wang818\\Desktop\\lua_selflearning_basic.lua")
f()

function newDoFile(filename)
  f=assert(loadfile(filename))
  return f()
end
newDoFile("C:\\Users\\wang818\\Desktop\\lua_selflearning_basic.lua")

f=load("print(20)")
f()

x=10
local x=20
g=load("x=x+1;print(x)") --load obtain global x
g()


  