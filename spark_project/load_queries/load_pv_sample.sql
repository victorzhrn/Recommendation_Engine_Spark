
use spark_data;

LOAD DATA LOCAL INFILE 'data/subset_pv.csv'
INTO TABLE pv_sample
FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(uuid, document_id, timestamp, platform);
