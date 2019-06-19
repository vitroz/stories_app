FROM ruby:2.4.1
RUN mkdir /stories_app
WORKDIR /stories_app
COPY Gemfile /stories_app/Gemfile
COPY Gemfile.lock /stories_app/Gemfile.lock
RUN gem install bundler -v 2.0.1
RUN bundle --version
RUN bundle install
COPY . /stories_app

CMD ["rails", "server", "-b", "0.0.0.0"]
