FROM python:2.7

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt

COPY . /usr/src/app

RUN apt-get update && apt-get install -y \
        gcc \
        gettext \
        mysql-client libmysqlclient-dev \
        postgresql-client libpq-dev \
        sqlite3 \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

#RUN apt-get install -y postgresql postgresql-contrib

EXPOSE 8000
#makemigrations travel_html
#sqlmigrate travel_html 0001
#migrate
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]