python manage.py makemigrations travel_html
python manage.py sqlmigrate travel_html 0001
python manage.py migrate
python manage.py runserver 0.0.0.0:8000

