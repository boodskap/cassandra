#!/bin/bash
echo "Initialinging database...."
/root/bin/cqlsh 10.1.1.3 -f /initks.cql
/root/bin/cqlsh 10.1.1.3 -f /initdb.cql
