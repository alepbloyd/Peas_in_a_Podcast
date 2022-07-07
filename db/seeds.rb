# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Podcast.create!(name: "Criminal", in_production: true, ad_slot_cost: 950.25)
Podcast.create!(name: "Maintenance Phase", in_production: true, ad_slot_cost: 500)
Podcast.create!(name: "The Daily", in_production: true, ad_slot_cost: 875.69)
Podcast.create!(name: "This American Life", in_production: false, ad_slot_cost: 1400)
Podcast.create!(name: "The Moth", in_production: false, ad_slot_cost: 450)