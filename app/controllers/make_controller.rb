class MakeController < ApplicationController
  def budget
  end

  def recipes
  	@recipes = Recipe.all
  end

  def groceries
  end
end
