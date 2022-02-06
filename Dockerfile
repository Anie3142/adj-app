FROM ruby:alpine

RUN apk update -qq && apk upgrade && apk add curl

WORKDIR /home/myapp

RUN addgroup -g 1000 myapp && \
    adduser -u 1000 -G myapp -h /home/myapp -D myapp

USER myapp

COPY ./http_server/http_server.rb /home/myapp/

EXPOSE 80

CMD ["ruby", "http_server.rb"]

