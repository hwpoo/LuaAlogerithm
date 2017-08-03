local M = class('QuickSort', BubbleSort)
QuickSort = M;

function M:ctor(...)	
	self.serrial = ...;	
	--self.super:ctor(...);
end

function M:sort(left,right)
	if left >= right then
		return;
	end
	local i = left;
	local j = right;
	local key = self.serrial[left];
	while i < j do
		while self.serrial[j]>=key and j > i do
			j = j - 1;
		end
		self.serrial[i] = self.serrial[j];
		while self.serrial[i]<=key and i<j do
			i = i+1;
		end
		self.serrial[j]=self.serrial[i];
	end
	self.serrial[i] = key;
	self:sort(left, i - 1);
	self:sort(i+1, right);		
end

--[[function M:Print()
	local a = '';	
	for _,v in ipairs(self.serrial) do
		a = a .. v.. ', ';
	end	
	print(a)
end--]]