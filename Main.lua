require 'common'

--汉诺塔问题测试
--[[Hano.hano(2, 'A', 'B', 'C');

print('总共移动了'..Hano.count..'次盘子');--]]

--范比尼数列测试
--[[local instance = Fibonacci.new();
for i = 1, 20 do
	print('Fibonacci 数列 ：'..instance:show(i));
end--]]

----选择排序法测试
--[[local serrial = {1, 3, 5, 2, 4, 5, 10, 6, 99, 32, 21};
local instance = QuickSort.new(serrial);
instance:Print();
instance:sort(1, #serrial);
instance:Print();--]]

--[[local serrial = {1, 3, 5, 2, 4, 5, 10, 6, 99, 32, 21};
local instance = BiSearch.new(serrial);
instance:search(5);--]]

--[[local prop = {
x = 10;
y = 10;
barrageList = {{x=3,y=5}, {x=3,y=6},{x=3,y=8},{x=3,y=9},{x=3,y=7}};
startPos = {x = 2, y = 7};
endPos = {x=4, y=7};
}

local aStar = AStarFindRoute.new();
local path = aStar:init(prop);
print('path = '..#path);

print('AStarFindPath is :');
for _,v in ipairs(path) do
	print('x = '..v.x..' y = '..v.y);
end--]]


--[[local aStar = AstarMine.new();
local path = aStar:init();
print('path = '..#path);

print('AstarMine is :');
for _,v in ipairs(path) do
	print('x = '..v.x..' y = '..v.y);
end--]]

--[[quickSort.init()
quickSort.sort(1, #quickSort.arr)
print('#quickSort.arr = '..#quickSort.arr)
for _,v in ipairs(quickSort.arr) do
	print('<color=red>'..v..'</color>');
end
--]]

local bfsInstance = BFS.new()
bfsInstance:init()
bfsInstance:bfs()