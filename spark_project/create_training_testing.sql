use spark_data;

CREATE TABLE IF NOT EXISTS training_set 
select  A.display_id as display_id, B.uuid as uuid, A.ad_id as ad_id, A.clicked as clicked
from clicks_train A, events B
where A.display_id = B.display_id;


CREATE TABLE IF NOT EXISTS testing_set
select  A.display_id as display_id, B.uuid as uuid, A.ad_id as ad_id
from clicks_test A, events B
where A.display_id = B.display_id;

