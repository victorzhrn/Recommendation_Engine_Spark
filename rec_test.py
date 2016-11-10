from pyspark import SparkContext, SparkConf
from pyspark.mllib.recommendation import ALS, MatrixFactorizationModel, Rating

conf = SparkConf().setAppName("py_rec").setMaster("local")
sc = SparkContext(conf = conf)

data = sc.textFile("hdfs:///tmp/spark_data/testing_subset/part-m-00000")

ratings = data.map(lambda l: l.split(','))\
    .map(lambda l: Rating(int(l[4]), int(l[2]), float(l[3])))

ratings = data.map(lambda l: l.split(',')).map(lambda l: Rating(int(hash(l[1])), int(l[2]), float(l[3])))


sameModel = MatrixFactorizationModel.load(sc,'hdfs:///tmp/spark_data/subset_model')

testdata = ratings.map(lambda p: (p[0],p[1]))
predictions = sameModel.predictAll(testdata).map(lambda r:((r[0],r[1]),r[2]))

ratesAndPreds = ratings.map(lambda r: ((r[0], r[1]), r[2])).join(predictions)
MSE = ratesAndPreds.map(lambda r: (r[1][0] - r[1][1])**2).mean()
print("Mean Squared Error = " + str(MSE))

ratesAndPreds.saveAsTextFile("hdfs:///tmp/spark_data/testing_subset_prediction_result")
