require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
    it {should have_many(:ingredients).through(:dish_ingredients)}

  end

  describe "Methods" do
    it ".calorie_count" do
      chef_1 = Chef.create(name: "Gordon")
      @dish_1 = chef_1.dishes.create(name: "Panini", description: "A lovely sandwhich")
      @ingredient_1 = @dish_1.ingredients.create(name: "Tomato", calories: 20)
      @ingredient_2 = @dish_1.ingredients.create(name: "Bread", calories: 150)
      @ingredient_3 = @dish_1.ingredients.create(name: "Cheese", calories: 60)

      expect(@dish_1.calorie_count).to eq(230)
    end
  end
end
