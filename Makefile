build_backend:
	cd backend && docker build -t network-map-backend .

build_wordpress:
	wget https://wordpress.org/latest.tar.gz
	tar zxf latest.tar.gz
	mv latest wordpress
	ln -s wp_theme worpress/wp-content/themes/networmap

build: build_backend build_wordpress
	docker-compose build

run:
	docker-compose up
