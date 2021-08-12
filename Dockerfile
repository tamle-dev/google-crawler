FROM ruby:2.6.2-alpine3.9

RUN apk update && \
    apk add build-base postgresql-dev mariadb-dev && \
    apk add git nodejs tzdata ncurses imagemagick file && \
    apk add curl curl-dev libxml2-dev && \
    rm -rf /var/cache/apk/*

RUN apk add chromium
RUN apk add chromium-chromedriver

RUN mkdir /app
WORKDIR /app

COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
RUN gem update bundler
RUN bundle install

EXPOSE 3000

COPY ./ /app
RUN bundle exec rake assets:precompile

CMD ["./docker-entrypoint.sh"]
