alter user postgres with password 'changeme';

CREATE DATABASE bench1;
\c bench1
create user bench1 with password 'changeme';
GRANT ALL PRIVILEGES ON DATABASE bench1 to bench1;

