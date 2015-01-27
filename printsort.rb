#encoding:utf-8
require"./sorts"
require"./makelist"
require"./timer"

class PrintRow
	attr_accessor :type
	
	def initialize
		@type = "top"
	end

	def print_top
		@type = "top"
		print_default
		puts
	end

	def print_bottom
		@type = "bottom"
		print_default
		puts
	end

	def print_middle
		@type = "middle"
		print_default
		puts
	end

	def print_strings first_string = nil, second_string = nil, third_string = nil
		puts "│#{'%-20s' % first_string}│#{'%-30s' % second_string}│#{'%-20s' % third_string}│"
	end

	def print_default
		position_case "┌", "└", "├"
		continuous_line "─", 20
		position_case "┬", "┴", "┼"
		continuous_line "─", 30
		position_case "┬", "┴", "┼"
		continuous_line "─", 20
		position_case "┐", "┘", "┤"
	end

	def position_case top_string, btm_string, mid_string
		case @type
			when "top"
				print top_string
			when "bottom"
				print btm_string
			when "middle"
				print mid_string
		end
	end

	def continuous_line str, length
		0.upto(length - 1) do |i|
			print str
		end
	end

	protected :print_default, :position_case, :continuous_line
end

class PrintSorter
	def initialize print_row
		@@sort_names = ["Bubble Sort", "Selection Sort", "Insertion Sort", "Quick Sort", "Merge Sort"]
		@@num_of_sorts = @@sort_names.size
		@print_row = print_row
	end

	def print_sorts size
		@print_row.print_middle
		@print_row.print_strings nil, (Time.now.strftime " Start : %H:%M:%S"), nil
		@print_row.print_middle
		random_list = make_list size
		0.upto(@@num_of_sorts - 1) do |i|
			s_time = Time.now
			case i
				when 0
					bubble_sort (Array.new random_list)
				when 1
					selection_sort (Array.new random_list)
				when 2
					insertion_sort (Array.new random_list)
				when 3
					quick_sort (Array.new random_list)
				when 4
					merge_sort (Array.new random_list)
			end
			e_time = Time.now
			interval_string = get_interval s_time, e_time
			@print_row.print_strings @@sort_names[i], interval_string, size
		end
		@print_row.print_middle
		@print_row.print_strings nil, (Time.now.strftime " End : %H:%M:%S"), nil
		@print_row.print_middle
	end
end
