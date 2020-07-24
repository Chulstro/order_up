require 'rails_helper'

RSpec.describe "When i visit a dish's show page" do
  it "Has a list of ingredients" do
    chef_1 = Chef.create(name: "Gordon")
    dish_1 = chef_1.dishes.create(name: "Panini", description: "A lovely sandwhich")
    ingredient_1 = dish_1.ingredients.create(name: "Tomato")
    ingredient_2 = dish_1.ingredients.create(name: "Bread")
    ingredient_3 = dish_1.ingredients.create(name: "Cheese")

    visit "/dishes/#{dish_1.id}"

    expect(page).to have_content("Gordon")
    expect(page).to have_content(ingredient_1)
    expect(page).to have_content(ingredient_2)
    expect(page).to have_content(ingredient_3)
  end
end
