import scala.Tuple2;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.*;
import org.apache.spark.api.java.function.Function;
import org.apache.spark.mllib.recommendation.ALS;
import org.apache.spark.mllib.recommendation.MatrixFactorizationModel;
import org.apache.spark.mllib.recommendation.Rating;

import java.util.Arrays;
import java.util.List;

import org.apache.spark.SparkConf;

public class Explicit {
	
	public static void main(String[] args){
		SparkConf conf = new SparkConf().setAppName("Java CF");
		JavaSparkContext sc = new JavaSparkContext(conf);
		
		String inputPath = args[0];
		JavaRDD<String> data = sc.textFile(inputPath);
		
		JavaRDD<Rating> ratings = data.map(
				new Function<String, Rating>(){
					public Rating call (String s){
						String[] sarray = s.split(",");
						int uuid = Integer.parseInt(sarray[1]);
						int ad_id = Integer.parseInt(sarray[2]);
						int clicked = Integer.parseInt(sarray[3]);
						return new Rating(uuid,ad_id,clicked);
					}
				}
				);
		
		int rank = 10;
		int numIterations = 5;
		MatrixFactorizationModel model = ALS.train(JavaRDD.toRDD(ratings), rank, numIterations, 0.01);
	}
	
}


