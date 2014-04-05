#!/usr/bin/env ruby

gems = ['trollop','httparty']

begin
	gems.each { |g| require 'g' }	
rescue Exception => e
	puts e
end

f = File.new('scrapper/supermarket.dat','w+')

(12345...99999).each do |item|
	puts item
	response = `httparty "http://www.SupermarketAPI.com/api.asmx/COMMERCIAL_SearchByItemID?APIKEY=APIKEY&ItemId=#{item}&format=json" `
	if response.match(/NOITEM/)
		next
	end
	f.puts response
end

f.close