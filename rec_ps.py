from pyspark import SparkContext, SparkConf
from pyspark.mllib.recommendation import ALS, MatrixFactorizationModel, Rating
import hashlib

conf = SparkConf().setAppName("py_rec").setMaster("local")
sc = SparkContext(conf = conf)

data = sc.textFile("hdfs:///tmp/spark_data/training_subset/part-m-00000")

ratings = data.map(lambda l: l.split(','))\
    .map(lambda l: Rating(int(l[3]), int(l[2]), float(l[4])))

ratings = data.map(lambda l: l.split(',')).map(lambda l: Rating(int(hash(l[1])), int(l[2]), float(l[3])))
rank = 10
numIterations = 10

model = ALS.train(ratings, rank, numIterations)
model.save(sc,'hdfs:///tmp/spark_data/subset_model')

sameModel = MatrixFactorizationModel.load(sc,'hdfs:///tmp/spark_data/subset_model')
