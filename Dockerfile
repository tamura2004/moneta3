FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn
RUN mkdir /moneta3
WORKDIR /moneta3
COPY Gemfile /moneta3/Gemfile
COPY Gemfile.lock /moneta3/Gemfile.lock
RUN bundle install
COPY . /moneta3

RUN yarn

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]