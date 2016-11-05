create table user_ids select distinct(uuid) from events;

ALTER TABLE user_ids add user_id int primary key AUTO_INCREMENT;

// add extra column for user_id to trainging_set and training_subset
alter table training_subset add column user_id int default NULL;
alter table training_set add column user_id int default NULL;

// populate user_id column based on table user_ids
update training_subset A set A.user_id = (select B.user_id from user_ids B where A.uuid=B.uuid);

update training_set A set A.user_id = (select B.user_id from user_ids B where A.uuid=B.uuid);
