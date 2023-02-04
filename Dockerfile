FROM ruby:3.2.0-slim

ENV INSTALL_PATH /opt/rails-template/
RUN mkdir -p $INSTALL_PATH

COPY . $INSTALL_PATH
