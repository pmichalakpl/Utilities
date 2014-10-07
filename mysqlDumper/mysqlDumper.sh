
# name of database user ( must have LOCK_TABLES rights )...

dbUsername=""

 

# password of database user...

dbPassword=""

 

# path to backup directory...

dbBackup=""

# name of dump datebase

dbName=""

# *************************************************************

# program action...

 

# get current date

date=$( date +%Y-%m-%d-%H:%M)
 

# create backup directory if not exists...

[ ! -d "$dbBackup" ]  && mkdir -p $dbBackup

 

mysqldump -u $dbUsername --password=$dbPassword --opt --databases $dbName | gzip -9 >${dbBackup}/${date}.sql.gz
echo "Mysql dump created success in ${dbBackup}/${date}.sql.gz"
