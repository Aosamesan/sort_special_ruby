def make_list size
	r = Random.new
	arr = Array.new size
	check = Array.new size

	0.upto(size-1) do |i|
		check[i] = false
	end

	i = 0
	while i < size
		tmp = r.rand(0...size)
		if check[tmp] == false
			check[tmp] = true
			arr[i] = tmp
			i+=1
		end
	end

	return arr
end
