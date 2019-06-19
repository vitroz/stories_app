FROM ruby:2.4.1
RUN mkdir /stories_app
WORKDIR /stories_app
ADD Gemfile /stories_app/Gemfile
ADD Gemfile.lock /stories_app/Gemfile.lock
RUN gem install bundler -v 1.17.3
RUN bundle --version
RUN bundle install
ADD . /stories_app
