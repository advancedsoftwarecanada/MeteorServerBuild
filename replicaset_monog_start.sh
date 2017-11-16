sudo mongo --port 27017 --eval 'db.adminCommand("shutdown")'

#This looks weird because it's on a deifferent partition, formatted for Mongo Speed
sudo mongod --port 27017 --replSet rs0 --logpath /dev/null --logappend --fork --dbpath /media/mongo_drive/sco/rs0_1 --rest --httpinterface --wiredTigerEngineConfigString="cache_size=12000M"
