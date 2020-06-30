FROM ruby:2.7.1-alpine

ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_ENV=production
ENV NODE_ENV=production
ENV RACK_ENV=production
ENV BUNDLE_VERSION 2.1.4
ENV NODE_VERSION 14.3.0-r0
ENV FIREBASE_API_KEY=
ENV FIREBASE_DOMAIN=
ENV FIREBASE_DATABASE_URL=
ENV FIREBASE_PROJECT_ID=
ENV FIREBASE_STORAGE_BUCKET=
ENV FIREBASE_MESSAGING_SENDER_ID=
ENV FIREBASE_APP_ID=

WORKDIR /opt/app
COPY Gemfile* ./
RUN echo "install: --no-document" > $HOME/.gemrc && \
	echo "update: --no-document" >> $HOME/.gemrc

# Install:
# - MariaDB used to MySQL
# - SQLite
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
		"nodejs-current=${NODE_VERSION}" \
		yarn \
		tzdata

RUN gem install bundler -v ${BUNDLE_VERSION} && \
	bundle config set without 'development test'

RUN bundle install --jobs 4 && \
    apk del --purge .build-dependencies

ADD . /opt/app/.

# Assets
RUN rake assets:precompile

# Run as non-privileged user
RUN addgroup app && \
	adduser -S app && \
	chown -R app:app /opt/app

USER app

EXPOSE 3000

ENTRYPOINT ["bin/rails", "server", "-b", "0.0.0.0"]
