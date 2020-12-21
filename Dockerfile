FROM ruby:2.6.3
RUN apt-get update -qq && \
  apt-get install -y build-essential && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn \
  libpq-dev                             \
  nodejs \
  yarn
RUN mkdir /home_craftsmen
WORKDIR /home_craftsmen
COPY Gemfile /home_craftsmen/Gemfile
COPY Gemfile.lock /home_craftsmen/Gemfile.lock
RUN gem install bundler
RUN bundle install
ADD . /home_craftsmen
