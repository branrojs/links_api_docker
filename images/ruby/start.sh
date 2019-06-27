#! /bin/bash

cd /app
if [ ! -e .initialized ] ; then
	echo update bundler
	gem install bundler
	echo Setting up database
	./bin/rails db:setup
	touch .initialized
else
	echo Application already configured
fi
echo Run bundle update again
bundle update
echo Ejecutando servicio Web
rm -f /app/tmp/pids/server.pid
echo Creating database
rails db:create
rails db:migrate
rails s -b 0.0.0.0

