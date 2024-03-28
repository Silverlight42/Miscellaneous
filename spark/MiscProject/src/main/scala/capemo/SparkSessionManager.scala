package capemo

import org.apache.spark.SparkConf
import org.apache.spark.sql.SparkSession

import java.nio.file.Paths

object SparkSessionManager {
  private var sparkSession: SparkSession = _
  var localSpark = false

  private lazy val sparkConf: SparkConf = new SparkConf(false)
    .setAppName("app-name")
    .set("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
    .set("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
    .set("spark.sql.parquet.datetimeRebaseModeInWrite", "LEGACY")
    .set("spark.sql.shuffle.partitions", "4")
    .set("spark.sql.session.timeZone", "UTC")
    .set("spark.databricks.delta.constraints.allowUnenforcedNotNull.enabled", "true")
    .set("spark.databricks.delta.allowArbitraryProperties.enabled", "true")
    .setMaster("local[*]")

  def session: SparkSession =
    this.synchronized {
      if (localSpark) {
        local.sparkContext.setLogLevel("ERROR")
        local
      } else {
        provided
      }
    }

  private def local: SparkSession = {
    if (sparkSession == null) {
      val metastorePath = Paths.get(System.getProperty("user.dir"), "user_metastore")
      System.setProperty("derby.system.home", metastorePath.toAbsolutePath.toString)

      sparkSession = SparkSession.builder
        .config(sparkConf)
        .enableHiveSupport()
        .getOrCreate()
    }

    sparkSession
  }

  private def provided = if (sparkSession == null) {
    sparkSession = SparkSession
      .builder()
      .getOrCreate()
    sparkSession
  } else {
    sparkSession
  }

}