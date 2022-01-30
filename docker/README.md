# Docker


## Run commands
1. PostgreSQL:
````
docker run --name IDK-DB -p 5432:5432 -e POSTGRES_USER=idk_user -e POSTGRES_PASSWORD=idk_password -e POSTGRES_DB=idk_db -d postgres:latest
````
