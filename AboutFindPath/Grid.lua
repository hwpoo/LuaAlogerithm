local M = class('Grid')
Grid = M

function M:ctor(...)
	self.hight = nil;
	self.width = nil;
	self.nodeList = {};
end

function M:setSize(w, h)
	self.width = w;
	self.hight = h;
end

function M:setNodeList(w, h)
	self:setSize(w, h)
	for i = 1, w do
		self.nodeList[i] = {}
		for j = 1, h do
			local node = Node.new(i, j);
			self.nodeList[i][j] = node;
		end
	end
end

function M:setWall(x, y)
	self.nodeList[x][y].isWall = true
end

function M:getNode(x, y)
	if next(self.nodeList) == nil then
		return nil;
	end
	
	return self.nodeList[x][y]
end



