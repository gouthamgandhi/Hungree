class MakeController < ApplicationController
  def budget
  	@recipes = Recipe.all
  end

  def recipes
  	@recipes = Recipe.all
  end

  def groceries
  end
end
