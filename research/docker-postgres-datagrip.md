# Setting up docker db and access through DataGrip

## Prerequisites

- Docker
- Datagrip

### Download postgres image

- Create docker container
- In this example, password is the password for the postgres user
- postgres-spring we are given the name of the container

```shell script
sudo docker run --name postgres-spring -e POSTGRES_PASSWORD=password -d -p 5432:5432 postgres
```

- Start docker and exec

```shell script
      docker exec -it 643605b266d9  bin/bash
```

- Accessing to postgres CLI

```shell script
psql -U postgres
```

- **Basic commands**
    - ```\l``` List db's 
    - ```CREATE DATABASE bad115 ENCODING 'utf8'``` 
    - ```\c demodb``` connect to demodb database
    - ```\dt``` look for tables in db
    - ```\d tablename``` to describe a table
    
- Run application.

You will see inside docker:
![result](result.png)

### Connecting through DataGrip:

![result](connecting.png)
