# Recommendation Engine Spark

## Description of Project
This project is created to participate [OutBrain Click Prediction](https://www.kaggle.com/c/outbrain-click-prediction) competition hosted on [Kaggle](http://www.kaggle.com/competitions). The content of this project involves building a collaborative filtering system using Spark. The task in this competition is to predict the likelihood of user cliking certain ads or documents based on historical data.

## Background
### Competition Task
* rank the recommendations in each group by decreasing predicted likelihood of being clicked

### Data Description
OutBrain provides a relational dateset including details of historical pageview, documents, user behaviors, ads details. 

#### Attributes Description
* uuid: an unique id for each user.
* document_id: an unique id for each docuement(a web page with content, Ex:a news article), on each documents, a set of ads are displayed.
* ad_id: an unique id for each ad.
* clicked: (1 if clicked, 0 otherwise).
* campaign_id: an unique id for each compaign. Each ad belong to a campaign run by a advertiser(advertiser_id).
* display_id: each context is given a display_id. In each such set, the user clicked on at least one recommendation.

#### DataSets Details
|table name| attributes | details|
|----------|------------|--------|
|page_views|uuid, document_id, timestamp ...| a log of users visiting docuemnts|
|click_train| display_id, ad_id, clicked| training data |
|click_test| display_id, ad_id| testing data|
|promoted_content| ad_id, document_id, compaign_id, advertiser_id| details on every add|
|docuements_meta| document_id,publisher_id,...| details on every document|
|events| display_id, uuid, document_id,time_stamp...| informations on display_id context; convers both the train and test set|

