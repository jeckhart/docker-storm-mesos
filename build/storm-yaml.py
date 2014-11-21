#!/usr/bin/env python

from os import environ as env
import yaml

struct = {
	"mesos.master.url": env["MESOS_MASTER_URL"],
	"storm.zookeeper.servers": map(str.strip,env["STORM_ZK_SERVERS"].split(",")),
	"nimbus.host": "localhost",
	"mesos.executor.uri": env["MESOS_EXECUTOR_URI"],
	# Use Netty to avoid ZMQ dependencies
	"storm.messaging.transport": "backtype.storm.messaging.netty.Context",
	"storm.local.dir": env["STORM_LOCAL_DIR"],

	"mesos.framework.role": "*",
	"mesos.framework.checkpoint": False

}

print yaml.dump(struct,default_flow_style=False,indent=2)
