FROM debian:latest

ENV ELASTIC_URL=http://elasticsearch:9200/logs/_delete_by_query \
    AUTH_TOKEN=ZWxhc3RpYzpjaGFuZ2VtZQ== \
    CRON_LOG=/var/log/cron.log

RUN apt-get update && apt-get install -y \
    cron \
    curl \
    && apt-get clean

COPY logrotation.sh /usr/local/bin/logrotation.sh
RUN chmod +x /usr/local/bin/logrotation.sh

# Set up the cron job
RUN echo "0 0 * * * curl --location "$ELASTIC_URL" --header "Content-Type: application/json" --header "Authorization: Basic $AUTH_TOKEN" --data '{"query": {"match_all": {}}}' >> $CRON_LOG 2>&1" > /etc/cron.d/delete_logs
RUN chmod 0644 /etc/cron.d/delete_logs && crontab /etc/cron.d/delete_logs
RUN touch $CRON_LOG && chmod 0666 $CRON_LOG

# monitoring
HEALTHCHECK --interval=30s --timeout=10s \
    CMD curl --silent --fail "$ELASTIC_URL" || exit 1

ENTRYPOINT ["/usr/local/bin/logrotation.sh"]
