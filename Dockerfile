FROM ruby:3.2.0-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

ENV BUNDLER_VERSION=2.4.6
RUN gem update --system && gem install bundler -v $BUNDLER_VERSION

ARG APP_NAME
ENV INSTALL_PATH /opt/$APP_NAME
RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile* ./

RUN bundle install --retry=4

COPY bin/docker-entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

ARG CONT_PORT
EXPOSE $CONT_PORT

CMD bundle exec rails s -p $EXPOSED_PORT -b 0.0.0.0
