--variable: number, string, boolean, table, function, thread, userdata,nil
xy1_2=10
xy1_2=10.3
xy1_2=10e5
xy1_2=0xFAE

xy1_3="Hello 1234 *^ \n \""
xy1_3="hello".."world"
print(xy1_3)

xy1_4=true
xy1_4=false

xy1_5=nil
print(xy1_1)

t={1,"hello",true}
print(#t)
print(t[3])
t={first=1,second="hello",third=true,13,14}
print(t[1])
print(t["third"])
print(t.second)

function f()
    print("funciton f called")
end
g=function()
  print("funciton g called")
end
f()
g()
--------------------------------------------------
function println(value)
  print(value)
  return value
end
returnValue=println("hello")
print(returnValue)
--------------------------------------------------
function h()
  local localx=10
  globaly=5
end
h()
print(localx)
print(globaly)


print(type("string"))

--operator precedence: (), a^b, not a, #a, -a, a*b, a/b, a %b, a+b, a-b, a..b, a<b, a~=b, a and b, a or b
a=10 
b=20
print(a and b)
print(a or b)

if not(10>5) then 
 print("10>5")
elseif 20>15 then 
 print("20>15")
else
 print("all false")
end


--loop start,end,increment
iter =0
while iter<=3 do
  print(iter)
  iter=iter+1
end

for i=0,3,2 do
  print(i)
  if(i==1) then break end
end

iter=0
repeat 
  print(iter)
  iter=iter+1
until iter==3

t={one=1,two=2,three=3}
for key,value in pairs(t) do
print(key,value)
end

t={1,nil,3}
for key,value in ipairs(t) do --ipairs stop when it meet nil
print(key,value)
end

-- memory management
x={10,20,30}
y=x
x[2]=40
print(y[2])
x=nil
y=nil

-- advanced function and closure
f= function()
 return "hello"
end
print(f)
g=f
print(g)
------------------------------------------
function f(g)
  return g()
end
function hello()
  print("hello function")
end
f(hello)
f(function() print("anonymous function") end)
-------------------------------------------
function f()
  local x=1
  return function() print(x) end
end
hellofunction =f()
hellofunction()
--------------------------------------------
function createIter()
  local i=0
  return function() print(i) i=i+1 end
end
iter =createIter()
iter()
iter()
iter()
iter()

--advanced table
Player={
  x=0,
  y=0,
  name="",
  new=function()
    p={}
    
    for k,v in pairs(Player) do
      p[k]=v
    end
    
    return p
  end,
  move=function(p,newx,newy)
    p.x=p.x+newx
    p.y=p.y+newy
  end
}

p1=Player.new()
p1.x=10
p1.y=20
p1.name="Bob"
print(p1.x,p1.y,p1.name)
p1.move(p1,10,10)
print(p1.x,p1.y,p1.name)
----------------------------------------
Vector2 = {
  x=0,
  y=0,
  mt={},
  New = function()
    local vec={}
    setmetatable(vec,Vector2.mt) -- set same metatable for all initilization to implement class operation
    vec.x=Vector2.x
    vec.y=Vector2.y
    vec.mt=Vector2.mt   
    vec.Translate=Vector2.Translate
    return vec
  end,
  Translate=function(self,dx,dy) --self is default
    self.x=self.x+dx
    self.y=self.y+dy
  end
}
------------------------------------------
--class operation __mul,__div,__mod 
--relation operator __eq,__lt,__le,__gt,__ge
--__tostring,__metatable
Vector2.mt.__add=function(v1,v2)
  local vec=Vector2.New()
  vec.x=v1.x+v2.x
  vec.y=v1.y+v2.y
  return vec
end
Vector2.mt.__sub=function(v1,v2)
  local vec=Vector2.New()
  vec.x=v1.x-v2.x
  vec.y=v1.y-v2.y
  return vec
end
Vector2.mt.__metatable ="Private" --set class metatable unchangeable
Vector2.mt.__index=Vector2 --called when value doesn't exist
Vector2.mt.__newindex=function(t,k,v)
  error("cannot change values of Vector instance.")
end

v1 =Vector2.New()
v1.x=10
v1.y=20
v1:Translate(10,10)
print(v1.x,v1.y)
v2 =Vector2.New()
v2.x=20
v2.y=40
v3 = v1+v2
v4=v1-v2
print(v3.x,v3.y)
print(v4.x,v4.y)
print(getmetatable(v4))




















