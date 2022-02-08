CREATE USER IF NOT EXISTS 'regadmin' IDENTIFIED BY 'regadmin';

GRANT ALL privileges ON regdb.* TO 'regadmin'@'%';