local M = class('Queue')

Queue = M
function M:ctor(...)
	self.queue = {}
end

function M:push(obj)
	table.insert(self.queue, obj)
end

function M:pop()
	local obj = self.queue[1]
	table.remove(self.queue, 1)
	return obj	
end

function M:getLength()
	return #self.queue
end

function M:clear()
	self.queue = {}
end

