FROM ruby:3.1.0

ARG APP_PATH=/app

ENV APP_PATH=${APP_PATH:-/app}

RUN mkdir -p $APP_PATH && mkdir -p $APP_PATH/tmp/pids

RUN apt-get update && apt-get install -y nodejs --no-install-recommends
RUN gem install bundler:2.2.21

# Workdir
WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock ${APP_PATH}/

RUN bundle install --jobs 4

# Copy Source
COPY . ${APP_PATH}/

EXPOSE 3001

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
