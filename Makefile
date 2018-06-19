local_step_1:
	docker-compose build
	docker-compose up -d neo4j

local_step_2:
	docker-compose up -d redis mysql
	docker-compose up -d networkmap-backend

local_step_3:
	docker exec -it networkmap_networkmap-backend_1 bash

local_step_4:
	docker-compose up -d networkmap-frontend
