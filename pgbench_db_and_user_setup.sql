CREATE DATABASE bench1;
\connect bench1
create user bench1 with password 'bench1';
GRANT ALL PRIVILEGES ON DATABASE bench1 to bench1;
