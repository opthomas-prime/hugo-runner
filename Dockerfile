FROM nginx:1.17.10-alpine

MAINTAINER Thomas Maier <contact@thomas-maier.net>

RUN apk update \
	&& apk add git hugo --no-cache

COPY index.html /usr/share/nginx/html/index.html

COPY run.sh /run.sh

ENV HUGO_WEBSITE_REPO ""

CMD ["/run.sh"]
