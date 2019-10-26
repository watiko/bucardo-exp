FROM postgres:11

RUN \
     apt update \
  && apt install -y postgresql-plperl-11 \
  && rm -rf /var/lib/apt/lists/*
