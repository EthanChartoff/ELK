# ELK on Docker
an ELK stack for poopziz :)

## tl;dr

```sh
docker compose up setup
```

```sh
docker compose up
```

By default, the stack exposes the following ports:

* 5044: Logstash Beats input
* 50000: Logstash TCP input
* 9600: Logstash monitoring API
* 9200: Elasticsearch HTTP
* 9300: Elasticsearch TCP transport
* 5601: Kibana
