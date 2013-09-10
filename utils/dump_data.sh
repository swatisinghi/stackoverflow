#!/bin/bash

# Drop and create a fresh database
`echo 'DROP DATABASE IF EXISTS stackoverflow' | mysql -uroot`
`echo 'CREATE DATABASE stackoverflow' | mysql -uroot`

# Create the table
`mysql -uroot stackoverflow < ./sql/create_schema.sql`

# Read the scraped data and dump in the database
echo `ruby ./utils/dump_data.rb`

# Extract the data into a seed file
`mysqldump -uroot stackoverflow --no-create-info > ./sql/seed.sql`


