quickSort = {}
local this = quickSort
quickSort.arr = {}
function quickSort.init()
	this.arr = {3, 5, 6, 1, 4, 2}
end
function quickSort.sort(left, right)
	if left >= right then
		return
	end
	local i = left
	local j = right
	local key = this.arr[left]
	while i < j do
		while key <= this.arr[j] and i<j do
			j = j - 1
		end
		this.arr[i] = this.arr[j]
		while key >= this.arr[i] and i<j do
			i = i + 1
		end
		this.arr[j] = this.arr[i]	
	end
	this.arr[i] = key
	quickSort.sort(left, i-1)
	quickSort.sort(i+1, right)
	
end