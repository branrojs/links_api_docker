FROM ruby:2.5.5
WORKDIR /app

RUN apt-get update && apt-get install -y nodejs
RUN ruby -v
RUN gem -v
RUN gem install bundler
RUN bundler -v
RUN gem install rails
RUN rails -v
RUN git clone https://github.com/branrojs/LinksApi.git /app
RUN cd /app
#COPY Gemfile /app/Gemfile
#COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install ; bundle update groupdate ; bundle install
ADD start.sh /start.sh
RUN chmod a+x /start.sh
CMD /start.sh
