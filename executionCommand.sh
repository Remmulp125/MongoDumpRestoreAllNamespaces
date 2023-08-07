export NS=`mongosh $MONGODB_URI_DUMP --file <pathToMongoDump.js> --quiet`
for ns in $(echo "$NS")
do
  echo "Let's dump this : ${ns}"
  DB=`cut -d '.' -f1 <<<${ns}`
  COLL=`cut -d '.' -f2 <<<${ns}`
  `mongodump --uri=$MONGODB_URI_DUMP --db $DB --collection $COLL --ssl --authenticationDatabase admin --gzip --queryFile='<pathToQueryFile.json>'`
done > dumplogs.out
echo "Restore..."
`mongorestore --uri=$MONGODB_URI_RESTORE --gzip --writeConcern="{w:'majority'}" dump/` > restorelogs.out