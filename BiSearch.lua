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
	print('��Ҫ���ҵ�Ŀ�����ǣ�'..n);
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
			print('���ҵ�Ŀ���ڵ�'..mid..'��λ��');
			break;
		end
	end
	
	if self.serrial[mid] ~= n then
		
		print('�Ҳ�����Ŀ��');
	end
end