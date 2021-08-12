FROM ruby:2.6.2-alpine3.9

RUN apk update && \
    apk add build-base postgresql-dev mariadb-dev && \
    apk add git nodejs tzdata ncurses imagemagick file && \
    apk add curl curl-dev libxml2-dev && \
    rm -rf /var/cache/apk/*

## Geckodriver
RUN wget https://github.com/mozilla/geckodriver/releases/download/v0.23.0/geckodriver-v0.23.0-linux64.tar.gz && \
    sh -c 'tar -x geckodriver -zf geckodriver-v0.23.0-linux64.tar.gz -O > /usr/bin/geckodriver' && \
    chmod +x /usr/bin/geckodriver && \
    rm geckodriver-v0.23.0-linux64.tar.gz

## Chromedriver
RUN wget https://chromedriver.storage.googleapis.com/2.29/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    chmod +x chromedriver && \
    mv chromedriver /usr/bin/ && \
    rm chromedriver_linux64.zip

RUN mkdir /app
WORKDIR /app

COPY ./Gemfile /app/
COPY ./Gemfile.lock /app/
RUN gem update bundler
RUN bundle update --bundler
RUN bundle install

EXPOSE 80
ENV PORT 80

COPY ./ /app
RUN bundle exec rake assets:precompile

CMD ["./docker-entrypoint.sh"]
