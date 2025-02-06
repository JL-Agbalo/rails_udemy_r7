# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Employee.destroy_all
Department.destroy_all
Country.destroy_all
State.destroy_all
City.destroy_all

# Create some departments
departments = Department.create([
  { name: 'HR' },
  { name: 'Engineering' },
  { name: 'Marketing' },
  { name: 'Sales' }
])

# Create some countries
countries = Country.create([
  { name: 'USA' },
  { name: 'Canada' },
  { name: 'UK' },
  { name: 'Germany' }
])

# Create some states and associate them with countries
states = State.create([
  { name: 'California', country: countries.detect { |c| c.name == 'USA' } },
  { name: 'Ontario', country: countries.detect { |c| c.name == 'Canada' } },
  { name: 'England', country: countries.detect { |c| c.name == 'UK' } },
  { name: 'Bavaria', country: countries.detect { |c| c.name == 'Germany' } }
])

# Create some cities and associate them with states
cities = City.create([
  { name: 'Los Angeles', state: states.detect { |s| s.name == 'California' } },
  { name: 'San Francisco', state: states.detect { |s| s.name == 'California' } },
  { name: 'San Diego', state: states.detect { |s| s.name == 'California' } },
  { name: 'Toronto', state: states.detect { |s| s.name == 'Ontario' } },
  { name: 'Ottawa', state: states.detect { |s| s.name == 'Ontario' } },
  { name: 'Vancouver', state: states.detect { |s| s.name == 'Ontario' } },
  { name: 'London', state: states.detect { |s| s.name == 'England' } },
  { name: 'Manchester', state: states.detect { |s| s.name == 'England' } },
  { name: 'Birmingham', state: states.detect { |s| s.name == 'England' } },
  { name: 'Munich', state: states.detect { |s| s.name == 'Bavaria' } },
  { name: 'Berlin', state: states.detect { |s| s.name == 'Bavaria' } },
  { name: 'Hamburg', state: states.detect { |s| s.name == 'Bavaria' } }
])

# Create some Offshoreemployee
offshoreemployees = Offshoreemployee.create([
  {
    firstname: 'John',
    lastname: 'Doe',
    country_id: countries.sample.id,
    state_id: states.sample.id,
    city_id: cities.sample.id
  },
  {
    firstname: 'Jane',
    lastname: 'Smith',
    country_id: countries.sample.id,
    state_id: states.sample.id,
    city_id: cities.sample.id
  },
  {
    firstname: 'Alice',
    lastname: 'Johnson',
    country_id: countries.sample.id,
    state_id: states.sample.id,
    city_id: cities.sample.id
  },
  {
    firstname: 'Bob',
    lastname: 'Brown',
    country_id: countries.sample.id,
    state_id: states.sample.id,
    city_id: cities.sample.id
  }
])