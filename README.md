** Remark: Step 1, 2, 3 only need to run one time. Unless those base image file update no need to build those image again **

step 1. Build base centos

```
docker build -f ./docker/base-centos/Dockerfile -t base-centos . 
```

step 2. Build base nginx

```
docker build -f ./docker/base-nginx/Dockerfile -t base-nginx .
```

step 2. Build base php

```
docker build -f ./docker/base-php/Dockerfile -t base-php .
```

step 4. run the app

```
docker-compose up
```