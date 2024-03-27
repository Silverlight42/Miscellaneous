VM options for IntelliJ's Run/Debug configurations.

```
-Dspark.ui.enabled=false
-Dspark.ui.showConsoleProgress=false
-Dspark.databricks.delta.snapshotPartitions=2
-Dspark.sql.shuffle.partitions=4
-Ddelta.log.cacheSize=3
-Dspark.sql.sources.parallelPartitionDiscovery.parallelism=5
-Xmx4G
-Duser.timezone=UTC
```
