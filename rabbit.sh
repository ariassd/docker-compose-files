echo 'creating network'
docker network create rabbitmq_net

TAG=''

echo 'starting rabbit'
# docker run -d --network rabbitmq_net --hostname rabbitmqhost --name rabbitmq -p 15672:15672 -p 5672:5672 rabbitmq:3-management
docker run \
  -d \
  --network rabbitmq_net \
  --hostname rabbitmqhost \
  --name rabbitmq \
  -v "${PWD}/rabbitmq-data/data:/var/lib/rabbitmq" \
  -v "${PWD}/rabbitmq-data/logs:/var/log/rabbitmq" \
  -p 15672:15672 \
  -p 5672:5672 \
  rabbitmq:3-management

echo 'open http://localhost:15672 to start'
echo 'User and password:  guest / guest'

