# Passbolt Setup

This is my [Passbolt](https://www.passbolt.com/) Docker 🐳 Setup.

## Setup

Run the following to clone the repository.

```bash
git clone git@github.com:tjventurini/passbolt-setup.git
```

Now run `make init` to initialize the setup and follow the instructions from there.

## Commands

In the `Makefile` you have the following commands available. You can run them using `make <command>`.

`make init` This command copies the .env.example file to .env. It then asks if this is a production environment. If the answer is "y", it creates a symbolic link from docker-compose.prod.yml to docker-compose.yml. If the answer is not "y", it creates a symbolic link from docker-compose.local.yml to docker-compose.yml.

`make up` and `make start`: These commands start the Docker Compose services in detached mode.

`make down` and `make stop`: These commands stop the Docker Compose services and remove the containers, networks, and, if specified, volumes.

`make restart`: This command restarts the Docker Compose services by first executing `down` and then `up`.

`make logs`: This command shows the logs of the Docker Compose services.

`make tail`: This command follows the logs of the Docker Compose services.

`make ps`: This command shows the status of the Docker Compose services.

`make clear`: This command stops the Docker Compose services, removes the containers, networks, volumes, docker-compose.yml file, and .env file.

`make login-passbol`t: This command logs into the passbolt service's container with a bash shell.

`make login-db`: This command logs into the db service's container and starts a MySQL shell with the specified user, password, and database.

`make backup`: This command creates a backup of the database and some specific files. It first echoes a message indicating that the backup is being created. It then executes a mysqldump command to create a SQL dump of the database. This dump is redirected to a file in the ./backups directory. It then copies the private and public server keys from the passbolt service's container to the ./backups directory. It also creates a tarball of the avatars directory in the passbolt service's container and saves it in the ./backups directory. Finally, it echoes a message indicating that the backup has been created.

`create-admin`: Reads firstname, lastname and email from the command line and creates an admin user with these information.