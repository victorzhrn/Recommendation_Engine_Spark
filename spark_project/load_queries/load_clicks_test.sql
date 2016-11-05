
use spark_data;

LOAD DATA LOCAL INFILE 'data/clicks_test.csv'
INTO TABLE clicks_test
FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(display_id,ad_id);
