local M = class('InsertionSort', BubbleSort)
InsertionSort = M;

function M:ctor(...)	
	self.serrial = ...;	
	--self.super:ctor(...);
end

function M:sort()
	if #self.serrial <= 1 then return end

	for i = 2 , #self.serrial do
		local temp = self.serrial[i];
		local j = i-1;
		while temp < self.serrial[j] do
			self.serrial[j+1] = self.serrial[j];
			j = j - 1;
			if j <= 1 then
				break;
			end
		end
		self.serrial[j+1] = temp;
	end
		
end

--[[function M:Print()
	local a = '';	
	for _,v in ipairs(self.serrial) do
		a = a .. v.. ', ';
	end	
	print(a)
end--]]