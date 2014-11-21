#!/bin/bash

set -e
set -x

if [ "x" = "x${STORM_ZK_SERVERS}" ] && [ "x" != "x${EXHIBITOR_URL}" ]; then
  STORM_ZK_SERVERS=$(curl -s ${EXHIBITOR_URL}/exhibitor/v1/cluster/list | python -c 'import sys, json;j=json.load(sys.stdin);servers=[\":\".join([s, str(j[\"port\"])]) for s in j[\"servers\"]];print \",\".join(servers)')
fi

#echo -e "$(eval "echo -e \"`</build/docker-storm-mesos/storm.yaml`\"")" > /usr/local/storm/conf/storm.yaml
#python -c 'from string import Template; import os; f=open("/build/docker-storm-mesos/storm.yaml"); print Template(f.read()).substitute(os.environ); f.close()' > /usr/local/storm/conf/storm.yaml
$(dirname $0)/storm-yaml.py > /usr/local/storm/conf/storm.yaml

cd /usr/local/storm

( sleep 10; ./bin/storm ui ) &
./bin/storm-mesos nimbus
