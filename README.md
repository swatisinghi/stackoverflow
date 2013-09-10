stackoverflow
==============

Small project using morris charting library which shows visualizations on data scraped from stackoverflow. 

Steps
==============

- Scrape the data and put them in the corresponding files under ./topic_data.

- Run the ./utils/dump_data.sh to push the data into the database, this will also extract the data into a seed file.
   cmd: sh ./utils/dump_data.sh

- Start a server.
   cmd: python -m SimpleHTTPServer

- Run the ./init.sh to extract the metrics and dump them is json files.
   cmd: sh ./init.sh

- Open a browser and type in the url http://localhost:8000/index.html to see the metrics.

The scripts for data generation have been written in ruby.
