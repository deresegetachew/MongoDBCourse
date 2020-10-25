echo "setting up replication"
mongo --host mongodb1:27017 <<EOF
   var cfg = {
        "_id": "training_replica_set",
        "version": 1,
        "members": [
            {
                "_id": 0,
                "host": "mongodb1:27017",
                "priority":5
            },
            {
                "_id": 1,
                "host": "mongodb2:27017",
            },
            {
                "_id": 2,
                "host": "mongodb3:27017",
            }
        ]
    };
    rs.initiate(cfg);
    rs.reconfig(cfg,{force:true});
EOF
echo "finished replication"