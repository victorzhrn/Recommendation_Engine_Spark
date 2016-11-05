use spark_data;

alter table clicks_train add index train_d_index(display_id);
alter table clicks_train add index train_ad_index(ad_id);

alter table clicks_test add index test_d_index(display_id);
alter table clicks_test add index test_ad_index(ad_id);
