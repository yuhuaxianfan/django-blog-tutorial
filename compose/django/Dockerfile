FROM python:3.5

ENV PYTHONUNBUFFERED 1

RUN groupadd -r django \
    && useradd -r -g django django

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY ./compose/django/gunicorn.sh /gunicorn.sh
RUN sed -i 's/\r//' /gunicorn.sh
RUN chmod +x /gunicorn.sh

COPY . /app

RUN mkdir /app/static
RUN mkdir /app/database
RUN python /app/manage.py migrate
RUN chown -R django /app

USER django

WORKDIR /app
