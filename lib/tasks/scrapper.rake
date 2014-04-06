namespace :scrapper do
  desc "Load recipe data"
  task yummly: :environment do
  require 'json'
  
  #json = JSON.parse(File.join(Rails.root,'data/recipe_dump.json'),:quirks_mode => true)

  file = File.open(File.join(Rails.root,'data/recipe_dump.json'))
	contents = ""
	file.each { |line| contents << line }

   json = JSON.parse(contents,:quirks_mode => true)

   json.each do |recipe|

  	Recipe.create(
		name: recipe['name'],
		details_dump: recipe['name']['details_dump'],
		diet: recipe['diet'],
		ingredients: recipe['details_dump']["ingredientLines"],
		scrap_dump: recipe['name']['scrap_dump']
		)
 	end
	
  end

  desc "TODO"
  task ingredients: :environment do
  end

  desc "TODO"
  task recipe: :environment do
  end

end
