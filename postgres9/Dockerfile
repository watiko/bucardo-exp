FROM postgres:9.6

RUN \
     apt update \
  && apt install -y postgresql-plperl-9.6 \
  && rm -rf /var/lib/apt/lists/*
