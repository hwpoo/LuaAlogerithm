local M = class('BubbleSort')
BubbleSort = M;

function M:ctor(...)	
	self.serrial = ...;
end

function M:sort()
	if #self.serrial <= 1 then return end
	
	for i = 1, #(self.serrial) do
		for j = 1, #self.serrial-i do
			
			if self.serrial[j] > self.serrial[j+1] then
				
				self.serrial[j], self.serrial[j+1] = self.serrial[j+1], self.serrial[j];
				
			end
			
		end		
	end
	

end

function M:Print()
	local a = '';	
	for _,v in ipairs(self.serrial) do
		a = a .. v.. ', ';
	end	
	print(a)
end