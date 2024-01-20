# Introduction

## Installation

```bash
docker pull postgis/postgis:15-master
docker run --name TestPostGIS -p 5432:5432 -e POSTGRES_USER=idk_user -e POSTGRES_PASSWORD=idk_password -e POSTGRES_DB=idk_db -d postgis/postgis:15-master
```
Than configure database config as said [here](https://osm2pgsql.org/doc/manual.html#tuning-the-postgresql-server) 
or just upload config file
[postgresql.conf](postgresql.conf)

```bash
apt update
apt install postgis
apt install postgresql-15-pgrouting
apt install osm2pgrouting

osm2pgsql --hstore --slim -d uj -U idk_user -W -c C:\Users\novik\Custom\repos\UnfriendlyJarvis\UJCore\src\main\resources\sqltestdata\russia-latest.osm.pbf
```

```sql
create extension postgis;
create extension hstore;
create extension pgrouting;
```

Soooooooooooooooooooooo:
- We download and extract osm data using osm2pgsql
- There is a different tool named osm2pgrouting (or osm2po, differs but most of people said it's better), 
which imports data to create road network

pg_routing:  
- [Official tutorial](https://docs.pgrouting.org/3.0/en/pgRouting-concepts.html#id45)
- [createTopology tolerance](https://gis.stackexchange.com/questions/229452/pgr-createtopology-how-tolerance)
- [workshop tolerance v2](https://workshop.pgrouting.org/2.2.10/en/chapters/topology.html)

Интересные статьи:
- [Habr (RU)](https://habr.com/en/companies/domclick/articles/558876/)
- [Stackoverflow question about different tools osm2...](https://stackoverflow.com/questions/40599132/routing-network-from-osm)
- [postgis-action](./postgis-action-3rd.pdf)  
- [mastering postgis](./MASTERING_POSTGIS.pdf)  
- need a book *Mastering PostGIS and OpenStreetMap*
- also need *Spatial SQL
  A Practical Approach to Modern GIS Using SQL
  by Matthew Forrest*