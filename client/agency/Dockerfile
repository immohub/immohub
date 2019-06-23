FROM node:12.4-alpine

RUN mkdir /app
WORKDIR /app

ADD . ./

RUN yarn --pure-lockfile && yarn build

CMD yarn prod
