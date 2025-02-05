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
Department.destroy_all
Country.destroy_all
Employee.destroy_all

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

# Create some employees
employees = Employee.create([
  {
    firstname: 'John',
    lastname: 'Doe',
    phone_number: '1234567890',
    haspassport: true,
    salary: 60000,
    notes: 'Senior Developer',
    birthdate: '1985-01-15',
    hiredate: '2010-06-01',
    gender: 'Male',
    country_id: countries.sample.id,
    department_id: departments.sample.id
  },
  {
    firstname: 'Jane',
    lastname: 'Smith',
    phone_number: '0987654321',
    haspassport: false,
    salary: 50000,
    notes: 'Marketing Specialist',
    birthdate: '1990-05-20',
    hiredate: '2015-09-15',
    gender: 'Female',
    country_id: countries.sample.id,
    department_id: departments.sample.id
  },
  {
    firstname: 'Alice',
    lastname: 'Johnson',
    phone_number: '5555555555',
    haspassport: true,
    salary: 70000,
    notes: 'HR Manager',
    birthdate: '1980-03-10',
    hiredate: '2008-11-30',
    gender: 'Female',
    country_id: countries.sample.id,
    department_id: departments.sample.id
  },
  {
    firstname: 'Bob',
    lastname: 'Brown',
    phone_number: '4444444444',
    haspassport: false,
    salary: 45000,
    notes: 'Sales Representative',
    birthdate: '1992-07-25',
    hiredate: '2018-01-20',
    gender: 'Male',
    country_id: countries.sample.id,
    department_id: departments.sample.id
  }
])

puts "Seeded #{Department.count} departments, #{Country.count} countries, and #{Employee.count} employees."