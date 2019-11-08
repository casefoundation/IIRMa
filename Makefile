local_step_1:
	touch env/laravel.secret.env
	touch env/mysql.secret.env
	touch env/wordpress.secret.env
	docker-compose build
	docker-compose up -d neo4j

local_step_4:
	docker-compose up -d redis mysql
	docker-compose up -d networkmap-backend

local_step_8:
	docker-compose up -d networkmap-frontend

build_backend:
	cd backend && docker build -t networkmap-backend ./ 

build_frontend:
	cd frontend && docker build -t networkmap-frontend ./ 

start:
	docker-compose build
	docker-compose up -d
	