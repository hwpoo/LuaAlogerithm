local M = class('DFS')

DFS = M

local node = function (x, y)
	local p = {}
	p.x = x
	p.y = y
	p.value = 0
	p.last = nil
	return p
end

local MAP = function (m, n)
	local map = {}
	for i = 1, m do
		map[i] = {}
		for j = 1, n do
			map[i][j] = node(i, j)
		end
	end
	return map
end

local arr = {{0,1,1,1,0,1,1,1}, {1,0,1,0,1,0,1,0}, {0,1,0,0,1,1,1,1}, {0,1,1,1,0,0,1,1}, {1,0,0,1,1,0,0,0}, {0,1,1,0,0,1,1,0}}
local moveDir = {{0,1},{0,-1},{-1,0},{1,0},{1,1},{-1,1},{-1,-1},{1,-1}}
local CheckInSet = function (node, set)
	for _,v in ipairs(set) do
		if node.x == v.x and node.y == v.y then
			return true
		end
	end
	return false
end
function M:ctor(...)   
    self.stack = {}
    self.visitSet = {}
	self.map = {}
	self.startPoint = {}
	self.endPoint = {}
	self.flag = 0  --标记是否找打路径
	
end 

function M:init()
    self.stack = Stack.new()
	self.map = MAP(6,8)
	for i = 1, 6 do
		for j = 1, 8 do
			self.map[i][j].value = arr[i][j]
		end
	end
	self.startPoint = self.map[1][1]
	self.endPoint = self.map[6][8]
	self:dfs()
end


function M:dfs()	
	self.stack:push(self.startPoint)
	table.insert(self.visitSet, self.startPoint)	

	while self.stack:getLength() > 0 do
		local curNode = self.stack:pop()
		if curNode.x == self.endPoint.x and curNode.y == self.endPoint.y  then
			print('Yes')
			self:makePath(curNode)
			return
		end
		
		for _,v in ipairs(moveDir) do
			local _x = curNode.x+v[1]
			local _y = curNode.y+v[2]
			if _x >= 1 and _x <= 6 and _y >= 1 and _y <= 8 then					
				local _node = self.map[_x][_y]
				if _node.value ~= 1 and not CheckInSet(_node, self.visitSet) then									
					_node.last = curNode
					self.stack:push(_node)
					table.insert(self.visitSet, _node)														
				end
			end
		end
	
	end
	
	
end

function M:makePath(point)
	local p = point
	local path = {}
	while p.last ~= nil do
		table.insert(path, p)
		p = p.last
	end
	table.insert(path, p)	
	for _,v in ipairs(path) do
		print('('..v.x..','..v.y..')')
	end
		
end