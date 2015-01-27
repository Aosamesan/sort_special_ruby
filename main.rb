require"./printsort"

pr = PrintRow.new
ps = PrintSorter.new pr 

# the number of tests
num_of_test = gets.to_i
size_list = []

0.upto(num_of_test - 1) do |i|
	size = gets.to_i
	size_list << size
end

pr.print_top
pr.print_strings "  Sort Name", "  Time Interval", "  Size"
size_list.each do |sz|
	ps.print_sorts sz
end
pr.print_bottom
