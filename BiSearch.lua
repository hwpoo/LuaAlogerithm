local M = class('BiSearch');
BiSearch = M;

function M:ctor(...)
	self.serrial = ...;
	
end

function M:search(n)
	local instance = QuickSort.new(self.serrial);
	instance:Print();
	instance:sort(1, #self.serrial);
	instance:Print();
	print('需要查找的目标数是：'..n);
	local low = 1;
	local high = #self.serrial;
	local mid = nil;
	while low <= high do
		mid = math.ceil((low+high)/2);
		if self.serrial[mid] > n then
			high = mid-1;
		elseif self.serrial[mid] < n  then
			low = mid+1;
		elseif self.serrial[mid] == n then
			print('查找的目标在第'..mid..'个位置');
			break;
		end
	end
	
	if self.serrial[mid] ~= n then
		
		print('找不到该目标');
	end
end