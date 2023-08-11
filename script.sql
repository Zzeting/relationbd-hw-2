#Job 1
CREATE USER 'sys_temp'@'localhost' IDENTIFIED BY 'Pas1234567890!';

SELECT User FROM mysql.user;

GRANT ALL PRIVILEGES ON *.* TO 'sys_temp'@'localhost';

SHOW GRANTS FOR 'sys_temp'@'localhost';

ALTER USER 'sys_temp'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Pas1234567890!';

SHOW GRANTS FOR CURRENT_USER;

#Job2
SELECT t.TABLE_NAME, k.column_name INTO OUTFILE '/var/lib/mysql-files/text2.txt' FIELDS TERMINATED BY ':' ENCLOSED BY '"' LINES TERMINATED BY '\r\n'
FROM information_schema.table_constraints t
JOIN information_schema.key_column_usage k
USING(constraint_name,table_schema,table_name)
WHERE t.constraint_type='PRIMARY KEY'
  AND t.table_schema='sakila';
  
#Job3
REVOKE INSERT, UPDATE, DELETE ON *.* FROM 'sys_temp'@'localhost'
 
