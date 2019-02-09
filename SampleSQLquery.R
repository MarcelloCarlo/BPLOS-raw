install.packages("RMariaDB")
install.packages("sqldf")
install.packages("RMySQL",type="source")
library(RMariaDB)
library(sqldf)
require(RMySQL)


#working
#Linux
con <- dbConnect(RMySQL::MySQL(), host = "localhost",dbname="lgu_paeis_db",user = "root",unix.sock="/opt/lampp/var/mysql/mysql.sock")
#Windows
con <- dbConnect(RMySQL::MySQL(), host = "localhost",dbname="lgu_paeis_db",user = "root",unix.sock="/MysteryUnsolved/mysql.sock")

#current working line
dat <-dbSendQuery(con, 'SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM bpls_t_official_receipt WHERE YEAR(OR_DATE) = 2019')
dbDisconnect(con)
data <- fetch(dat, n=10)
dbClearResult(dat)
print(data)
head(data)
#trashcan

sqldf('SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM `bpls_t_official_receipt` WHERE YEAR(OR_DATE) = 2019',dbname= getOption("RMysql.lgu_paeis_db"),user = "root",password ="", host="localhost",port=3306)
dbListTables(storiesDb)

sqldf('SELECT SUM(OR_TOTAL_AMOUNT) AS G FROM bpls_t_official_receipt WHERE YEAR(OR_DATE) = 2019',
      dbname = "lgu_paeis_db", drv = "MySQL", 
      user="root", password = "", host = "localhost", port=3306,
      verbose = isTRUE(getOption("sqldf.verbose")))
