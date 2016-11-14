use spark_data;

LOAD DATA LOCAL INFILE 'data/events.csv'
INTO TABLE events
FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(display_id,uuid);
