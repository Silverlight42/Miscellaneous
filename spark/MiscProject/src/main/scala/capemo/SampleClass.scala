package capemo

class SampleClass {
  private lazy val spark = SparkSessionManager.session

  import spark.implicits._

  def main(args: Array[String]): Unit = {
    Seq(0, 10).toDF.show()
    Seq(0, 10).toDF.write
      .format("delta")
      .mode("overwrite")
      .saveAsTable("sample_delta_table")
  }
}
