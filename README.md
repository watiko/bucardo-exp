## try

### terminal A:

```bash
$ docker-compose up -d postgres{9,11}
$ docker-compose run --rm clean
$ docker-compose run --rm init
$ docker-compose run --rm bucardo
docker#
```

### terminal B:

```bash
$ docker-compose run --rm psql
docker# psql service=a < /sql/delta.sql
docker# psql service=a -c 'SELECT (SELECT count(*) FROM users) AS users, (SELECT count(*) FROM todos) AS todos'
 users | todos 
-------+-------
     4 |    15
(1 row)

docker# psql service=b -c 'SELECT (SELECT count(*) FROM users) AS users, (SELECT count(*) FROM todos) AS todos'
 users | todos 
-------+-------
     3 |    10
(1 row)
```

### terminal A:

```bash
docker# bucardo start
```

### terminal B:

```bash
docker# psql service=a -c 'SELECT (SELECT count(*) FROM users) AS users, (SELECT count(*) FROM todos) AS todos'
 users | todos 
-------+-------
     4 |    15
(1 row)

docker# psql service=b -c 'SELECT (SELECT count(*) FROM users) AS users, (SELECT count(*) FROM todos) AS todos'
 users | todos 
-------+-------
     4 |    15
(1 row)
```

### terminal A:

```bash
docker# tail -f /var/log/bucardo/log.bucardo
```

check whether replication completed

```bash
docker# bucardo stop
docker# pg_dump service=a --schema=public --section=post-data | psql -q service=b
docker# bucardo remove sync migrate_db
docker# bucardo remove db A B --force
```
