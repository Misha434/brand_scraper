FROM ruby:2.7.4-alpine

RUN apk update

WORKDIR /brand_scraper

COPY Gemfile* ./
RUN gem install bundler \
    && bundle install

COPY . .