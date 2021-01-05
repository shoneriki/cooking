require 'open-uri'
require 'json'

puts "Clearing out Dish list and portions list"
Dish.destroy_all
puts "Clearing out Ingredients now"
Ingredient.destroy_all

url = "https://www.themealdb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
result = JSON.parse(json)

puts "Creating ingredients?"

result["meals"].each do |meal|
  Ingredient.create(name: meal["strIngredient"])
end

puts "Great! Finished creating #{Ingredient.count} ingredients!"

puts "Creating Grilled Salmon recipe"

@gs = Dish.create!(
  name: 'Grilled Salmon'
)
file = URI.open("https://www.foodiecrush.com/wp-content/uploads/2019/05/Grilled-Salmon-foodiecrush.com-023.jpg")
@gs.photo.attach(io: file, filename: 'gs.jpg', content_type: 'image/jpg')

Portion.create!(
  description: "1 1/2 pound",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Salmon")
)

Portion.create!(
  description: "Preferred Serving Of",
  dish: @gs,
  ingredient: Ingredient.new(name: "Lemon Pepper")
)

Portion.create!(
  description: "Preferred Serving Of",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Garlic Powder")
)

Portion.create!(
  description: "Preferred Serving Of",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Salt")
)

Portion.create!(
  description: "1/3 Cup",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Soy Sauce")
)

Portion.create!(
  description: "1/3 Cup",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Brown Sugar")
)

Portion.create!(
  description: "1/3 Cup",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Water")
)

Portion.create!(
  description: "1/4 Cup",
  dish: @gs,
  ingredient: Ingredient.find_by(name: "Vegetable Oil")
)

puts "Finished Grilled Salmon Recipe"

puts "Great! Finished creating #{Dish.count} recipes and #{Ingredient.count} ingredients"
