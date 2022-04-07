#https://raw.githubusercontent.com/debezium/debezium-examples/master/unwrap-smt/debezium-jdbc-es/Dockerfile

FROM debezium/connect:1.0
ENV KAFKA_CONNECT_JDBC_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-jdbc

ARG POSTGRES_VERSION=42.2.8
ARG KAFKA_JDBC_VERSION=5.3.1

# Deploy PostgreSQL JDBC Driver
RUN cd /kafka/libs && curl -sO https://jdbc.postgresql.org/download/postgresql-$POSTGRES_VERSION.jar

# Deploy Kafka Connect JDBC
RUN mkdir $KAFKA_CONNECT_JDBC_DIR && cd $KAFKA_CONNECT_JDBC_DIR &&\
    curl -sO http://packages.confluent.io/maven/io/confluent/kafka-connect-jdbc/$KAFKA_JDBC_VERSION/kafka-connect-jdbc-$KAFKA_JDBC_VERSION.jar

# Deploy Confluent Elasticsearch sink connector
# outdated reference) https://github.com/debezium/debezium-examples/blob/main/unwrap-smt/debezium-jdbc-es/Dockerfile
# ES 7.xx compatible) https://www.confluent.io/hub/confluentinc/kafka-connect-elasticsearch

ENV KAFKA_CONNECT_ES_DIR=$KAFKA_CONNECT_PLUGINS_DIR/kafka-connect-elasticsearch
WORKDIR $KAFKA_CONNECT_ES_DIR
COPY ./confluentinc-kafka-connect-elasticsearch-11.1.8/lib/* $KAFKA_CONNECT_ES_DIR