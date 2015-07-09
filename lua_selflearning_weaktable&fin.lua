--weak value 
sprites = {}
setmetatable(sprites,{__mode = "v"}) -- set sprites's metatable
sprites[1]={"sprit1",68,90}
sprites[2]={"sprit2",56,97}
sprites[3]={"sprit3",89,96}
player =sprites[1]
enemy=sprites[2]

collectgarbage()

for k,v in pairs(sprites) do
  print(k,v)
end
------------------------------------
x={}
setmetatable(x,{__mode="k"})
key={}
x[key]=1
key=nil
print(x[key])
collectgarbage()
print(x[key])

key={}
x[key]=2
print(x[key])

