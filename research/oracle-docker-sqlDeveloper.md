# Oracle and SQL Developer installation

## Prerrequisites

- [Docker](https://docs.docker.com/engine/install/ubuntu/) 

- [jdk 11](https://dev.to/thegroo/install-and-manage-multiple-java-versions-on-linux-using-alternatives-5e93) 

## Install Oracled docker:


```shell script
docker login
docker pull store/oracle/database-enterprise:12.2.0.1
docker run -d -p 1521:1521 --name oracle store/oracle/database-enterprise:12.2.0.1
```
- Wait for the container to be in healthy status

```shell script
docker exec -it oracle bash -c "source /home/oracle/.bashrc; sqlplus /nolog"
```

- Once inside the container
```sql
 connect sys as sysdba;
```
- Use this password ```Oradoc_db1```.

- Create user and gran privilegies:

```
sql
 alter session set "_ORACLE_SCRIPT"=true;
 create user dummy identified by dummy;
 GRANT ALL PRIVILEGES TO dummy;
```

- Set up hr schema:
```sql
https://docs.oracle.com/database/121/COMSC/installation.htm#COMSC001
```
- Download rpm file: 

## Set up sql developer
- [download rpm](https://www.oracle.com/tools/downloads/sqldev-v192-downloads.html)
```shell script
sudo add-apt-repository universe
sudo apt-get update
sudo apt-get install alien
cd <path_to_the_rpm_package>
sudo alien <name_of_package>.rpm
sudo dpkg -i <name_of_package>.deb
```

- Rin sqlDeveloper

```shell script
sqldeveloper
```


## Connecting:

Username: hr
Password: hr
Hostname: localhost
Port: 1521
Service name: ORCLCDB.localdomain

