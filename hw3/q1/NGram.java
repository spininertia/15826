//package org.myorg;
import java.io.IOException;
import java.util.*;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.conf.*;
import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
import org.apache.hadoop.util.*;

public class NGram {

	public static class Map extends MapReduceBase
			implements
				Mapper<LongWritable, Text, Text, IntWritable> {
		private final static IntWritable one = new IntWritable(1);
		private Text nGram = new Text();
		private static int n = 3;

		public void configure(JobConf job) {
			n = Integer.parseInt(job.get("n"));
		}
		public void map(LongWritable key, Text value,
				OutputCollector<Text, IntWritable> output, Reporter reporter)
				throws IOException {
			String line = value.toString();
			StringTokenizer tokenizer = new StringTokenizer(line);
			ArrayList<String> tokenList = new ArrayList<String>();
			while (tokenizer.hasMoreTokens()) {
				tokenList.add(tokenizer.nextToken());
			}
			for (int i = 0; i < tokenList.size() - n + 1; i++) {
				String gram = "";
				for (int j = i; j < i + n; j++) {
					gram += tokenList.get(j) + " ";
				}
				nGram.set(gram.trim());
				output.collect(nGram, one);
			}
		}
	}

	public static class Reduce extends MapReduceBase
			implements
				Reducer<Text, IntWritable, Text, IntWritable> {
		private static int m = 20;

		public void configure(JobConf job) {
			m = Integer.parseInt(job.get("m"));
		}

		public void reduce(Text key, Iterator<IntWritable> values,
				OutputCollector<Text, IntWritable> output, Reporter reporter)
				throws IOException {
			int sum = 0;
			while (values.hasNext()) {
				sum += values.next().get();
			}
			if (sum >= m)
				output.collect(key, new IntWritable(sum));
		}
	}

	public static void main(String[] args) throws Exception {
		JobConf conf = new JobConf(NGram.class);
		conf.setJobName("NGram");

		conf.setOutputKeyClass(Text.class);
		conf.setOutputValueClass(IntWritable.class);

		conf.setMapperClass(Map.class);
		// conf.setCombinerClass(Reduce.class);
		conf.setReducerClass(Reduce.class);

		conf.setInputFormat(TextInputFormat.class);
		conf.setOutputFormat(TextOutputFormat.class);

		conf.set("n", args[2]);
		conf.set("m", args[3]);

		FileInputFormat.setInputPaths(conf, new Path(args[0]));
		FileOutputFormat.setOutputPath(conf, new Path(args[1]));

		JobClient.runJob(conf);
	}
}
