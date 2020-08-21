#!/bin/bash
/root/bin/cqlsh 10.1.1.3 -f /initks.cql
#/root/bin/cqlsh 10.1.1.3 -f /initdb.cql
echo "Boodskap platform will initialize the tables and indexes at the first startup"
