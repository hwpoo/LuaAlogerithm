local M = class('Node')
Node = M;

function M:ctor(...)
	self.x, self.y = ...
	self.parent = nil;
	self.g = 0;
	self.h = 0;
	self.f = 0;
	self.isWall = false;
end

function M:setParent(node)
	self.parent = node;
end

function M:isSameNode(node)
	return self.x == node.x and self.y == node.y
end
