#!/bin/bash

ansible -f 8 -i prod p6pdb011 -u vcoppola --become --become-user postgres -K -m shell -a "psql -c 'CREATE USER eaguirre; CREATE USER inaoumov; CREATE USER vkalashnikova; BEGIN; CREATE GROUP dingos WITH USER eaguirre,inaoumov,vkalashnikova; GRANT meh_ro_group TO dingos; GRANT mpp_ro_group TO dingos; COMMIT;'"

ansible -f 8 -i prod p6pdb013 -u vcoppola --become --become-user postgres -K -m shell -a "psql -c 'CREATE USER eaguirre; CREATE USER inaoumov; CREATE USER vkalashnikova; BEGIN; CREATE GROUP dingos WITH USER eaguirre,inaoumov,vkalashnikova; GRANT calico_ro_group TO dingos; GRANT odc_ro_group TO dingos; COMMIT;'" 

ansible -f 8 -i prod p6pdb018 -u vcoppola --become --become-user postgres -K -m shell -a "psql -c 'CREATE USER eaguirre; CREATE USER inaoumov; CREATE USER vkalashnikova; BEGIN; CREATE GROUP dingos WITH USER eaguirre,inaoumov,vkalashnikova; GRANT jobs_ro_group TO dingos; COMMIT;'"
