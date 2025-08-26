# Dockerfile
FROM python:3.9-slim

WORKDIR /app

COPY laus-fetchers/ ./laus-fetchers/
COPY series-ids/ ./series-ids/

RUN pip install requests pandas

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
