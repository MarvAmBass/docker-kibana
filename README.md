# Docker ELK-Stack Container - Kibana
_maintained by MarvAmBass_

[FAQ - All you need to know about the marvambass Containers](https://marvin.im/docker-faq-all-you-need-to-know-about-the-marvambass-containers/)

## What is it

This Dockerfile (available as ___marvambass/kibana___) gives you a ready to use Kibana Container for your ELK stack or something else.

View in Docker Registry [marvambass/kibana](https://registry.hub.docker.com/u/marvambass/marvambass/kibana/)

View in GitHub [MarvAmBass/docker-kibana](https://github.com/MarvAmBass/docker-kibana)

## Running marvambass/kibana Container

You need to know, that kibana stores it's configuration / dashboard and settings inside of your elasticsearch.
So this container doesn't need anything special to be persistent. Just be sure to have a persistent elasticsearch instance running - if you need persistence.

First of all you could start my [elasticsearch container](https://github.com/MarvAmBass/docker-elasticsearch) (Kibana needs a Elasticsearch instance to work) like this:

    docker run -d \
    --name elasticsearch \
    -v "$PWD/esdata":/usr/share/elasticsearch/data
    marvambass/elasticsearch

Now the Kibana part:

    docker run -d \
    --link elasticsearch:elasticsearch \
    -p 5601:5601 \
    marvambass/kibana
    
_we create a new container and link it to our elasticsearch instance by the name __elasticsearch__, we also expose port 5601 to connect to our kibana application_

## Based on

This Dockerfile is based on my [marvambass/oracle-java8](https://registry.hub.docker.com/marvambass/oracle-java8) Image.
