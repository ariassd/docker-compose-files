# Docker compose files.

## Docker compose for mongo

Run a mongo database instance in a docker container.

```bash
docker stack deploy -c mongo.yml mongo
```

```bash
#alternative
sudo docker run -it -v /Volumes/Documents/docker/mongo-data:/data/db --name mongodb -d mongo
```

## Docker compose for postgres

Run a postgres instance in a docker container

```bash
docker stack deploy -c postgres.yml postgres
```

```bash
#Alternative
$ docker run -d \
    --name postgres \
    -e POSTGRES_PASSWORD=postgres \
    -e PGDATA=/var/lib/postgresql/data/pgdata \
    -v ./postgres-data:/var/lib/postgresql/data \
    postgres

```

## Docker compose for rabbit mq

Run a rabbit mq instance in a docker container

```bash
docker stack deploy -c rabbit.yml rabbitmq
```

start rabbitmq using CLI

```bash
docker network create rabbitmq_net
docker run -d --network rabbitmq_net --hostname rabbitmqhost --name rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3-management
```

Start rabbit using a bash file with persistence

```bash
sh rabbit.sh
```

## Docker couchbase using CLI

```bash
docker run -d --name db -p 8091-8094:8091-8094 -p 11210:11210 couchbase
```

# Common problems

### Mongo does not connect.

```bash

# remove stacks

docker swarm leave --force
docker swarm init

# run the stacks again

```

# Docker commands

Docker stack list

```bash
docker stack ls
```

Docker get container information

```bash
docker inspect <container_id>
         IPAddress
```

Docker remove stack

```bash
docker stack rm <stack_name>
```

Docker list containers

```bash
docker container ls
```

Docker list images

```bash
docker image ls
```

Docker stop container

```bash
docker stop <container_id>
```

Docker remove stopped containers

```bash
docker container prune
```

Docker image remove

```bash
docker rmi <id_image>
```

Remove auto-restart to container

```bash
docker update --restart=unless-stopped <container_id>
```

Docker run an interactive image

```bash
docker run -it <image> sh
```

DOCKER SWARM LEAVE

```bash
docker swarm leave
```

Get date from docker container

```bash
docker exec -it [container id] date
docker exec -it [container id] cat /etc/timezone
```

Login on terminal

```bash
docker login --username=your_username --email=name@email.com docker.io
docker login -u "myusername" -p "mypassword" docker.io
docker push myusername/myimage:0.0.1
```

Build image

```bash
docker build -t <username>/<image>:latest -f dockerfile .
docker push <username>/<image>:latest
```
