#!/bin/bash

kafka-topics --command-config /clients/admin.conf \
  --bootstrap-server broker:9092 \
  --create \
  --topic test \
  --partitions 1

kafka-acls --bootstrap-server ${BOOTSTRAP_SERVER} \
  --command-config ${COMMAND_CONFIG_FILE} \
  --add \
  --allow-principal User:producer \
  --operation WRITE \
  --topic 'test'

kafka-acls --bootstrap-server ${BOOTSTRAP_SERVER} \
  --command-config ${COMMAND_CONFIG_FILE} \
  --add \
  --allow-principal User:consumer \
  --operation READ \
  --topic 'test' \
  --group 'consumer'
