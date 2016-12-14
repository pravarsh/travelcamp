FROM python:2.7

ENV http_proxy http://www-proxy.idc.oracle.com:80
ENV https_proxy http://www-proxy.idc.oracle.com:80

RUN env

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/

COPY . /usr/src/app

RUN pip install --proxy=https://www-proxy.idc.oracle.com:80 -v --no-cache-dir -r requirements.txt

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
CMD ./entrypoint.sh
