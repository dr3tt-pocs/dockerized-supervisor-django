#!/bin/sh

python manage.py migrate --no-input

# Exec CMD
exec "$@"
