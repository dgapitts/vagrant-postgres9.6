alter user postgres with password 'qwe123';

CREATE DATABASE bench1;
\c bench1
create user bench1 with password 'qwe123';
GRANT ALL PRIVILEGES ON DATABASE bench1 to bench1;

