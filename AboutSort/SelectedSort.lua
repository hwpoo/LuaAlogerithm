local M = class('SelectedSort', BubbleSort)
SelectedSort = M;

function M:ctor(...)	
	self.serrial = ...;	
	--self.super:ctor(...);
end

function M:sort()
	if #self.serrial <= 1 then return end

	for i = 1 , #self.serrial do
		local min = self.serrial[i];
		local index = i;
		for j = i+1, #self.serrial do
			if min > self.serrial[j] then
				min = self.serrial[j];
				index = j;
			end
		end
		if min ~= self.serrial[i] then
			self.serrial[i], self.serrial[index] = self.serrial[index], self.serrial[i];
		end
	end
		
end

--[[function M:Print()
	local a = '';	
	for _,v in ipairs(self.serrial) do
		a = a .. v.. ', ';
	end	
	print(a)
end--]]