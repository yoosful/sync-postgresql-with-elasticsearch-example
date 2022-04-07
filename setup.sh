# create indices with mappings
# curl -i -X DELETE -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/users
curl -i -X PUT -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:9200/users -d @reqs/mappings/users.json

curl http://localhost:9200/users/_search?pretty

docker-compose exec postgres bash -c 'psql -U $POSTGRES_USER $POSTGRES_DATABASE'

# setup connections
curl -i -X GET -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/
# curl -i -X DELETE -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/es-sink-users
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @reqs/connections/es-sink-users.json

# curl -i -X DELETE -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/test_db-connector
curl -i -X POST -H "Accept:application/json" -H  "Content-Type:application/json" http://localhost:8083/connectors/ -d @reqs/connections/source.json
