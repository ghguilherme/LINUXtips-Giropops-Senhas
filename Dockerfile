FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install pip git -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./giropops-senhas /app

WORKDIR /app

RUN pip install --no-cache-dir -r requirements.txt

ENV REDIS_HOST redis

EXPOSE 5000

CMD ["flask", "run", "--host", "0.0.0.0"]
