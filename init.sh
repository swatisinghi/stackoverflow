#!/bin/bash

# Drop and create a fresh database
`echo 'DROP DATABASE IF EXISTS stackoverflow' | mysql -uroot`
`echo 'CREATE DATABASE stackoverflow' | mysql -uroot`

# Create the table
`mysql -uroot stackoverflow < ./sql/create_schema.sql`

# Get data into the database from the seed file
`mysql -uroot stackoverflow < ./sql/seed.sql`

# Ruby scripts to extract metrics and dump them as JSON
`ruby ./utils/metrics.rb "select topic as label, sum(views + hotViews + warmViews) as value from topic_data group by topic" ./data/highest_viewed_topic.json "value"`
`ruby ./utils/metrics.rb "select topic as label, sum(votes) as value from topic_data group by topic" ./data/highest_voted_topic.json "value"`
`ruby ./utils/metrics.rb "select topic as label, sum(answers + accepted_answers) as value from topic_data group by topic" ./data/highest_answered_topic.json "value"`
`ruby ./utils/metrics.rb "select topic as label, sum(views) as views, sum(hotViews) as hot_views, sum(warmViews) as warm_views from topic_data group by topic" ./data/type_views_topic.json "views,hot_views,warm_views"`
`ruby ./utils/metrics.rb "select topic as label, sum(answers) as answers, sum(accepted_answers) as accepted_answers from topic_data group by topic" ./data/type_answers_topic.json "answers,accepted_answers"`
`ruby ./utils/rank.rb ./data/topic_rank.json`

# Open the main page
`open http://localhost:8000/index.html`

