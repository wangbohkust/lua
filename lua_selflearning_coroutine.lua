co=coroutine.create(function()
    for i=1,5 do
      print(i)
      print(coroutine.status(co))
      coroutine.yield()
    end
end)
print(coroutine.status(co))
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
coroutine.resume(co)
print(coroutine.status(co))
print(coroutine.resume(co)) --dead coroutine

--global env tables
a=10
b="h2llo"
c=true
for key,value in pairs(_G) do -- global table
  print(key,value)
end

_G["a"]=20
io.write("Enter the variable name:")
index=io.read()
f=loadstring("return ".. index) --expensive function
print(f())
print(_G[index])

local _ENV=
  function()
  setmetatable(_ENV._G,{__index = function(_,n)
        error(n.." is not valid")
      end})
  print(_ENV.asdf)
end

x=10
local y=20 --not in _ENV table
for k,v in pairs(_ENV) do
  print(k,v)
end


