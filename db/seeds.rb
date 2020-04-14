# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times {User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, email: Faker::Internet.email, password_digest: "12345")}
5.times {Location.create(name: Faker::Nation.capital_city, address: Faker::Compass.direction, description: Faker::Lorem.sentence)}
5.times { |i| Trip.create(location: Location.all[i], description: Faker::Lorem.sentence, date: Faker::Date.in_date_period, departure_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short), return_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :short))}
5.times {|i| PassengerRelationship.create(user: User.all[i], trip: Trip.all[i])}
5.times {|i| DriverRelationship.create(user: User.all[i + 5], trip: Trip.all[i])}