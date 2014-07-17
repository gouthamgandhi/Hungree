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

  desc	'Populate Recipes'
  task hackfit: :environment do
  require 'json'
  file = File.readlines(File.join(Rails.root,'data/hacfit_generated.csv'))
  file.shift
  recipes = {}
  file.each do |line|
  	puts line
  	puts  "=-==="
  	diet, source, recipe, quantity, unit, ingredient, image, price = line.split(',').collect{|t| t.strip if t}
  	if recipes[recipe]
  		recipes[recipe]['ingredient'].push({ingredient: ingredient, price: price})
  		recipes[recipe]['total_cost'] += price.to_f

  	else
  		recipes[recipe] = {
  			"name" => "",
  			'diet' => '',
  			'ingredient' => [],
  			'image' => '',
  			'total_cost' => 0.0
  		}
  		recipes[recipe]["name"] = recipe
  		recipes[recipe]['diet'] = diet
  		recipes[recipe]['source'] = source
  		recipes[recipe]['ingredient'].push({ingredient: ingredient, price: price})
  		recipes[recipe]['image'] = image
  		recipes[recipe]['total_cost'] += price.to_f
  	end

  end
  	puts recipes.count
	recipes.each do |recipe|
		begin
			Recipe.create(
				name: recipe['name'],
				details_dump: recipe['image'],
				diet: recipe['diet'],
				cost: recipe['total_cost'].to_f,
				ingredients: recipe['ingredient'],
				scrap_dump: recipe['source']
			)
		rescue Exception => e
		puts recipe
			
		end

	end

  end

  desc "TODO"
  task recipe: :environment do
  end

end
