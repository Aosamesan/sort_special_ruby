require"./bst"

def is_sorted arr
	last = arr.size - 1

	0.upto(last - 1) do |i|
		if arr[i] > arr[i+1]
			return false
		end
	end

	return true
end

def bubble_sort arr
	size = arr.size

	(size - 1).downto(1) do |i|
		0.upto(i-1) do |j|
			if arr[j] > arr[j+1]
				tmp = arr[j]
				arr[j] = arr[j+1]
				arr[j+1] = tmp
			end
		end
	end

	return is_sorted arr
end

def selection_sort arr
	size = arr.size

	0.upto(size - 2) do |i|
		minIdx = i
		(i+1).upto(size-1) do |j|
			if arr[j] < arr[minIdx]
				minIdx = j
			end
		end

		tmp = arr[minIdx]
		arr[minIdx] = arr[i]
		arr[i] = tmp
	end

	return is_sorted arr
end

def insertion_sort arr
	size = arr.size

	1.upto(size - 1) do |i|
		rem = arr[i]
		j = i - 1
		while j >= 0 && rem < arr[j]
			arr[j+1] = arr[j]
			j -= 1
		end
	end

	return is_sorted arr
end

def quick_sort arr
	size = arr.size

	quick_sort_recursive arr, 0, size-1

	return is_sorted arr
end

def quick_sort_recursive arr, left, right
	if left == right
		return
	end

	left_hold = left
	right_hold = right
	pivot = arr[left]

	while left < right
		while arr[right] >= pivot && left < right
			right -= 1
		end

		if left != right
			arr[left] = arr[right]
			left += 1
		end

		while arr[left] <= pivot && left < right
			left += 1
		end

		if left != right
			arr[right] = arr[left]
			right -= 1
		end
	end

	arr[left] = pivot
	pivot = left
	left = left_hold
	right = right_hold

	if left < pivot
		quick_sort_recursive arr, left, pivot - 1
	end
	if right > pivot
		quick_sort_recursive arr, pivot + 1, right
	end
end

def merge_sort arr
	size = arr.size

	merge_sort_recursive arr, 0, size

	return is_sorted arr
end

def merge_sort_recursive arr, left, right
	if right - left < 2
		return
	end

	if left < right
		mid = (left + right) / 2

		merge_sort_recursive arr, left, mid
		merge_sort_recursive arr, mid, right

		merge arr, left, right
	end
end

def merge arr, left, right
	mid = (left + right) / 2
	tmp_arr = []

	i = left
	j = mid

	while i < mid && j < right
		if arr[i] < arr[j]
			tmp_arr << arr[i]
			i += 1
		else
			tmp_arr << arr[j]
			j += 1
		end
	end

	while i < mid
		tmp_arr << arr[i]
		i += 1
	end

	while j < right
		tmp_arr << arr[j]
		j += 1
	end

	0.upto(tmp_arr.size - 1) do |k|
		arr[left + k] = tmp_arr[k]
	end
end

def bst_sort arr
	tree = BinarySearchTree.new
	push = lambda { |data| arr << data }

	arr.each do |data|
		tree.insert data
	end

	arr.clear
	tree.bst_sort push

	return is_sorted arr
end

def sift_down arr, startIdx, endIdx
	root = startIdx

	while (2 * root) + 1 <= endIdx
		child = 2 * root + 1
		swap = root

		if arr[swap] < arr[child]
			swap = child
		end

		if child < endIdx && arr[swap] < arr[child+1]
			swap = child + 1
		end

		if swap == root
			return
		else
			tmp = arr[root]
			arr[root] = arr[swap]
			arr[swap] = tmp

			root = swap
		end
	end
end

def heapify arr
	startIdx = (arr.size - 2) / 2
	endIdx = arr.size - 1

	while startIdx >= 0
		sift_down arr, startIdx, endIdx
		startIdx -= 1
	end
end

def heap_sort arr
	endIdx = arr.size - 1

	heapify arr

	while endIdx > 0
		tmp = arr[endIdx]
		arr[endIdx] = arr[0]
		arr[0] = tmp

		endIdx -= 1
		sift_down arr, 0, endIdx
	end

	is_sorted arr
end
