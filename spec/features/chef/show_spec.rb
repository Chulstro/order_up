require 'rails_helper'

RSpec.describe "When I visit a chef's show page" do
  before :each do
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

  end

  it "has chef info and a link to it's index page" do

    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@chef_1.name)
    click_on "All Ingredients Used"
    expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
    expect(page).to have_content(@ingredient_1.name, count: 1)
    expect(page).to have_content(@ingredient_2.name, count: 1)
    expect(page).to have_content(@ingredient_3.name, count: 1)
    expect(page).to have_content(@ingredient_4.name, count: 1)

  end

  xit "shows the three most popular ingredients" do
    visit "/chefs/#{@chef_1.id}"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_3.name)
    expect(page).to_not have_content(@ingredient_4.name)
  end
end
