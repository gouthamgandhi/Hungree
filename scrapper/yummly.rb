#!/usr/bin/env ruby

gems = ['trollop','yummly']

#load '/Users/nadendla/Dropbox/hackfit2014/Hungree/models/recipe.rb'

begin
	gems.each { |g| require g }
rescue Exception => e
	puts e
end

Yummly.configure do |config|
  config.app_id = "7c1fe22f"
  config.app_key = "3a1f3a9d6a9d6e43a7089809d8b035e0"
  #config.use_ssl = true # Default is false
end

big_dump = []

f = File.new('/Users/nadendla/Dropbox/hackfit2014/Hungree/data/recipe_dump.json','w+')

non_veg = Yummly.search('', { 'maxResult' => 50 })
non_veg.each do |recipe|
	puts recipe.id
	r = {
		name: recipe.id,
		details_dump: Yummly.find("#{recipe.id}").json,
		diet: 'Non-Vegetarian',
		scrap_dump: recipe.json
	}
	big_dump.push(r)
end

vegetarian = Yummly.search('', { 'allowedDiet' => "387^Lacto-ovo%20vegetarian", 'maxResult' => 50 })
vegetarian.each do |recipe|
	puts recipe.name
	r = {
		name: recipe.id,
		details_dump: Yummly.find("#{recipe.id}").json,
		diet: 'Lacto-ovo-Vegetarian',
		scrap_dump: recipe.json
	}
	big_dump.push(r)
end

vegan = Yummly.search('', { 'allowedDiet' => "386^Vegan", 'maxResult' => 50 })
vegan.each do |recipe|
	puts recipe.recipe_name
	r = {
		name: recipe.id,
		details_dump: Yummly.find("#{recipe.id}").json,
		diet: 'Vegan',
		scrap_dump: recipe.json
	}
	big_dump.push(r)	
end

pescetarian = Yummly.search('', { 'allowedDiet' => "390^Pescetarian", 'maxResult' => 50 })
pescetarian.each do |recipe|
	puts recipe.id
	r = {
		name: recipe.id,
		details_dump: Yummly.find("#{recipe.id}").json,
		diet: 'Pescetarian',
		scrap_dump: recipe.json
	}
	big_dump.push(r)	

end

gluten_free = Yummly.search('', { 'allowedDiet' => "393^Gluten-Free", 'maxResult' => 50 })
gluten_free.each do |recipe|
	puts recipe.id
	r = {
		name: recipe.id,
		details_dump: Yummly.find("#{recipe.id}").json,
		diet: 'Gluten-Free',
		scrap_dump: recipe.json
	}
	big_dump.push(r)	

end

f.puts JSON.pretty_generate(big_dump)
f.close
#Yummly.find("#{recipe_id}")