D			:= docker
DC			:= $(D) compose

VD			:= /opt/docker/gitea

ENV_FILE	:= ./.env

## FUNCTION TO SET A VALUE, GIVEN A VARIABLE ON THE $(ENV_FILE)
SET_PASS			= \
read -p "\x1b[31m$(1)\x1b[0m > " -s TMPVAR ; \
sed -i "s|^.*$(1)|$(1)=\"$${TMPVAR}\"|g" $(ENV_FILE) ;

all:			daemon

exec:
	$(DC) exec -it $(SERVICE) $(EXEC)

run:			build
	$(DC) run -it $(SERVICE) $(EXEC)

logs:
	$(DC) logs

up:				build
	$(DC) up

daemon:			build
	$(DC) up -d

clean:
	sudo rm -rf $(VD)

fclean:			clean
	$(D) system prune -af

down:
	$(DC) down

build:			$(ENV_FILE)
	$(DC) build

re:				down
	$(DC) build --no-cache

$(ENV_FILE):
	cp -f $(ENV_FILE){.template,}
	@printf "Setup env file\n"
	@$(call SET_PASS,MINECRAFT_WORLD)
