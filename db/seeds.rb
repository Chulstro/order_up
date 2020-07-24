# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
chef_1 = Chef.create(name: "Gordon")
dish_1 = chef_1.dishes.create(name: "Panini", description: "A lovely sandwhich")
dish_2 = chef_1.dishes.create(name: "Spaghetti", description: "Italian glory through and through")
ingredient_1 = Ingredient.create(name: "Tomato", calories: 20)
ingredient_2 = Ingredient.create(name: "Bread", calories: 150)
ingredient_3 = Ingredient.create(name: "Cheese", calories: 60)
ingredient_4 = Ingredient.create(name: "Noodles", calories: 200)

DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
DishIngredient.create(dish_id: dish_1.id, ingredient_id: ingredient_3.id)
DishIngredient.create(dish_id: dish_2.id, ingredient_id: ingredient_1.id)
DishIngredient.create(dish_id: dish_2.id, ingredient_id: ingredient_4.id)
