FROM		alpine:latest AS base

RUN			apk add --update --virtual base \
			dumb-init \
			tmux \
			openjdk8 && \
			rm -f /var/cache/apk/*


FROM		base AS packed

COPY		--chown=root:root entrypoint /run/
RUN			wget -O /run/forge.jar https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2860/forge-1.12.2-14.23.5.2860-installer.jar

ENTRYPOINT	["dumb-init", "/run/entrypoint"]
