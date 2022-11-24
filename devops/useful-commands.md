### PostgreSQL
1. Start container
  ````
  docker run --name IDK-DB -p 5432:5432 -e POSTGRES_USER=idk_user -e POSTGRES_PASSWORD=idk_password -e POSTGRES_DB=idk_db -d postgres:latest
  ````
2. Connect
  ````
  docker exec -it <id> psql -U <username> -d <database>
  ````