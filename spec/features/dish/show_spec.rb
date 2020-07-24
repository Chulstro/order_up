require 'rails_helper'

RSpec.describe "When i visit a dish's show page" do
  before :each do
    chef_1 = Chef.create(name: "Gordon")
    @dish_1 = chef_1.dishes.create(name: "Panini", description: "A lovely sandwhich")
    @ingredient_1 = @dish_1.ingredients.create(name: "Tomato", calories: 20)
    @ingredient_2 = @dish_1.ingredients.create(name: "Bread", calories: 150)
    @ingredient_3 = @dish_1.ingredients.create(name: "Cheese", calories: 60)

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
