FROM ubuntu:19.10

# for tzdata
ENV DEBIAN_FRONTEND=noninteractive

RUN \
     apt update -y \
  && apt install --no-install-recommends -y \
    bucardo \
    postgresql-11 \
    postgresql-plperl-11 \
  && apt clean \
  && rm -rf rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
     sed -i '1i''host all bucardo 127.0.0.1/32 trust' /etc/postgresql/11/main/pg_hba.conf \
  && service postgresql start \
  && su - postgres -c 'createuser -s bucardo' \
  && su - bucardo  -c 'bucardo install --batch' \
  && su - bucardo  -c 'bucardo show all || :' \
  && service postgresql stop

ENTRYPOINT [ "bash", "-c", "service postgresql start && exec $0 $@" ]
