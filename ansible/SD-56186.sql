\o SD-56186.log

CREATE USER eguirre;
CREATE USER inaoumov;
CREATE USER vkalashnikova;

BEGIN;
CREATE GROUP dingos WITH USER eaguirre,ianaoumov,vkalashnikova;
COMMIT;

BEGIN;
--p6pdb010
GRANT meh_ro_group TO dingos;
GRANT mpp_ro_group TO dingos;
COMMIT;


--p6pdb012
--GRANT calico_ro_group TO dingos;
--GRANT odc_ro_group TO dingos;
--COMMIT;

--p6pdb018
--GRANT jobs_ro_group TO dingos;
--COMMIT;

\q
