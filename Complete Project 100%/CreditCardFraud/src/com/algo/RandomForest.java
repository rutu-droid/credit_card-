package com.algo;

import java.io.IOException;

import weka.classifiers.Classifier;
import weka.classifiers.Evaluation;
import weka.core.Instances;
import weka.core.converters.ArffLoader;

public class RandomForest {

		/** file names are defined*/
		public static final String TRAINING_DATA_SET_FILENAME="decision-train.arff";
		public static final String TESTING_DATA_SET_FILENAME="decision-test.arff";
		

		/**
		 * This method is to load the data set.
		 * @param fileName
		 * @return
		 * @throws IOException
		 */
		public static Instances getDataSet(String fileName) throws IOException {
			/**
			 * we can set the file i.e., loader.setFile("finename") to load the data
			 */
			int classIdx = 1;
			/** the arffloader to load the arff file */
			ArffLoader loader = new ArffLoader();
			/** load the traing data */
			loader.setSource(weka.classifiers.trees.RandomForest.class.getResourceAsStream("/" + fileName));
			/**
			 * we can also set the file like loader3.setFile(new
			 * File("test-confused.arff"));
			 */
			//loader.setFile(new File(fileName));
			Instances dataSet = loader.getDataSet();
			/** set the index based on the data given in the arff files */
			dataSet.setClassIndex(classIdx);
			return dataSet;
		}

		/**
		 * This method is used to process the input and return the statistics.
		 * 
		 * @throws Exception
		 */
		public static void process() throws Exception {

			Instances trainingDataSet = getDataSet(TRAINING_DATA_SET_FILENAME);
			Instances testingDataSet = getDataSet(TESTING_DATA_SET_FILENAME);
			
			
			
			Object forest=new RandomForest();
			((RandomForest) forest).setNumTrees(10);
			
			
			/** */
			((Classifier) forest).buildClassifier(trainingDataSet);
			/**
			 * train the alogorithm with the training data and evaluate the
			 * algorithm with testing data
			 */
			Evaluation eval = new Evaluation(trainingDataSet);
			eval.evaluateModel((Classifier) forest, testingDataSet);
			
			
			/** Print the algorithm summary */
			System.out.println("** Decision Tress Evaluation with Datasets **");
			System.out.println(eval.toSummaryString());
			System.out.print(" the expression for the input data as per alogorithm is ");
			System.out.println(forest);
			System.out.println(eval.toMatrixString());
			 System.out.println(eval.toClassDetailsString());
			
		}

		private void buildClassifier(Instances trainingDataSet) {
			// TODO Auto-generated method stub
			
		}

		private void setNumTrees(int i) {
			// TODO Auto-generated method stub
			
		}
	}

