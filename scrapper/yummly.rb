#!/usr/bin/env ruby

gems = ['trollop','yummly']
begin
	gems.each { |g| require g }
rescue Exception => e
	puts e
end