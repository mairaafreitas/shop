build-no-cache:
	docker build . --no-cache -t django-template_web:latest

bash:
	docker-compose run app bash

makemigrations:
	docker-compose run app python manage.py makemigrations

migrate:
	docker-compose run app python manage.py migrate

test:
	docker-compose run app python manage.py test

start:
	docker-compose up app

close:
	docker-compose down

createsuperuser:
	docker-compose run app python manage.py createsuperuser