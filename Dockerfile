FROM ruby:2.5-slim

RUN apt-get update && apt-get install -y build-essential git libpq-dev nodejs chromium chromedriver

ENV app /app
RUN mkdir $app
WORKDIR $app
ADD . $app

ENV BUNDLE_PATH /gems