#!/usr/bin/env ruby

file = File.readlines(File.open('/Users/nadendla/Dropbox/hackfit2014/Hungree/data/ingredientsPrice.txt'))

file.each do |line|
	name_quantity = line.split(",")[0]
	name = name_quantity.split(" - ").first
	quantity = name_quantity.split(' - ').last
	category = line.split(",")[1]
	price = line.split(',').last

	puts "-----------------"
	puts "name 		= #{name}" 
	puts "quantity  = #{quantity}"
	puts "category  = #{category}"
	puts "price     = #{price.to_f}"	
end