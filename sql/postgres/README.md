# PostgreSQL

###### Create schema & user
1. CREATE SCHEMA IF NOT EXISTS [schema];
2. CREATE USER [username] WITH PASSWORD '[password]';
3. GRANT CONNECT ON DATABASE [database] TO [username];
4. GRANT ALL PRIVILEGES ON SCHEMA [schema] TO [username];
