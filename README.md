# Recommendation Engine Spark

## General Description
This project is created to participate [OutBrain Click Prediction](https://www.kaggle.com/c/outbrain-click-prediction) competition hosted on [Kaggle](http://www.kaggle.com/competitions). The content of this project involves building a collaborative filtering system using Spark. The task in this competition is to predict the likelihood of user cliking certain ads or documents based on historical data.

## Background
### Competition Task
* rank the recommendations in each group by decreasing predicted likelihood of being clicked

### Data Description
* OutBrain provides a relational dateset including details of historical pageview, documents, user behaviors, ads details. 

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

### Spark & Collaborative Filtering
#### Why Spark?
* Spark is especially useful and fast in area of data science, the reason being, instead of storing intermediate data flows on hdfs in Hadoop, it stores intermediate result in memory via a new data model called resilient distributed datasets (RDD), do so prevent the reloading of data between iterations. In many data analytical algorithms, iterative methods are called with slightly changing parameters (Ex: gradient descent). Because of iterative nature of many data analytical and machine learning algorithms, Spark enhance the speed performance in big data applications.

#### Collaborative Filtering
* Collaborative filtering, also known as recommendation engines, are widely used in the ecommerce space to generate recommendations to customers based on user-behavior data. The algorithm used for this job is known as *User-based recommenders*

	> Find users that are similar to the target user, and uses their collaborative ratings to make recommendations for the target user.

---
## Algorithms
### Matrix Factorization
The idea about matrix factorization is to find latent features underlything the interactions between 2 different entities through find a linear algebra representation on the latent features. In this case, it is to find the underlying feartures shared by users who click same ads. 

In this problem, there is a set of all users **U** and a set of all ads **D**. A rating matrixed **R** is a matrix with dimention of |**U**|\*|**D**| where **R**(i,j) represents the binary indicator whether i*th* customer clicked on j*th* ads. The elements on **R** where the customers did not clicked ads are filled with zeros. The goal is to find factorize **R** into two submatrix **P**=|**U**|\***k** and **Q** =|**D**|\***k** so that **R** \approx **P**\***Q**<sup>T</sub>. Here **K** is the vector representation of the underlying latent feature. The rows of **P** represents the association between a user and latent features. The rows of **Q** represents the association between a item and the latent featuers. The ultimate here is to come up with such **P** and **Q** so that their vector product approximates on our observations on users' behavior; meanwhile, the **K** offers the recommendation engine on estimation of latent features so that it can provide extra information on unobserved **R**(i,j).

### Alternative Least Square
The optimization process to **P** and **Q** could just with any random **k**, and using other OR (brief for Operation Research) techniques such as stochatic gradient descent to come up with a relative optimal. Such process is called Alternative Least Square (ALS for rest of this paper). The ALS method has already be implemented in the *mllib* from spark library.

### Model Regulization
Even though ALS has already be implemented in *mllib* it is worth to menth that the problem opimizing **K** is a high-dimentional non-convex problem which means in many situations (especially in situations of big datasets) the global optimal in not guarrenteed. In fact, the global optimal is almost never reached in practical. 

It is very import to point out, as the complexity of **K** increases, it is very possible for overfitting. Just like some regression techniques like *Lasso* and *Ridge*, ALS should be penalized by the model's complexity. Therefore, the optimization target is a combination of (\sum error) and (regulating\_prameter\***K**'s complexity). 
