backend:
	cd backend && docker build -t networkmap-backend ./

frontend:
	cd frontend && docker build -t networkmap-frontend ./

run:
	docker-compose build
	docker-compose up
