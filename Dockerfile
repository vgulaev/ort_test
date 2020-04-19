FROM ruby:2.6.6

WORKDIR /project

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update
RUN apt-get install -y sudo
RUN apt-get install -y postgresql
RUN apt-get install -y apt-utils
RUN apt-get install -y nodejs
RUN apt-get install -y yarn
RUN apt-get install -y nano
RUN git clone https://github.com/vgulaev/ort_test.git
WORKDIR ort_test
RUN gem install bundle
RUN bundle install
RUN yarn install

RUN /etc/init.d/postgresql start && sudo -u postgres psql -U postgres -d postgres -c "alter user postgres with password 'root';"
RUN /etc/init.d/postgresql start && rails db:create && rails db:migrate && rails db:seed

# RUN
