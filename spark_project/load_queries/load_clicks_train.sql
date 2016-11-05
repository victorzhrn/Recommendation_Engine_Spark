
use spark_data;

LOAD DATA LOCAL INFILE 'data/clicks_train.csv'
INTO TABLE clicks_train
FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(display_id,ad_id,clicked);
