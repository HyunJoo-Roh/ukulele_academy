# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name:"건영님",  phone:"010-1010-1010", email:"dsd@ds.com")
Schedule.create(day: "monday", hour: 1700, user_id: 1)
Schedule.create(day: "tuesday", hour: 1700, user_id: 1)
Schedule.create(day: "wednesday", hour: 1700, user_id: 1)
Schedule.create(day: "thursday", hour: 1700, user_id: 1)
Schedule.create(day: "friday", hour: 1700, user_id: 1)
Schedule.create(day: "saturday", hour: 1700, user_id: 1)
Schedule.create(day: "sunday", hour: 1700, user_id: 1)
      