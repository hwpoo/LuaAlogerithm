local M = {};
Hano = M;
M.count = 0;
local this = M;
function M.move(n, A, C)
	this.count	= this.count + 1;
	print('��'..this.count..'���ƶ����� from '..A..' to '..C)	
end

function M.hano(n, A, B, C)
	if n == 1 then
		this.move(n, A, C)
	else
		this.hano(n-1, A, C, B);
		this.move(n, A, C);
		this.hano(n-1, B, A, C);
	end	
end




