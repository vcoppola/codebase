\c monitoring

create table validation_log(
log_id serial primary key,
type text,
name text not null,
count_field int not null,
date_field_name text,
date_field timestamp with time zone,
int_field_name text,
int_field int,
run_time timestamp with time zone default now());


create table query_group(
group_name text, 
database_type text, 
name text,
query text, 
date_name text,
int_name text);

COMMENT ON TABLE validation_log IS 'queries log. DOP-2713 where we store output of queries';
COMMENT ON TABLE query_group IS 'List of queries we run. DOP-2713';
