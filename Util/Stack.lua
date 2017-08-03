local M = class('Stack')

Stack = M
function M:ctor(...)
	self.stack = {}
end

function M:push(obj)
	table.insert(self.stack, obj)
end

function M:pop()
	if #self.stack == 0 then
		return nil
	end
	local obj = self.stack[#self.stack]
	table.remove(self.stack, #self.stack)
	return obj	
end

function M:getLength()
	return #self.stack
end

function M:clear()
	self.stack = {}
end