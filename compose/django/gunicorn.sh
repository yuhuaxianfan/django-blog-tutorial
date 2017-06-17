#!/bin/sh
python /app/manage.py collectstatic --noinput
python /app/manage.py migrate
# chown -R django /database
/usr/local/bin/gunicorn blogproject.wsgi -w 4 -b 0.0.0.0:5000 --chdir=/app