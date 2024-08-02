#!/bin/bash

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic 'confluent-audit-log-events' \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic 'confluent-audit-log-events-produce' \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic confluent-audit-log-events-consume \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic 'confluent-audit-log-events-describe' \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic 'confluent-audit-log-events-management' \
  --partitions 1

kafka-topics \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --create \
  --topic 'confluent-audit-log-events-combined' \
  --partitions 1

kafka-acls \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --add \
  --allow-principal 'User:auditlogproducer' \
  --operation WRITE \
  --topic 'confluent-audit-log-events' \
  --resource-pattern-type 'PREFIXED'

kafka-acls \
  --command-config ${COMMAND_CONFIG_FILE} \
  --bootstrap-server ${BOOTSTRAP_SERVER} \
  --add \
  --allow-principal 'User:auditlogconsumer' \
  --operation READ \
  --topic 'confluent-audit-log-events' \
  --group 'confluent-audit-log-events' \
  --resource-pattern-type 'PREFIXED'
