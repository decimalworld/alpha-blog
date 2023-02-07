FROM ruby

WORKDIR /code/
COPY Gemfile* /code/
COPY build.sh /code/
RUN sh build.sh

EXPOSE 3000