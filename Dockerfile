# pull official base image
FROM python:3.11.4-bookworm

RUN apt-get update && apt-get install -y supervisor redis
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /var/log/redis
RUN mkdir -p /var/log/celery
COPY ./supervisord.conf /etc/

# set work directory
WORKDIR /app

# set environment variables
# prevents Python from writing pyc files to disc (equivalent to python -B option)
ENV PYTHONDONTWRITEBYTECODE 1
# prevents Python from buffering stdout and stderr (equivalent to python -u option)
ENV PYTHONUNBUFFERED 1

ENV PORT 8000

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .
RUN chmod -R 777 /app

RUN chmod +x /app/entrypoint.sh


ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
