docker-storm-mesos
==================

An image to launch [Storm Mesos][1] on top of a Mesos cluster

To build
--------
    docker build -t storm-mesos .

To run
------
Examples tested on on [vagrant-mesos][2] multinode on Virtualbox

    docker run -d -e STORM_ZK_SERVERS=172.31.0.11,172.31.0.12,172.31.0.13 -e MESOS_MASTER_URL=zk://172.31.0.11:2181,172.31.0.12:2181,172.31.0.13:2181/mesos -P storm-mesos

[1]: https://github.com/mesos/storm
[2]: https://github.com/everpeace/vagrant-mesos