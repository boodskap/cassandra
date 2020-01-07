#!/bin/bash

sudo sysctl -p /etc/sysctl.d/99-z01-sysctl.conf

/root/bin/cassandra -R

sleep 10

nc -z 10.1.1.3 9042

while [ $? -ne 0 ]
do
  sleep 10
  nc -z 10.1.1.3 9042
done

/initdb.sh

echo "Cassandra startup done."

/bin/bash -c "trap : TERM INT; sleep infinity & wait"
