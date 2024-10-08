# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Create test users
# ------------------------------------------------------------------------
[{
  first_name: "First",
  last_name: "last",
  email: "first@example.com",
  password: "pass123!!"
}].each do |obj|
  user = User.find_or_initialize_by(email: obj[:email])
  user.update(
    first_name: obj[:first_name],
    last_name: obj[:last_name],
    password: obj[:password]
  )
end



# Create test teams
# ------------------------------------------------------------------------
[{
  name: "Power Rangers",
  description: "Kid's superheroes"
}].each do |obj|
  team = Team.find_or_initialize_by(name: obj[:name])
  team.update(
    description: obj[:description]
  )
end
