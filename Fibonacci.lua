Fibonacci = class('Fibonacci')

function Fibonacci:ctor (...)
	self.curData = 1;
end
function Fibonacci:show(n)
	if n == 1 or n == 2 then
		return 1;
	else
		self.curData = self:show(n-1) + self:show(n-2);
		return self.curData;
	end
end
