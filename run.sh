#! /bin/bash

if [ ! -d "app" ] ; then
	echo "Checking out consul code..."
	git clone https://github.com/branrojs/LinksApi.git app
else
	echo "Pulling latest changes..."
	cd app ; git pull ; cd ..
fi

if [ ! -e app/config/database.yml ]; then
	echo "Initializing linksapi for 1rst run..."
	cp app/config/database.yml.example app/config/database.yml
	cp app/config/secrets.yml.example app/config/secrets.yml
	sed -i "s/localhost/dbp/g" app/config/database.yml
	sed -i "s/username:/username: oveja/g" app/config/database.yml
	sed -i "s/password:/password: oveja/g" app/config/database.yml
	sed -i "s/linksApi_dev/consul/g" app/config/database.yml
fi

echo "Pls enter password to delete the server.pid (must)"
sudo rm -f ./app/tmp/pids/server.pid
echo "Starting environment..."
cd compose && docker-compose up
