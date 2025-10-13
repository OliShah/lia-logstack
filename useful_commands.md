DUMMY DATA 
echo '{"message":"test log"}' | timeout 5s docker-compose exec -T vector vector

CHECK LOGS
docker logs -f vector

PING
docker-compose exec vector sh
ping opensearch-node1

HEALTHCHECK
curl -u admin:OpensearchAdmin123! http://localhost:9200/

TEST VECTOR-OPENSEARCH CONNECTION
docker-compose exec vector sh
apk add curl
curl http://opensearch-node1:9200

CONFIRM INDICES EXIST IN OPENSEARCH
curl -u admin:admin "http://elasticsearch:9200/_cat/indices?v"

TEST TO CREATE INDEX PATTERN IN OPENSEARCH
execute inside vector container
curl -u admin:admin -X POST "http://test-node1:9200/test-index/_doc" -H 'Cont
ent-Type: application/json' -d '{"message":"hello"}'

ADD CURL IN VECTOR
apt-get update && apt-get install -y curl

vector --config /etc/vector/vector.toml --watch-config

curl "http://test-node1:9200/vector-*/_count?pretty"

INSTALLING GRAFANA
docker exec -it opensearch-node1 ./bin/opensearch-plugin install https://github.com/aiven/prometheus-exporter-plugin-for-opensearch/releases/download/3.2.0.0/prometheus-exporter-3.2.0.0.zip
