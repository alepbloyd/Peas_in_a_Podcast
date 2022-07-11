# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Episode.destroy_all
Podcast.destroy_all

podcast_1 = Podcast.create!(name: "This Canadian Death", in_production: true, ad_slot_cost: 950.25)
podcast_2 = Podcast.create!(name: "The Hourly", in_production: true, ad_slot_cost: 500)
podcast_3 = Podcast.create!(name: "100% Visible", in_production: true, ad_slot_cost: 875.69)
podcast_4 = Podcast.create!(name: "Normal-nomics", in_production: false, ad_slot_cost: 1400)

episode_1 = podcast_1.episodes.create!(title: "Tim Horton's Donut Distaster", length_in_seconds: 1000, marked_explicit: true)
episode_2 = podcast_1.episodes.create!(title: "Hockey Pucks - A Public Health Crisis", length_in_seconds: 123, marked_explicit: false)
episode_3 = podcast_1.episodes.create!(title: "Lost in Drake's Toronto Mansion", length_in_seconds: 10000, marked_explicit: true)

episode_4 = podcast_2.episodes.create!(title: "Welcome to Our First Episode", length_in_seconds: 2000, marked_explicit: true)
episode_5 = podcast_2.episodes.create!(title: "Help, We Just Finished Recording Our First Episode", length_in_seconds: 243, marked_explicit: false)
episode_6 = podcast_2.episodes.create!(title: "This Production Schedule is Untenable", length_in_seconds: 20000, marked_explicit: true)

episode_7 = podcast_3.episodes.create!(title: "Non-Translucent Objects", length_in_seconds: 3000, marked_explicit: true)
episode_8 = podcast_3.episodes.create!(title: "Mammals - Visible to the Naked Eye", length_in_seconds: 345, marked_explicit: false)
episode_9 = podcast_3.episodes.create!(title: "Rods and Cones - Lil Eye Guys", length_in_seconds: 30000, marked_explicit: true)

episode_10 = podcast_4.episodes.create!(title: "Supply and Demand", length_in_seconds: 4000, marked_explicit: true)
episode_11 = podcast_4.episodes.create!(title: "The Economy - Pretty Standard!", length_in_seconds: 456, marked_explicit: false)
episode_12 = podcast_4.episodes.create!(title: "Interview with Mr. Monopoly Guy", length_in_seconds: 40000, marked_explicit: true)