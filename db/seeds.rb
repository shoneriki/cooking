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
