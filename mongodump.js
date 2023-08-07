var ignoreDBs = ["admin","local","config","system"];

var dbs = db.getMongo().getDBs().databases.filter(function(dbb) {
    return ignoreDBs.indexOf(dbb.name) == -1
});

var ns=""
dbs.forEach(function(dbData) {
    var name = dbData.name;
    var database = db.getSiblingDB(name);
    var collections = database.getCollectionNames();
    collections.forEach(function(collectionName){
        ns+=name+'.'+collectionName+' '
        });
});
// return the all list of ns
print(`${ns}`);