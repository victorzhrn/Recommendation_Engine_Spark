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

|table name| attributes | details|
|----------|------------|--------|
|page_views|uuid, document_id, timestamp ...| a log of users visiting docuemnts|


