FROM ruby:2.7.6
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /RubyProject
WORKDIR /RubyProject
ADD Gemfile /RubyProject/Gemfile
ADD Gemfile.lock /RubyProject/Gemfile.lock
RUN bundle install
ADD . /RubyProject
