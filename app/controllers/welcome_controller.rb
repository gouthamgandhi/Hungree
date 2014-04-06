require 'json'
require 'yummly'
class WelcomeController < ApplicationController
  def index
  	@apicalls = Yummly.search('Main Dish',{ maxResult: 2000 })
  end

  # => Collect emails from landing page.
  def collect_email
  	@email = Welcome.new(email: params[:email])
    respond_to do |format|
      if @email.save
        format.html { redirect_to root_path , notice: 'We saved your spot in line, we will let you know when we open shop :)' }
      else
        format.html { redirect_to root_path , notice: 'oops! we werent able to save your email, please try again.' }
      end
    end
  end

  def recipes
  	@apicalls = Yummly.search('Main Dish',{ maxResult: 10 })
  	
  end
end
