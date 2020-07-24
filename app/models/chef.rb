class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def ingredients
    Ingredient.joins(dishes: :chef).distinct
  end

  def pop_ingredients
    Ingredient.joins(dishes: :chef).reorder(:dishes).distinct.limit(3)
  end
end
