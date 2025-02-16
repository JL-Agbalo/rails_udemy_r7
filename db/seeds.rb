require 'faker'
# db/seeds.rb

# # Create countries using Faker
# 5.times do
#   Country.create(name: Faker::Address.country)
# end

# # Create departments using Faker
# departments = ["Sales", "HR", "Engineering", "Finance", "Marketing"]
# departments.each do |department|
#   Department.create(name: department)
# end

# # Create employees using Faker
# 50.times do
#   Employee.create(
#     firstname: Faker::Name.first_name,
#     lastname: Faker::Name.last_name,
#     phone_number: Faker::PhoneNumber.phone_number,
#     haspassport: Faker::Boolean.boolean,
#     salary: Faker::Number.between(from: 30000, to: 100000),
#     notes: Faker::Lorem.sentence,
#     birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
#     hiredate: Faker::Date.between(from: '2015-01-01', to: '2023-01-01'),
#     gender: Faker::Gender.binary_type,
#     country_id: Country.all.sample.id,
#     department_id: Department.all.sample.id
#   )
# end


# Create Accounts
15.times do
  Account.create(
    name: Faker::Company.name,
    balance: Faker::Number.decimal(l_digits: 5, r_digits: 2)
  )
end

puts "Seeding completed! Added #{Country.count} countries, #{Department.count} departments, #{Employee.count} employees, and #{Account.count} accounts."