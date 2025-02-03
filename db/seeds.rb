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
Employee.create(
  firstname: "John",
  lastname: "Doe",
  phone_number: "123-456-7890",
  haspassport: true,
  salary: 60000,
  notes: "Experienced software engineer",
  birthdate: Date.new(1985, 6, 15),
  hiredate: Date.new(2020, 1, 10),
  gender: "Male"
)

Employee.create(
  firstname: "Jane",
  lastname: "Smith",
  phone_number: "987-654-3210",
  haspassport: false,
  salary: 55000,
  notes: "Junior developer",
  birthdate: Date.new(1990, 8, 25),
  hiredate: Date.new(2021, 5, 20),
  gender: "Female"
)

Employee.create(
  firstname: "Alice",
  lastname: "Johnson",
  phone_number: "555-123-4567",
  haspassport: true,
  salary: 70000,
  notes: "Project manager",
  birthdate: Date.new(1982, 3, 10),
  hiredate: Date.new(2018, 7, 15),
  gender: "Female"
)

Employee.create(
  firstname: "Bob",
  lastname: "Brown",
  phone_number: "555-987-6543",
  haspassport: false,
  salary: 65000,
  notes: "Senior developer",
  birthdate: Date.new(1987, 11, 5),
  hiredate: Date.new(2019, 2, 25),
  gender: "Male"
)

Employee.create(
  firstname: "Charlie",
  lastname: "Davis",
  phone_number: "555-654-3210",
  haspassport: true,
  salary: 72000,
  notes: "DevOps engineer",
  birthdate: Date.new(1989, 4, 20),
  hiredate: Date.new(2020, 9, 30),
  gender: "Male"
)

Employee.create(
  firstname: "Diana",
  lastname: "Evans",
  phone_number: "555-321-9876",
  haspassport: false,
  salary: 58000,
  notes: "QA engineer",
  birthdate: Date.new(1992, 12, 15),
  hiredate: Date.new(2021, 3, 10),
  gender: "Female"
)