require 'rails_helper'

RSpec.describe "When i visit a dish's show page" do
  before :each do
    chef_1 = Chef.create(name: "Gordon")
    @dish_1 = chef_1.dishes.create(name: "Panini", description: "A lovely sandwhich")
    @ingredient_1 = Ingredient.create(name: "Tomato", calories: 20)
    @ingredient_2 = Ingredient.create(name: "Bread", calories: 150)
    @ingredient_3 = Ingredient.create(name: "Cheese", calories: 60)

    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_1.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_2.id)
    DishIngredient.create(dish_id: @dish_1.id, ingredient_id: @ingredient_3.id)

  end
  it "Has a list of ingredients" do

    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("Gordon")
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
  end

  it "has a calculation of its ingredients total calories" do
    visit "/dishes/#{@dish_1.id}"

    expect(page).to have_content("Calories: 230")
  end
end
