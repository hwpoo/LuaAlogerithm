local M = class('AstarMine')
AstarMine = M

function M:ctor(...)	
	self.openList = {};
	self.closeList = {};
	self.grid = {}
	self.startNode = {}
	self.endNode = {}
	self.direction = {}
end

function M:init()
	self:initGridMap(10,10)
	self:initGridWall()
	self:initStartNode(2,7)
	self:initEndNode(7,7)
	self:initDirectionNode()
	local t = self:findPath() or {}
	return t
end

function M:initGridMap(w, h)
	self.grid = Grid.new();
	self.grid:setNodeList(w, h)	
end

function M:initGridWall()
	if next(self.grid) == nil then return end	
	self.grid:setWall(5, 5)
	self.grid:setWall(5, 6)
	self.grid:setWall(5, 7)
	self.grid:setWall(5, 8)
	self.grid:setWall(5, 9)
end

function M:initStartNode(x,y)
	self.startNode = self.grid:getNode(x, y)
end

function M:initEndNode(x,y)
	self.endNode = self.grid:getNode(x, y)
end

function M:initDirectionNode()
	local d1 = {-1,0} ---左
	local d2 = {0,1} --上
	local d3 = {1,0} --右
	local d4 = {0,-1} --下
	local d5 = {1,1}  --右上
	local d6 = {-1,1}  --左上
	local d7 = {-1,-1}  --左下
	local d8 = {1,-1}  --右下
	table.insert(self.direction, d1)
	table.insert(self.direction, d2)
	table.insert(self.direction, d3)
	table.insert(self.direction, d4)
	table.insert(self.direction, d5)
	table.insert(self.direction, d6)
	table.insert(self.direction, d7)
	table.insert(self.direction, d8)
end
function M:findPath()
	table.insert(self.openList, self.startNode)
	
	while #self.openList > 0 do
		local currentNode = self.openList[1];
		table.remove(self.openList, 1);
		table.insert(self.closeList, currentNode);
		
		if currentNode:isSameNode(self.endNode) then
			print('找到最短路径')
			return self:makePath(self.endNode)
		else		
			local nextNodes = self:getNextNode(currentNode)
			for _, v in ipairs(nextNodes) do
				if not v.isWall and not self:isExistInList(v, self.openList) and not self:isExistInList(v, self.closeList) then
					v:setParent(currentNode)
					v.g = self:get_G_Vale(currentNode, v) 
					v.h = self:get_H_Value(v, self.endNode)
					v.f = v.g + v.h	
					table.insert(self.openList, v)
				end			
			end
		end
		table.sort(self.openList, function (a, b)
			return a.f < b.f;
		end)
		--self:sort(self.openList)
	end
	print('找不到最短路径')
	return nil
		
end


function M:getNextNode(p)
	local nextNodes = {}
	for _,v in ipairs(self.direction) do
		local offset = v;
		local _x = p.x + offset[1]
		local _y = p.y + offset[2]	
		if _x <= self.grid.width and _y <= self.grid.hight and _x >= 1 and _y >= 1 then
			local nextpoint = self.grid:getNode(_x, _y)	
			table.insert(nextNodes, nextpoint)
		end
	end
	
	return nextNodes;
end

function M:get_G_Vale(p, q)
	local temple = math.abs(q.x - p.x) + math.abs(q.y - p.y)
	if temp == 2 then
		return p.g + 14
	else
		return p.g + 10
	end
end

function M:get_H_Value(p, endPos)
	return (math.abs(endPos.x - p.x) + math.abs(endPos.y - p.y))
end

function M:isExistInList(p, arr)
	for _, v in ipairs(arr) do
		if v:isSameNode(p) then
			return true;
		end
	end
	return false;
end

function M:makePath(p)
	local path = {}
	local point = p
	while point.parent ~= nil do	
		table.insert(path, point)
		point = point.parent
	end
	table.insert(path, point)
	return path;
end

function M:sort(arr)
	if #arr <= 1 then return end

	for i = 2 , #arr do
		local temp = arr[i];
		local j = i-1;
		while temp.f < arr[j].f do
			arr[j+1].f = arr[j].f;
			j = j - 1;
			if j <= 1 then
				break;
			end
		end
		arr[j+1] = temp;
	end
end