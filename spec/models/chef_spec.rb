require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe "methods" do
    xit ".ingredients" do
      @chef_1 = Chef.create(name: "Gordon")
      dish_1 = @chef_1.dishes.create(name: "Panini", description: "A lovely sandwhich")
      dish_2 = @chef_1.dishes.create(name: "Spaghetti", description: "Italian glory through and through")
      dish_3 = @chef_1.dishes.create(name: "Salad", description: "Crunchy")
      @ingredient_1 = Ingredient.create(name: "Tomato", calories: 20)
      @ingredient_2 = Ingredient.create(name: "Bread", calories: 150)
      @ingredient_3 = Ingredient.create(name: "Cheese", calories: 60)
      @ingredient_4 = Ingredient.create(name: "Noodles", calories: 200)
      @ingredient_5 = Ingredient.create(name: "Lettuce", calories: 20)

      DishIngredient.create(dish_id: dish_1.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: @ingredient_2.id)
      DishIngredient.create(dish_id: dish_1.id, ingredient_id: @ingredient_3.id)
      DishIngredient.create(dish_id: dish_2.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create(dish_id: dish_2.id, ingredient_id: @ingredient_3.id)
      DishIngredient.create(dish_id: dish_2.id, ingredient_id: @ingredient_4.id)
      DishIngredient.create(dish_id: dish_3.id, ingredient_id: @ingredient_2.id)
      DishIngredient.create(dish_id: dish_3.id, ingredient_id: @ingredient_1.id)
      DishIngredient.create(dish_id: dish_3.id, ingredient_id: @ingredient_5.id)

      ingredients = [@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4, @ingredient_5]
      binding.pry
      expect(@chef_1.ingredients).to eq(ingredients)
    end
  end
end
