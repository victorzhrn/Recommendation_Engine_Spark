CREATE DATABASE IF NOT EXISTS spark_data;

use spark_data;

CREATE TABLE IF NOT EXISTS clicks_train (
display_id INT,
ad_id BIGINT,
clicked BINARY);

CREATE TABLE IF NOT EXISTS clicks_test (
display_id INT,
ad_id BIGINT);

CREATE TABLE IF NOT EXISTS events_test (
display_id INT,
uuid VARCHAR(20),
document_id INT,
timestamp INT,
platform SMALLINT);

