  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Skill.destroy_all
# Category.destroy_all

category_names = ["Housekeeping", "Cooking", "Massage", "Haircut", "Moving", "Painting"]
categories_data = []
category_names.each do |category|
  categories_data << {
    name: category.downcase.gsub(" ", "-"),
    proper_name: category,
    image: "#{category.downcase.delete(' ')}_category.png",
    description: "Lovely category"
  }
end   
categories = Category.create(categories_data)

skills_data = []
8.times do
  skills_data << {
    name: "Skills review",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nunc nisl, lacinia sit amet fringilla ac, posuere quis dui. Sed vel fermentum orci. Aenean a turpis quam. Ut turpis magna, lobortis a purus in, cursus tempus elit. Sed dignissim laoreet sagittis. Quisque nec ornare neque. Sed sed metus sollicitudin elit congue placerat et vel enim. In vitae arcu a purus hendrerit condimentu",
    cost: 88,
    category_id: 55,
    user_id: 16
  }
end
Skill.create(skills_data)
