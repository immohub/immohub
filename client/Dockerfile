FROM node:12

RUN yarn config set workspaces-experimental true

RUN mkdir /app
WORKDIR /app

ADD . ./

RUN yarn --pure-lockfile

CMD yarn start
