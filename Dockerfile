FROM ruby:2.4.9

RUN bundle config --global frozen 1

WORKDIR /usr/src/app
COPY . /usr/src/app
RUN bundle install

EXPOSE 4567
ENTRYPOINT ["/bin/bash","run-app.sh"]