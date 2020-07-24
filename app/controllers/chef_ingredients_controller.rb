class ChefIngredientsController < ApplicationController
  def index
    @chef = Chef.find(params[:chef_id])
    binding.pry
  end
end
