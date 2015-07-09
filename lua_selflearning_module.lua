--module 
io.write("hello")
input=require("io") --set different name
input.write("hello")
io.read()

-- in module file
M={}
function M.count()
  for i=0,10 do
    print(i)
    end
end

function M.print()
  print("hello")
end

M.ten=10

M=require("module")
M.count()
M.print()
print(M.ten)