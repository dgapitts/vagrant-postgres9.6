--https://stackoverflow.com/questions/7389416/postgresql-how-to-pass-parameters-from-command-line
--psql -v v1=12 -v v2="'Hello World'"

--alter user postgres with password :v1;
alter user bench1 with password :v1;
