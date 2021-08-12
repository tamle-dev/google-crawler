FROM ruby:2.6.2-alpine3.9

RUN apk update && \
    apk add build-base postgresql-dev mariadb-dev && \
    apk add git nodejs tzdata ncurses imagemagick file && \
    apk add curl curl-dev libxml2-dev && \
    rm -rf /var/cache/apk/*

RUN curl https://fonts.google.com/download?family=Montserrat --output /usr/share/fonts/font.zip && \
    mkdir -p /usr/share/fonts/Montserrat && \
    unzip /usr/share/fonts/font.zip -d /usr/share/fonts/Montserrat

RUN mkdir /app
WORKDIR /app

COPY ./backend-ror/Gemfile /app/
COPY ./backend-ror/Gemfile.lock /app/
RUN bundle install

EXPOSE 80
ENV PORT 80

COPY ./backend-ror /app
RUN bundle exec rake assets:precompile

CMD ["./docker-entrypoint.sh"]
