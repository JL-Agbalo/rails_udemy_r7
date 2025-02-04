# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create a new employee
# Create new employees
# Employee.create(
#   firstname: "John",
#   lastname: "Doe",
#   phone_number: "123-456-7890",
#   haspassport: true,
#   salary: 60000,
#   notes: "Experienced software engineer",
#   birthdate: Date.new(1985, 6, 15),
#   hiredate: Date.new(2020, 1, 10),
#   gender: "Male"
# )

# Employee.create(
#   firstname: "Jane",
#   lastname: "Smith",
#   phone_number: "987-654-3210",
#   haspassport: false,
#   salary: 55000,
#   notes: "Junior developer",
#   birthdate: Date.new(1990, 8, 25),
#   hiredate: Date.new(2021, 5, 20),
#   gender: "Female"
# )

# Employee.create(
#   firstname: "Alice",
#   lastname: "Johnson",
#   phone_number: "555-123-4567",
#   haspassport: true,
#   salary: 70000,
#   notes: "Project manager",
#   birthdate: Date.new(1982, 3, 10),
#   hiredate: Date.new(2019, 4, 15),
#   gender: "Female"
# )

# Employee.create(
#   firstname: "Diana",
#   lastname: "Evans",
#   phone_number: "555-321-9876",
#   haspassport: false,
#   salary: 58000,
#   notes: "QA engineer",
#   birthdate: Date.new(1992, 12, 15),
#   hiredate: Date.new(2021, 3, 10),
#   gender: "Female"
# )

# Create sample departments unless they already exist
departments = ["Engineering", "Human Resources", "Marketing", "Sales", "Finance"]

if Department.count == 0
  departments.each do |department_name|
    Department.find_or_create_by!(name: department_name)
  end
end

# Create sample countries unless they already exist
countries = ["United States", "Canada", "United Kingdom", "Australia", "Germany"]

if Country.count == 0
  countries.each do |country_name|
    Country.find_or_create_by!(name: country_name)
  end
end