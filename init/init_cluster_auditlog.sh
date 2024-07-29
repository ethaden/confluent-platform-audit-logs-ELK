#!/bin/bash

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic confluent-audit-log-events \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic confluent-audit-log-events-produce \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic confluent-audit-log-events-consume \
  --partitions 1
