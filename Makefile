init:
	@cp .env.example .env
	@echo "Is this a production environment? [y/N]" && read ans && if [ "$$ans" = "y" ]; then ln -s docker-compose.prod.yml docker-compose.yml; else ln -s docker-compose.local.yml docker-compose.yml; fi

up:
	@docker compose up -d
start: up

down:
	@docker compose down --remove-orphans
stop: down

restart: down up

logs:
	@docker compose logs
tail:
	@docker compose logs -f

ps:
	@docker compose ps

clear:
	@docker compose down --remove-orphans --volumes
	@rm docker-compose.yml
	@rm .env

login-passbolt:
	@docker compose exec passbolt bash

backup:
	@echo "⏳ 💾 Create backup ./backups/backup_$$(date '+%Y-%m-%d').sql"
	@docker compose exec db bash -c 'mysqldump -u$${MYSQL_USER} -p$${MYSQL_PASSWORD} $${MYSQL_DATABASE}' > ./backups/backup_$$(date '+%Y-%m-%d').sql
	@docker compose cp passbolt:/etc/passbolt/gpg/serverkey_private.asc ./backups/serverkey_private.asc
	@docker compose cp passbolt:/etc/passbolt/gpg/serverkey.asc ./backups/serverkey.asc
	@docker compose exec passbolt tar cvfzp - -C /usr/share/php/passbolt/ webroot/img/avatar > ./backups/passbolt-avatars_$$(date '+%Y-%m-%d').tar.gz
	@echo "✅ 💾 ./backups/backup_$$(date '+%Y-%m-%d').sql"
