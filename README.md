# Dockerized Supervisor Django

Install Django, Celery, Celery Beat and Redis in a single docker container.
Use supervisor to manage multiple processes.

Multiple services/processes should be installed in multiple containers using docker-compose.

I had to use a single container for a particular case.

## Install python dependencies and activate virtualenv

```bash
python3.11 -m venv venv --upgrade-deps
source ./venv/bin/activate
```

## Initialize database

```
python manage.py migrate
```

## Create superuser (needed to access django admin)

```bash
python manage.py createsuperuser
```

## Build docker image

```bash
docker build -t supervisor-django:1.0 .
```

## Run the container

```bash
docker run -p 8000:8000 --name supervisor-django-container supervisor-django:1.0
```

## Stop the container

```bash
docker stop supervisor-django-container
```

## Remove the container

```bash
docker rm -f supervisor-django-container
```
