#Information about files:
## Run.sh
* Pulls the code from https://github.com/branrojs/LinksApi.git, set configuration to the database, request the password due to a sudo command to delete the pids to build up the api services. Finally, starts the docker-compose file.

## /Compose
* It contains the docker-compose file. This is set to version 3, Linkapp is the api, this will search the ruby image (2.5.5v). The dbp is the database from postgresql with the parameters.

## /Images
* It contains the Dockerfiles and the start.sh. The Dockerfile will set the image to the 2.5.5v of ruby, checks for the versions of ruby, Rubygems, bundler and rails and install them, and it will clone the API files to the /app inside the container, also run the bundle commands and copy the start.sh file inside the Linkapp container and run it.
* The start.sh runs again the bundler to install the gems of the app, delete the pids files from the container and set up the database and migrations. Finally, runs the server at 0.0.0.0 in the container.

### To Run all the app, just run -> sh run.sh or ./run.sh