FROM marvambass/oracle-java8

RUN apt-get update; apt-get install -y \
    wget
    
RUN wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.1-linux-x64.tar.gz && \
    tar xvf kibana-*.tar.gz && \
    mkdir -p /opt/kibana && cp -R kibana-4*/* /opt/kibana/ && rm -rf kibana-4*;

RUN sed -i 's/^elasticsearch_url:.*/elasticsearch_url: "http:\/\/elasticsearch:9200"/g' /opt/kibana/config/kibana.yml

ENV PATH /opt/kibana/bin:$PATH

EXPOSE 5601

CMD ["kibana"]
