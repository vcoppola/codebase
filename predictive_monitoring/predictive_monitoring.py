import keyring
import yaml
from sys import platform
import psycopg2
import snowflake.connector
import argparse
from argparse import ArgumentParser

def extant_file(x):
    if not os.path.exists(x):
        raise argparse.ArgumentTypeError("{0} does not exist".format(x))
    return x

parser = ArgumentParser(description="Please provide your Inputs as -g <run_group> -d <database_type: 'sno' or 'pg'>")
parser.add_argument("-g", dest="run_group", required=True, metavar="STRING")
parser.add_argument("-d", dest="database_type", required=True, metavar="STRING")

args = parser.parse_args()

run_group = args.run_group
db_type = args.database_type

stream = open("predictive_monitoring_config.yaml", 'r')
dict = yaml.safe_load(stream)

sno_user = dict.get('sno_user')
sno_pass = dict.get('sno_pass')
pg_user = dict.get('pg_user')
pg_pass = dict.get('pg_pass')

ctx = snowflake.connector.connect(
    user=sno_user,
    password=sno_pass,
    account=sno_account,
    authenticator=sno_authenticator,
    warehouse=sno_warehouse, 
    database='PROD_LEGACY'

,
    role='ETL_DATAOPS_ODS'
    )
cs = ctx.cursor()

connection = psycopg2.connect(user=pg_user,
                                  password=pg_pass,
                                  host="spgdb_odc_ro.hosting.ondeck",
                                  port="5432",
                                  database="odc"
				)

conn = psycopg2.connect(user=pg_user,
                                  password=pg_pass,
                                  host="s5pdb014",
                                  port="5432",
                                  database="monitoring")

try:
   cursor = connection.cursor()
   crsr = conn.cursor()

   group_query = "select * from query_group where group_name='{}'".format(str(run_group)) + "and database_type='{}';".format(str(db_type))
   crsr.execute(group_query)
  
#Postgres Table Check

   if db_type == 'pg': 
      query_data=crsr.fetchall()
      for qd in query_data:
         cursor.execute(qd[3])
         result_pg=cursor.fetchall()
         for pg_val in result_pg:
             ins_query_pg = "insert into validation_log values (DEFAULT, 'pg', %s, %s, %s, %s, %s, %s)"
             ins_val_pg = (qd[1], pg_val[0], qd[4], pg_val[1], qd[5], pg_val[2])
             crsr.execute(ins_query_pg, ins_val_pg)
             conn.commit()
             count=crsr.rowcount
             print(count, " pg record inserted")

#Snowflake Table check
   elif db_type == 'sno':
      query_data=crsr.fetchall()
      for qd in query_data:
         cs.execute(qd[3])
         result_sno=cs.fetchall()
         for sno_val in result_sno:
            ins_query_sno = "insert into validation_log values (DEFAULT, 'sno', %s, %s, %s, %s, %s, %s)"
            ins_val_sno = (qd[1], sno_val[0], qd[4], sno_val[1], qd[5], sno_val[2])
            crsr.execute(ins_query_sno, ins_val_sno)
            conn.commit()
            count=crsr.rowcount
            print(count, " sno record inserted")

   else:
     print("Incorrect database_type provided: " + db_type)
     exit()


   crsr.execute("select * from validation_log;")
   count_data=crsr.fetchall()
   for rd in count_data:
       print("| log_id | db_type | tbl_name | count | date_field_name | max_date | int_field_name | Int_value | run_time | \n")
       print(rd[0], rd[1], rd[2], rd[3], rd[4], rd[5], rd[6], rd[7], rd[8])

except (Exception, psycopg2.Error) as error :
    print ("Error while fetching data from PostgreSQL", error)

finally:
    #closing database connection.
    if(connection):
        cursor.close()
        connection.close()
        print("PostgreSQL RO connection is closed")
    if(conn):
        crsr.close()
        conn.close()
        print("PostgreSQL local RW connection is closed")
    cs.close()
ctx.close()
