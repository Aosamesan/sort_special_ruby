def get_interval start_time, end_time
	start_secs = (start_time.strftime "%S%N").to_i
	end_secs = (end_time.strftime "%S%N").to_i
	start_mins = (start_time.strftime "%M").to_i
	end_mins = (end_time.strftime "%M").to_i
	start_hours = (start_time.strftime "%k").to_i
	end_hours = (end_time.strftime "%k").to_i

	start_secs += ((start_mins * 60 * 1000000000) + (start_hours * 3600 * 1000000000))
	end_secs += ((end_mins * 60 * 1000000000) + (end_hours * 3600 * 1000000000))

	interval = end_secs - start_secs

	nanosecond = interval % 1000
	microsecond = (interval / 1000) % 1000
	millisecond = (interval / 1000000) % 1000
	second = (interval / 1000000000).to_i

	return "#{'%8ds' % second} #{'%3.3dms' % millisecond} #{'%3.3dus' % microsecond} #{'%3.3dns' % nanosecond}"
end
