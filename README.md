# SetUp

* Download MongoDB Shell tools: https://www.mongodb.com/try/download/shell

* Download Mongo Dump/ Restore tools (located in Database Tools): https://www.mongodb.com/try/download/database-tools 

* Create a folder to run the dump and restore from, the dump will create a folder 'dump/' at this location to store dump files.

* Get the full path of `mongodump.js` and put it in `executionCommand.sh`

* Get the full path of `queryFile.json` and put it in `executionCommand.sh`

* Review the `queryFile.json` and understand what it is doing, should any changes be required these changes should be made now.

> [!NOTE]
> The `queryFile.json` should be in extended json format. Aggregations can be used.

# Running
1. Export the source cluster connection string
```export $MONGODB_URI_DUMP=<source connection URI>```
  - e.g. *mongodb+srv://username:password@cluster1.abcde.mongodb.net/* **This may vary based on the authentication method**

1. Export the target cluster connection string
```export $MONGODB_URI_RESTORE=<target connection URI>```

1. From the location where the dump files will be stored, in your terminal copy and paste all of `executionCommand.sh` *or* make the `executionCommand.sh` executable and run the file.

1. Monitor the output of the script for progress.
> [!NOTE]
> Dump logs will be stored in `dumplogs.out` and Restore logs will be stored in `restorelogs.out` for future reference

> [!IMPORTANT]
> Currently, the Mongo Restore command will not exit on failure when inserting documents e.g. `duplicate key error`. This can be changed, see [Mongo Restore Options](https://www.mongodb.com/docs/database-tools/mongorestore/#std-option-mongorestore.--stopOnError)

# Constructing Dump/ Restore command

If not using SCRAM-SHA connectivity, additional options will need to be defined in the Mongo Dump command in `executionCommand.sh`. See here for details: https://www.mongodb.com/docs/database-tools/mongodump/#std-option-mongodump.--sslCAFile 

If not using SCRAM-SHA connectivity, additional options will need to be defined in the Mongo Restore command in `executionCommand.sh`. See here for details: https://www.mongodb.com/docs/database-tools/mongorestore/#std-option-mongorestore.--sslCAFile

If using anything other than SCRAM-SHA the authentication method will need to be defined in both Restore and Dump commands, see here: https://www.mongodb.com/docs/database-tools/mongodump/#std-option-mongodump.--authenticationMechanism

# Links
Mongo Dump documentation: https://www.mongodb.com/docs/database-tools/mongodump/
Mongo Restore documentation: https://www.mongodb.com/docs/database-tools/mongorestore/
