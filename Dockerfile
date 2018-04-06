FROM alpine:3.7

RUN apk update \
	&& apk add --no-cache \
	gcc \
	g++ \
	make \
	git \
	patch \
	perl \
	perl-dev \
	curl \
	wget

RUN curl -L https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm > cpanm \
	&& chmod +x cpanm \
	&& ./cpanm App::cpanminus \
	&& rm -fr ./cpanm

RUN cpanm Mojolicious

RUN mkdir /app
ADD app /app
WORKDIR /app

CMD ["hypnotoad", "-f", "app"]
