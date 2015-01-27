require"./makelist"
require"./sorts"
require"./timer"

start = Time.now
arr = make_list 30000
quick_sort arr
endtime = Time.now

puts get_interval start, endtime
