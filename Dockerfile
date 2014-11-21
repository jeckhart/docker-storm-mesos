FROM jeckhart/docker-yodle-java7
MAINTAINER John Eckhart "jeckhart@yodle.com"

ENV MIRROR http://downloads.mesosphere.io/storm/
ENV RELEASE 0.9.2-incubating
ENV MESOS_EXECUTOR_URI ${MIRROR}storm-mesos-${RELEASE}.tgz
ENV STORM_LOCAL_DIR storm-local

ADD build /build/docker-storm-mesos

RUN /build/docker-storm-mesos/storm-mesos.sh && /build/docker-yodle-base/cleanup.sh

ENTRYPOINT ["/build/docker-storm-mesos/run-storm-mesos.sh"]

EXPOSE 8080

CMD [""]