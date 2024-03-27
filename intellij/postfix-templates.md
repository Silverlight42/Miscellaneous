Templates I've created for [IntelliJ's Postfix Completion](https://www.jetbrains.com/help/idea/settings-postfix-completion.html).

```
.table : SPARK_TABLE
	java.lang.String -> spark.table($expr$)

.tableshow : SPARK_TABLE_SHOW
	java.lang.String ->  spark.table($expr$).show

.tablefilter: SPARK_TABLE_FILTER
	java.lang.String -> val $NAME$ = spark.table($expr$)\
        .filter($FILTER$)\
        $END$

.writeAsDelta: WRITE_TABLE_AS_DELTA
	org.apache.spark.sql.Dataset -> $expr$.write\
        .format("delta")\
        .mode("$MODE::"overwrite"$")\
        .saveAsTable($TABLE_NAME$)\
        $END$
```

## Links

1. [Jetbrains - How to create custom postfix templates](https://www.jetbrains.com/help/idea/auto-completing-code.html#custom-postfix-templates).
