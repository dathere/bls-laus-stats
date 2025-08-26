# Dockerfile
FROM python:3.9-slim

WORKDIR /app

# Copy directories first
COPY laus-fetchers/ ./laus-fetchers/
COPY series-ids/ ./series-ids/

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy and setup entrypoint
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Create output directory
RUN mkdir -p /app/output

CMD ["./entrypoint.sh"]
