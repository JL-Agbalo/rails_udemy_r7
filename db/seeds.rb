# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Offshoreemployee.destroy_all
Country.destroy_all
State.destroy_all
City.destroy_all

# Create Countries
countries = Country.create([
  { name: 'USA' },
  { name: 'Canada' },
  { name: 'UK' },
  { name: 'Germany' },
  { name: 'India' },
  { name: 'Australia' }
])

# Create States
states = State.create([
  { name: 'California', country_id: countries.detect { |c| c.name == 'USA' }.id },
  { name: 'New York', country_id: countries.detect { |c| c.name == 'USA' }.id },
  { name: 'Ontario', country_id: countries.detect { |c| c.name == 'Canada' }.id },
  { name: 'Quebec', country_id: countries.detect { |c| c.name == 'Canada' }.id },
  { name: 'England', country_id: countries.detect { |c| c.name == 'UK' }.id },
  { name: 'Bavaria', country_id: countries.detect { |c| c.name == 'Germany' }.id },
  { name: 'Maharashtra', country_id: countries.detect { |c| c.name == 'India' }.id },
  { name: 'New South Wales', country_id: countries.detect { |c| c.name == 'Australia' }.id }
])

# Create Cities
cities = City.create([
  { name: 'Los Angeles', state_id: states.detect { |s| s.name == 'California' }.id },
  { name: 'San Francisco', state_id: states.detect { |s| s.name == 'California' }.id },
  { name: 'New York City', state_id: states.detect { |s| s.name == 'New York' }.id },
  { name: 'Toronto', state_id: states.detect { |s| s.name == 'Ontario' }.id },
  { name: 'Montreal', state_id: states.detect { |s| s.name == 'Quebec' }.id },
  { name: 'London', state_id: states.detect { |s| s.name == 'England' }.id },
  { name: 'Munich', state_id: states.detect { |s| s.name == 'Bavaria' }.id },
  { name: 'Mumbai', state_id: states.detect { |s| s.name == 'Maharashtra' }.id },
  { name: 'Sydney', state_id: states.detect { |s| s.name == 'New South Wales' }.id }
])

# Create Offshore Employees
offshoreemployees = Offshoreemployee.create([
  {
    firstname: 'Michael',
    lastname: 'Scott',
    country_id: countries.detect { |c| c.name == 'USA' }.id,
    state_id: states.detect { |s| s.name == 'California' }.id,
    city_id: cities.detect { |c| c.name == 'Los Angeles' }.id
  },
  {
    firstname: 'Pam',
    lastname: 'Beesly',
    country_id: countries.detect { |c| c.name == 'USA' }.id,
    state_id: states.detect { |s| s.name == 'New York' }.id,
    city_id: cities.detect { |c| c.name == 'New York City' }.id
  },
  {
    firstname: 'Jim',
    lastname: 'Halpert',
    country_id: countries.detect { |c| c.name == 'Canada' }.id,
    state_id: states.detect { |s| s.name == 'Ontario' }.id,
    city_id: cities.detect { |c| c.name == 'Toronto' }.id
  }
])

puts "✅ Seeding completed! Added #{offshoreemployees.count} offshore employees, #{countries.count} countries, #{states.count} states, and #{cities.count} cities."
# Add more Offshore Employees
more_offshoreemployees = Offshoreemployee.create([
  {
    firstname: 'Dwight',
    lastname: 'Schrute',
    country_id: countries.detect { |c| c.name == 'Germany' }.id,
    state_id: states.detect { |s| s.name == 'Bavaria' }.id,
    city_id: cities.detect { |c| c.name == 'Munich' }.id
  },
  {
    firstname: 'Angela',
    lastname: 'Martin',
    country_id: countries.detect { |c| c.name == 'UK' }.id,
    state_id: states.detect { |s| s.name == 'England' }.id,
    city_id: cities.detect { |c| c.name == 'London' }.id
  },
  {
    firstname: 'Kevin',
    lastname: 'Malone',
    country_id: countries.detect { |c| c.name == 'Australia' }.id,
    state_id: states.detect { |s| s.name == 'New South Wales' }.id,
    city_id: cities.detect { |c| c.name == 'Sydney' }.id
  },
  {
    firstname: 'Stanley',
    lastname: 'Hudson',
    country_id: countries.detect { |c| c.name == 'India' }.id,
    state_id: states.detect { |s| s.name == 'Maharashtra' }.id,
    city_id: cities.detect { |c| c.name == 'Mumbai' }.id
  }
])

puts "✅ Added #{more_offshoreemployees.count} more offshore employees."