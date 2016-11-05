CREATE DATABASE IF NOT EXISTS spark_data;

use spark_data;
/*
CREATE TABLE IF NOT EXISTS pv_sample (
uuid VARCHAR(20),
document_id INT,
timestamp INT,
platform SMALLINT);

CREATE TABLE IF NOT EXISTS export_pv_sample(
uuid VARCHAR(20),
document_id INT,
timestamp INT,
platform SMALLINT);
*/
CREATE TABLE IF NOT EXISTS clicks_train (
display_id INT,
ad_id BIGINT,
clicked BINARY);

CREATE TABLE IF NOT EXISTS clicks_test (
display_id INT,
ad_id BIGINT);


CREATE TABLE IF NOT EXISTS events (
display_id INT,
uuid VARCHAR(20));


/*CREATE TABLE IF NOT EXISTS promoted_content (
ad_id BIGINT,
document_id INT);*/
