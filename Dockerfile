FROM ruby:2.3.1

# Install dependencies.
COPY . /app
WORKDIR /app


RUN gem install analytics-ruby --no-ri --no-rdoc
RUN gem install nyny --no-ri --no-rdoc
# ENV vars
ENV DEBUG=*
ENV PORT=4002

EXPOSE 4002
#ENTRYPOINT ["ruby"]
#CMD ["index.rb"]



