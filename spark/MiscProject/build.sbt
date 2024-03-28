ThisBuild / version := "0.1.0-SNAPSHOT"

ThisBuild / scalaVersion := "2.12.19"

lazy val root = (project in file("."))
  .settings(
    name := "MiscProject"
  )

val sparkVersion = "3.4.1"

libraryDependencies += "io.delta" %% "delta-core" % "2.4.0"
libraryDependencies += "org.apache.spark" %% "spark-core" % sparkVersion % "provided"
libraryDependencies += "org.apache.spark" %% "spark-sql" % sparkVersion % "provided"

libraryDependencies += "org.apache.spark" %% "spark-core" % sparkVersion % "test" classifier "tests"
libraryDependencies += "org.apache.spark" %% "spark-sql" % sparkVersion % "test" classifier "tests"
libraryDependencies += "org.apache.spark" %% "spark-hive" % sparkVersion % "test"
libraryDependencies += "org.scalatest" %% "scalatest-funsuite" % "3.2.17" % "test"