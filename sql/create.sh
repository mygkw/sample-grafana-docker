#/bin/bash

# mysql -ppassword -e "drop database covid19"

mysql -ppassword < /tmp/sql/ddl.sql
mysql -ppassword covid19 < /tmp/sql/pcr_positive_daily.sql
mysql -ppassword covid19 < /tmp/sql/pcr_tested_daily.sql
mysql -ppassword covid19 < /tmp/sql/death_total.sql
