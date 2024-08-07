#!/bin/bash

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic test \
  --partitions 1

kafka-acls \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --add \
  --allow-principal User:producer \
  --operation WRITE \
  --topic 'test'

kafka-acls \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --add \
  --allow-principal User:consumer \
  --operation READ \
  --topic 'test' \
  --group 'consumer'
