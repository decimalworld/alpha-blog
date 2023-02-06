FROM ruby

WORKDIR /code/
COPY Gemfile* /code/
RUN apt update
RUN curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
RUN apt install nodejs -y
RUN bundle install

EXPOSE 3000