FROM ruby:2.6.2-alpine3.9

RUN apk update && \
    apk add build-base postgresql-dev mariadb-dev && \
    apk add git nodejs tzdata ncurses imagemagick file && \
    apk add curl curl-dev libxml2-dev && \
    rm -rf /var/cache/apk/*

RUN apt-get -y install firefox

RUN mkdir /app
WORKDIR /app

COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
RUN bundle install

EXPOSE 80
ENV PORT 80

COPY ./ /app
RUN bundle exec rake assets:precompile

CMD ["./docker-entrypoint.sh"]
