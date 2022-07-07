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

Episode.create!(title: "Criminal: The first episode", length_in_seconds: 1000, marked_explicit: true, podcast_id: 1)
Episode.create!(title: "Criminal: The second episode", length_in_seconds: 123, marked_explicit: false, podcast_id: 1)
Episode.create!(title: "Criminal: The third episode", length_in_seconds: 10000, marked_explicit: true, podcast_id: 1)

Episode.create!(title: "Maintenance Phase: The first episode", length_in_seconds: 2000, marked_explicit: true, podcast_id: 2)
Episode.create!(title: "Maintenance Phase: The second episode", length_in_seconds: 243, marked_explicit: false, podcast_id: 2)
Episode.create!(title: "Maintenance Phase: The third episode", length_in_seconds: 20000, marked_explicit: true, podcast_id: 2)

Episode.create!(title: "The Daily: The first episode", length_in_seconds: 3000, marked_explicit: true, podcast_id: 3)
Episode.create!(title: "The Daily: The second episode", length_in_seconds: 345, marked_explicit: false, podcast_id: 3)
Episode.create!(title: "The Daily: The third episode", length_in_seconds: 30000, marked_explicit: true, podcast_id: 3)

Episode.create!(title: "This American Life: The first episode", length_in_seconds: 4000, marked_explicit: true, podcast_id: 4)
Episode.create!(title: "This American Life: The second episode", length_in_seconds: 456, marked_explicit: false, podcast_id: 4)
Episode.create!(title: "This American Life: The third episode", length_in_seconds: 40000, marked_explicit: true, podcast_id: 4)