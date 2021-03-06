# Peas in a Podcast

Submission for Turing School of Software and Design, Backend Module 2 solo project: [Relational Rails](https://backend.turing.edu/module2/projects/relational_rails).

This program demonstrates a one-to-many database relationship using podcasts (one) and episodes (many), utilizing PostgreSQL as database infrastructure, and uses Ruby v2.7.4 and Rails v5.2.8 as a framework. 

In testing, I primarily utilized [rspec-rails](https://relishapp.com/rspec/rspec-rails/docs), [capybara](http://teamcapybara.github.io/capybara/), and [shoulda-matchers](https://matchers.shoulda.io/) for both feature and model testing. 

## Podcast (parent) view:

![gui_view](https://user-images.githubusercontent.com/17027357/178799136-2e9da39f-d2e7-4fd4-b36f-31fe89ef4b03.png)

## Episode (child) view:

![episode_view](https://user-images.githubusercontent.com/17027357/178799969-5edd8997-6dda-4356-b109-61702d514207.png)

## Database schema design:

![schema_image](https://user-images.githubusercontent.com/17027357/178793436-76031fba-9006-46c0-bc68-64728a0b4538.jpg)
