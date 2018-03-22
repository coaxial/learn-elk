#!/usr/bin/env bash
curl -XGET 'localhost:9200/_cat/indices?v&pretty'

curl -XPUT 'localhost:9200/logstash-2015.05.18?pretty' \
  -H 'Content-Type: application/json' \
  -d '{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}'

curl -XPUT 'localhost:9200/logstash-2015.05.19?pretty' \
  -H 'Content-Type: application/json' \
  -d '{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}'

curl -XPUT 'localhost:9200/logstash-2015.05.20?pretty' \
  -H 'Content-Type: application/json' \
  -d '{
  "mappings": {
    "log": {
      "properties": {
        "geo": {
          "properties": {
            "coordinates": {
              "type": "geo_point"
            }
          }
        }
      }
    }
  }
}'

curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/bank/account/_bulk?pretty' --data-binary @accounts.json
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/shakespeare/doc/_bulk?pretty' --data-binary @shakespeare_6.0.json
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/_bulk?pretty' --data-binary @logs.jsonl
curl -XGET 'localhost:9200/_cat/indices?v&pretty'
