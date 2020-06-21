FROM ruby:2.7.1-alpine

WORKDIR /opt/app
COPY Gemfile* ./
RUN echo "install: --no-document" > $HOME/.gemrc && \
	echo "update: --no-document" >> $HOME/.gemrc

RUN apk add --update --no-cache --virtual=.build-dependencies \
		build-base \
		linux-headers \
		zlib-dev && \
    apk add --no-cache \
		git \
		sqlite-dev \
		mariadb-dev \
		openssh \
		patch \
		nodejs \
		yarn \
		tzdata

RUN gem install bundler:2.1.4
RUN bundle install --jobs 4 --without development test && \
    apk del .build-dependencies

ADD . /opt/app/.

EXPOSE 3000

ENTRYPOINT ["bin/rails", "server", "-b", "0.0.0.0", "-e", "production"]
