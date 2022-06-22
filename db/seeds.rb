# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


User.create([
  {first_name: 'first', last_name: 'test', username: 'test1', email: '1st@test.com', password: '1234'},
  {first_name: 'second', last_name: 'test', username: 'test2', email: '2nd@test.com', password: '1234'},
  {first_name: 'third', last_name: 'test', username: 'test3', email: '3rd@test.com', password: '1234'},
  {first_name: 'fourth', last_name: 'test', username: 'test4', email: '4th@test.com', password: '1234'},
  {first_name: 'fifth', last_name: 'test', username: 'test5', email: '5th@test.com', password: '1234'},
  {first_name: 'sixth', last_name: 'test', username: 'test6', email: '6th@test.com', password: '1234'},
  {first_name: 'seventh', last_name: 'test', username: 'test7', email: '7th@test.com', password: '1234'},
  {first_name: 'eighth', last_name: 'test', username: 'test8', email: '8th@test.com', password: '1234'},
  {first_name: 'ninth', last_name: 'test', username: 'test9', email: '9th@test.com', password: '1234'},
  {first_name: 'tenth', last_name: 'test', username: 'test10', email: '10th@test.com', password: '1234'}
])

MainCause.create([
  {title: 'Climate Change', description: 'End of the world brought on by our own stupidity! The pilaging of natural resources, corporate greed, and lack of action from our elected leaders has lead us to the end. Either the planet cannot support life, or natural disasters have whiped us out, or mass spread disease, or something else horrible.'},
  {title: 'World War III', description: 'End of the world brought on by human nature! Our willingess, nay eagerness to destroy eachother has inevitably and predictably brought us to the end. This could be from Nuclear War, Nuclear Winter, Chemical Warfare, etc...'},
  {title: 'Asteroid Impact', description: 'Welp, not much we can do here unless Bruce Willis and Steve Buschemi are available...'}
])

SubCause.create([
  {main_cause_id: 1, title: 'Rising sea levels', description: 'the rising of the sea levels has driven the extinction of the human as there is no habital zone left'},
  {main_cause_id: 1, title: 'Ozone Layer Depletion', description: 'The depletion of the ozone layer has left the entire planet uninhabitable'},
  {main_cause_id: 2, title: 'Nuclear Winter', description: 'The fall out from mass nuclear explosions has blocked out the sun making life on earth impossible'},
  {main_cause_id: 2, title: 'Chemical Warfare', description: 'The usage of chemical weapons has decimated all life on earth'}
])

Bet.create([
  {user_id: 1, main_cause_id: 1, sub_cause_id: 1, timeframe: '1 year'},
  # {user_id: 2, main_cause_id: 1, sub_cause_id: 2, timeframe: '2 years'},
  {user_id: 3, main_cause_id: 2, sub_cause_id: 1, timeframe: '3 years'},
  {user_id: 4, main_cause_id: 3, timeframe: '5 years'},
  # {user_id: 1, main_cause_id: 1, sub_cause_id: 2, timeframe: '10 years'},
  # {user_id: 5, main_cause_id: 2, sub_cause_id: 1, timeframe: '7 years'},
  # {user_id: 6, main_cause_id: 2, sub_cause_id: 2, timeframe: '10 years'}
])